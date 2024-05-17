package kr.co.itcruit.recruit.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.itcruit.ServiceResult;
import kr.co.itcruit.mapper.IRecruitMapper;
import kr.co.itcruit.recruit.service.IRecruitService;
import kr.co.itcruit.vo.AlarmVO;
import kr.co.itcruit.vo.EntIntroQSTNANSRVO;
import kr.co.itcruit.vo.EnterpriseVO;
import kr.co.itcruit.vo.HireSttsVO;
import kr.co.itcruit.vo.InterestNoticesVO;
import kr.co.itcruit.vo.MemberProcessCheckVO;
import kr.co.itcruit.vo.PaginationInfoVO;
import kr.co.itcruit.vo.RecruitVO;
import kr.co.itcruit.vo.ResumeVO;


@Service
public class RecruitServiceImpl implements IRecruitService {

	@Inject
	private IRecruitMapper recruitMapper;
	
	
	@Override
	public List<RecruitVO> selectInitRecruitList(PaginationInfoVO<RecruitVO> pagingVO) {
		
		return recruitMapper.selectInitRecruitList(pagingVO);
	}


	@Override
	public RecruitVO recruitDetail(String recruitNo, String pstnCmmncdNm) {
		recruitMapper.incrementRecruitHit(recruitNo, pstnCmmncdNm);
		return recruitMapper.recruitDetail(recruitNo, pstnCmmncdNm);
		
	}


	@Override
	public List<String> hireCmmnd(String recruitNo) {
		
		return recruitMapper.hireCmmnd(recruitNo);
	}


	@Override
	public EnterpriseVO selectLikeEnt(EnterpriseVO enterpriseVO) {
		
		return recruitMapper.selectLikeEnt(enterpriseVO);
	}


	@Override
	public RecruitVO selectLikeRecruit(RecruitVO recruitVO) {
		return recruitMapper.selectLikeRecruit(recruitVO);
	}


	public List<ResumeVO> selectListApplicant(String accountId, String recruitNo, String pstnCmmncdNm) {
		
		return recruitMapper.selectListApplicant(accountId, recruitNo, pstnCmmncdNm);
	}


	@Override
	public List<InterestNoticesVO> checkRecruit(String accountId) {
		return recruitMapper.checkRecruit(accountId);
	}


	@Override
	public List<RecruitVO> getRecruitInfoByNo(String rNo) {
		// TODO Auto-generated method stub
		return recruitMapper.selectListByRecruitNo(rNo);
	}


	@Override
	public RecruitVO selectRecruit(String recruitNo, String pstnCmmncdNm) {
		return recruitMapper.selectRecruit(recruitNo, pstnCmmncdNm);
	}


	@Override
	public void saveAnswer(EntIntroQSTNANSRVO ansrVO) {
		recruitMapper.saveAnswer(ansrVO);
	}


	@Override
	public EntIntroQSTNANSRVO selectQstnAnsr(EntIntroQSTNANSRVO ansrVO) {
		
		return recruitMapper.selectQstnAnsr(ansrVO);
	}


	@Override
	public void updateAnswer(EntIntroQSTNANSRVO ansrVO) {
		recruitMapper.updateAnswer(ansrVO);
		
	}


	@Override
	public EntIntroQSTNANSRVO setQstnAnsr(EntIntroQSTNANSRVO ansrVO) {
		return recruitMapper.setQstnAnsr(ansrVO);
		
	}


	@Override
	public List<HireSttsVO> recruitHire(String recruitNo, String pstnCmmncdNm) {
		return recruitMapper.recruitHire(recruitNo, pstnCmmncdNm);
	}


	@Override
	public List<RecruitVO> selectrecommendRecruitList(PaginationInfoVO<RecruitVO> pagingVO) {
		return recruitMapper.selectrecommendRecruitList(pagingVO);
	}


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@Override
	public List<MemberProcessCheckVO> getProcessListById(String loginUser) {
		return recruitMapper.getProcessListById(loginUser);
	}


	//기업으로부터 온 인재제안 가져오기
	@Override
	public List<AlarmVO> getTalentList(String loginUser) {
		return recruitMapper.getTalentList(loginUser);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}