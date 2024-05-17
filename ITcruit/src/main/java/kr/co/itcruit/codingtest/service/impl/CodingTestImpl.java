package kr.co.itcruit.codingtest.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.itcruit.codingtest.service.ICodingTestService;
import kr.co.itcruit.codingtest.utils.CompileUtils;
import kr.co.itcruit.mapper.ICodingtestMapper;
import kr.co.itcruit.mapper.IEntCodingtestMapper;
import kr.co.itcruit.vo.AccountVO;
import kr.co.itcruit.vo.CodingtestBoardVO;
import kr.co.itcruit.vo.CodingtestVO;
import kr.co.itcruit.vo.EachProcessApplyPassVO;
import kr.co.itcruit.vo.EntCodingtestVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CodingTestImpl implements ICodingTestService{

	@Inject
	private ICodingtestMapper codingtestMapper;
	
	@Inject
	private IEntCodingtestMapper entCodingtestMapper;
	
	/**
	 *	문제 전체 리스트 출력(아직 페이징 미처리)
	 */
	@Override
	public List<CodingtestVO> selectList(CodingtestVO codeVO) {
		return codingtestMapper.selectList(codeVO);
	}
	
	/**
	 * 문제 번호로 상세페이지 가져오기
	 * @param qstnNo
	 * @return
	 */
	@Override
	public CodingtestVO getQstnByNo(int qstnNo) {
		return codingtestMapper.selectQstnByNo(qstnNo);
	}

	
	@Override
	public String doCompile(CodingtestVO codingtestVO) {
		
		CompileUtils compileUtils = new CompileUtils();
		CodingtestVO vo = new CodingtestVO();
		String result = "";
		
		//기업코테가 참이면 이 함수를 진행
		if(codingtestVO.isEntTest()) {
			
			String realCode = getRealCode(codingtestVO.getQstnMcode(), codingtestVO.getInput(), codingtestVO.getOutput());
			log.info(realCode);
			//메인코드에 입출력값을 튜닝해서 삽입
			vo.setQstnMcode(realCode);
			//사용자입려고드 삽입
			vo.setCode(codingtestVO.getCode());
			
			log.info("기업코테 컴파일 유틸>>>>>>>>>>>>>>" + vo);
			
			try {
				result = compileUtils.doCompile(vo);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			log.info("기업코테 컴파일 결과>>>>>>>>>>>>>>>>>>>" + result);
			
			if(result.contains("에러"))
				result = "컴파일 에러";
			
			if(result.contains("통과")) {
				result = "통과";
			} else {
				result = "실패";
			}
			
			return result;
		}
		
		//출력해줄

		log.info("doCompile 첫 진입>>>>>>" + codingtestVO);
		
		
		boolean ifSubmit = codingtestVO.isFlag();
		
		//flag - 테스트인지, 제출인지 판단용
		if(ifSubmit) {
			vo = codingtestMapper.doSubmit(codingtestVO);
		}
		else {
			vo = codingtestMapper.doTest(codingtestVO);			
		}
		
		vo.setQstnMcode(getRealCode(vo.getQstnMcode(), vo.getInput(), vo.getOutput()));
		vo.setQstnScr(codingtestVO.getQstnScr());
		
		//사용자로 부터 입력받은 값을 저장
		vo.setCode(codingtestVO.getCode());
		//vo에 flag값을 담아서 전달
		vo.setFlag(codingtestVO.isFlag());
		
		try {
			result = compileUtils.doCompile(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//먼저코드를 solving_test에 저장
		//codingtestVO에 담긴 값: accountId, code(사용자 입력값), qstnNo
		
		log.info("compile >>>>>>>>>>>>>" + codingtestVO);
		log.info("accountId>>>" + codingtestVO.getAccountId());
		log.info("code>>>" + codingtestVO.getCode());
		log.info("qstnNo>>>" + codingtestVO.getQstnNo());
		
		
		boolean correct = result.contains("통과");
		
		if(correct) {
			codingtestVO.setPassYn("Y");
		} else {
			codingtestVO.setPassYn("N");
		}
		
		log.info("compileUtils>>>>>>>>>>\n" + vo);
		
		log.info("compileUtils>>>>>>>>>>\n" + codingtestVO);
		
		
		if(ifSubmit) {
			//조회된 값이 없으면 insert
			if(codingtestMapper.checkSolveByVO(codingtestVO) == null ||
					codingtestMapper.checkSolveByVO(codingtestVO).equals("")
					) {
				codingtestMapper.insertSolve(codingtestVO);
				//insert query
				
				log.info("doCompile>>>>>" + codingtestVO);
				
				//맞았으면 점수추가
				if(correct) {
					//codingtestVO.getQstnScr();
					codingtestMapper.getScore(codingtestVO);
				}
				return result;
				
			} else {   //있으면 Y or N인 상태 >> update 
				
//				update 실행
				//조회된 값이 있고 그 패스값이 "Y"이면  새로 입력받은 코드를 업데이트만 하고 
				//그 문제를 푼 점수는 더하지 않음
				
				//값을 조회하고
				String res = codingtestMapper.checkSolveByVO(codingtestVO);
				
				//이미 맞은 문제일 경우 결과에 상관없이 
				//무조건 코드만 업데이트
				if(res.equals("Y")) {
					// 코드만 update할 값은 코드만
					codingtestMapper.updateCode(codingtestVO);
					return result;
				}
				
				log.info("doCompile>>>>>" + codingtestVO);
				//이전 값이 틀린 문제일 경우
				if(res.equals("N")) {
					codingtestMapper.updateSolveByVO(codingtestVO);
					//새로 풀어서 맞은 경우 점수 추가
					if(correct) {
						codingtestMapper.getScore(codingtestVO);
					}
					
					return result;
				} 
				
			}	
		}
		
		return result;
	}
	
	public String getRealCode(String mainCode, String input, String output) {
		
		log.info("getRealCode.mainCode>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + mainCode);
		log.info("getRealCode.input>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + input);
		log.info("getRealCode.output>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + output);
		
		String realCode = "";
		
		realCode = mainCode.replace("String inputfilePath", 
				"String inputfilePath =" + input +";");
		
		realCode = realCode.replace("String outputfilePath", 
				"String outputfilePath =" + output +";");
		
		log.info("getRealCode>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + realCode);
		
		return realCode;
		
	}

	@Override
	public CodingtestVO getOptionInfo() {
		CodingtestVO codingtestVO = new CodingtestVO();
		
		codingtestVO.setCtgryList(codingtestMapper.getCtgryList());
		codingtestVO.setQstnSubjectList(codingtestMapper.getSubjectList());
		return codingtestVO;
	}

	@Override
	public AccountVO getMyCodePower(String accountId) {
		
		AccountVO accountVO = codingtestMapper.getNickAndScore(accountId);
		accountVO.setCodePower(codingtestMapper.getCodePower(accountId));
		
		log.info("getMyCodePower>>>>>>>>>>>" + accountVO);
		
		return accountVO; 
	}

	@Override
	public List<CodingtestBoardVO> getCodeBoardByQstnNo(int qstnNo) {
		return codingtestMapper.getCodeBoardByQstnNo(qstnNo);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@Override
	public EntCodingtestVO getEntCodingtestByNo(int entCodingtestNo) {
		
		return entCodingtestMapper.getEntCodingtestByNo(entCodingtestNo);
	}

	@Override
	public String checkNormalTester(EachProcessApplyPassVO eapVO) {
		// TODO Auto-generated method stub
		return entCodingtestMapper.checkNormalTester(eapVO);
	}

	@Override
	public void submitEntCodingtest(EntCodingtestVO entCodingtestVO) {
		
		//여기서 체크해서 이미 제출한 결과가 있으면 update 아니면 insert
		if(entCodingtestMapper.checkSubmitEntCodingtest(entCodingtestVO) > 0) {
			entCodingtestMapper.updateEntCodingtest(entCodingtestVO);
		} else {
			entCodingtestMapper.insertEntCodingtest(entCodingtestVO);
		}
	}

	@Override
	public CodingtestVO getInfo(int qstnNo) {
		//codingtestMapper
		return codingtestMapper.getInfo(qstnNo);
	}

	@Override
	public List<CodingtestVO> entSelectList(CodingtestVO codeVO) {
		return codingtestMapper.entSelectList(codeVO);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@Override
	public CodingtestVO getTestDetail(int qstnNo) {
		
		return codingtestMapper.getTestDetail(qstnNo);
	}
	

}
