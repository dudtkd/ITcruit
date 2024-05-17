package kr.co.itcruit.mypage.enterprise.controller;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;

import kr.co.itcruit.codingtest.service.ICodingTestService;
import kr.co.itcruit.mypage.enterprise.service.IMyEnterpriseService;
import kr.co.itcruit.mypage.enterprise.service.ISearchTalentService;
import kr.co.itcruit.vo.AccountVO;
import kr.co.itcruit.vo.ApplyProcessListVO;
import kr.co.itcruit.vo.BoardBBS201PaginationVO;
import kr.co.itcruit.vo.BoardBBS202PaginationVO;
import kr.co.itcruit.vo.BoardVO;
import kr.co.itcruit.vo.CodingtestVO;
import kr.co.itcruit.vo.CustomPaginationInfoVO;
import kr.co.itcruit.vo.CustomUser;
import kr.co.itcruit.vo.EntAccountVO;
import kr.co.itcruit.vo.EntIntroQSTNVO;
import kr.co.itcruit.vo.EnterpriseVO;
import kr.co.itcruit.vo.MyEntInfoVO;
import kr.co.itcruit.vo.RecruitVO;
import kr.co.itcruit.vo.SearchTalentVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("myPage/enterprise")
@Slf4j
public class EnterpriseController {
	
	@Autowired
	private IMyEnterpriseService myEntService;
	
	@Inject 
	private ISearchTalentService searchTalentService;
	
	@Inject
	private ICodingTestService codingtestService;
	

	@PreAuthorize("hasAnyRole('ROLE_AUTH103')")
	@RequestMapping(value = "/entInfo", method = RequestMethod.GET)
	public String entInfo(Model model) {
		
		
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		AccountVO av = user.getAccount();
		
		int entNo = av.getEntNo();
		String customEntNo = "_" + String.valueOf(entNo);
		String customEntNo2 = "_" + String.valueOf(entNo) + "_";
		 
		int todayApply = myEntService.getTodayApply(customEntNo);
		int totalRecruitCount = myEntService.getTotalRecruitCount(customEntNo);
		int totalApply = myEntService.getTotalApply(customEntNo);
		int endedRecruitCount = myEntService.getEndedRecruitCount(customEntNo);
		EnterpriseVO enterMyInfo = myEntService.getEnterMyInfo(entNo);
		List<Map<String, Object>> progressRecruit = myEntService.getProgressRecruit(entNo);
		List<Map<String, Object>> recentApply = myEntService.getRecentApply(customEntNo2);
		List<RecruitVO> deadLineRecruit = myEntService.getDeadLineRecruit(entNo);
		
		log.info("############## todayApply : " + todayApply);
		log.info("############## totalRecruitCount : " + totalRecruitCount);
		log.info("############## totalApply : " + totalApply);
		log.info("############## endedRecruitCount : " + endedRecruitCount);
		log.info("############## enterMyInfo : " + enterMyInfo);
		log.info("############## progressRecruit : " + progressRecruit);
		log.info("############## recentApply : " + recentApply);
		log.info("############## deadLineRecruit : " + deadLineRecruit);
		
		MyEntInfoVO entStatVO = new MyEntInfoVO();
		entStatVO.setTodayApply(todayApply);
		entStatVO.setTotalRecruitCount(totalRecruitCount);
		entStatVO.setTotalApply(totalApply);
		entStatVO.setEndedRecruitCount(endedRecruitCount);
		entStatVO.setEnterMyInfo(enterMyInfo);
		entStatVO.setProgressRecruit(progressRecruit);
		entStatVO.setRecentApply(recentApply);
		entStatVO.setDeadLineRecruit(deadLineRecruit);
		model.addAttribute("entStatVO",entStatVO);
		  
		
		return "entmypage/entInfo";
		
		
	}
	
	@RequestMapping(value = "/recruitRegisterForm", method = RequestMethod.GET)
	public String recruitRegisterForm(Model model) {
		
		
		model.addAttribute("tOrf1", "true");
		model.addAttribute("show1", "show");
		model.addAttribute("active1", "active");
		
		List<Map<String, String>> pstnCmmncdBuffer= myEntService.getPstnCmmncdList();
		String[] pstnCmmncdNms = new String[pstnCmmncdBuffer.size()];
		
		int index = 0;
		log.info("####### pstnCmmncdBuffer :" + pstnCmmncdBuffer);
		for (Map<String, String> map : pstnCmmncdBuffer) {
			
		    if (map.containsKey("CMMNCD_GRP_NM")) { // 안전한 접근을 위해 키 존재 여부를 확인
		    	pstnCmmncdNms[index] = map.get("CMMNCD_GRP_NM"); // 해당 키의 값을 배열에 저장
		        index++; // 인덱스 증가
		    }
			
			
		}
		
		Gson gson = new Gson();
		String json = gson.toJson(pstnCmmncdNms);
		log.info("####### pstnCmmncdNms : " + pstnCmmncdNms);
		model.addAttribute("pstnCmmncdNms", json);
		
		
		List<Map<String, String>> preferCmmncdNms = myEntService.getPreferCmmncdNm();
		log.info("####### preferCmmncdNms : " + preferCmmncdNms);
		model.addAttribute("preferCmmncdNms", preferCmmncdNms);
		
		
		return "entmypage/recruitRegister";
		
	}
	
	
	@RequestMapping(value = "/recruitProcessQuestion", method = RequestMethod.GET)
	public String recruitProcessQuestion(
			
			@RequestParam(name="page", required = false, defaultValue ="1") int currentPage,
			@RequestParam(required = false, defaultValue = "defaultSort") String searchType,
			@RequestParam(required = false) String searchWord,
			@RequestParam(required = false) String processYn,
			@RequestParam(required = false) String recruitYn,
			
			Model model) {
		 
		log.info("#################### processYn : " + processYn);
		log.info("#################### recruitYn : " + recruitYn);
		
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		AccountVO av = user.getAccount();
		
		int entNo = av.getEntNo();
		
		CustomPaginationInfoVO<RecruitVO> customPagingVO = new CustomPaginationInfoVO<RecruitVO>();
		
			
		customPagingVO.setSearchWord(searchWord);
		customPagingVO.setSearchType(searchType);
		customPagingVO.setProcessYn(processYn);
		customPagingVO.setRecruitYn(recruitYn);
		customPagingVO.setEntNo(entNo);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("searchType", searchType);
		model.addAttribute("processYn", processYn);
		model.addAttribute("recruitYn", recruitYn);
		
		
		// 현재 페이지
		customPagingVO.setCurrentPage(currentPage);
		
		// 1. 총 게시글 수 조회 
		int totalRecord = myEntService.selectRecruitCount(customPagingVO);
		customPagingVO.setTotalRecord(totalRecord);
		
		List<RecruitVO> searchList = myEntService.selectRecruitList(customPagingVO);
		
		customPagingVO.setDataList(searchList);
		
		
		
		model.addAttribute("customPagingVO", customPagingVO);
		
		model.addAttribute("tOrf1", "true");
		model.addAttribute("show1", "show");
		model.addAttribute("active2", "active");
	
		
		return "entmypage/recruitProcessQuestion";
		
	}
	
	@RequestMapping(value = "/recruitContectList", method = RequestMethod.GET)
	public String recruitList(@RequestParam(required = false,  name="recruitTtl") String recruitTtl, Model model) {
		
		
		
		model.addAttribute("tOrf2", "true");	
		model.addAttribute("show2", "show");
		model.addAttribute("active3", "active");
		model.addAttribute("recruitTtl", recruitTtl);
		
		
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		AccountVO av = user.getAccount();
		
		int entNo = av.getEntNo();
		
		List<RecruitVO> recruitList = myEntService.recruitSelectListByEntNo(entNo);
		model.addAttribute("recruitList", recruitList);
		
		String recruitNo = "";
		String pstnCmmncdNm = "";
		if(!recruitList.isEmpty() && recruitList.size() != 0 && recruitList != null) {
			
			recruitNo = recruitList.get(0).getRecruitNo();
			pstnCmmncdNm = recruitList.get(0).getPstnCmmncdNm();
			
		}
		
		
		List<ApplyProcessListVO> selectApplyProcessList = myEntService.selectApplyProcessList(recruitNo, pstnCmmncdNm);
		model.addAttribute("selectApplyProcessList", selectApplyProcessList);
		
		
		return "entmypage/recruitContectList";
		
	}
	
	@RequestMapping(value = "/recruitStatistics", method = RequestMethod.GET)
	public String recruitStatistics(Model model) {
		
		
		
		model.addAttribute("tOrf2", "true");	
		model.addAttribute("show2", "show");
		model.addAttribute("active4", "active");
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		AccountVO av = user.getAccount();
		
		int entNo = av.getEntNo();
		
		List<RecruitVO> recruitList = myEntService.recruitSelectListByEntNo(entNo);
		model.addAttribute("recruitList", recruitList);
		
		
		
		return "entmypage/recruitStatistics";
		
	}
	
	@RequestMapping(value = "/talentFind", method = RequestMethod.GET)
	public String talentFindPage(Model model) {
		
		
		SearchTalentVO option = new SearchTalentVO();
		option = searchTalentService.getOptionInfo();
		model.addAttribute("active5", "active");
		model.addAttribute("option", option);
		
		return "entmypage/talentFind";
		
	}
	
	
	@RequestMapping(value = "/searchTalent.do", method = RequestMethod.POST)
	public String talentFind(
			Model model,
			SearchTalentVO talentVO
			) {
		
//		talentVO.countSelectedOption();
//		int select = talentVO.getSelect();
//		log.info(">>>>>>>>>>>>>" + select);
		
		log.info("talentFind >>>>>>>>>>>>>>" + talentVO );
		
		SearchTalentVO option = new SearchTalentVO();
		option = searchTalentService.getOptionInfo();
		option.setCarrer(talentVO.getCarrer());
		option.setPstn(talentVO.getPstn());
		option.setLang(talentVO.getLang());
		option.setLcl(talentVO.getLang());
//		
		model.addAttribute("active5", "active");
		model.addAttribute("option", option);
		
		List<SearchTalentVO> talentList = searchTalentService.getTalentList(talentVO);		
		
		
		log.info(">>>>>>>>>>>>>>>>>>>>>>>>" + talentList); 
		model.addAttribute("talentList", talentList);
		return "entmypage/talentFind";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/entRating", method = RequestMethod.GET)
	public String entRating(Model model) {
		
		
		model.addAttribute("active6", "active");
		
		return "entmypage/entRating";
		
	}
	
	@RequestMapping(value = "/entAccountApplication", method = RequestMethod.GET)
	public String entAccountApplication(Model model) {
		
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		AccountVO av = user.getAccount();
		

		List<EntAccountVO> idList = myEntService.selectId(av.getEntNo());
		
		model.addAttribute("idList", idList);
		
		model.addAttribute("entNo", av.getEntNo());
		
		model.addAttribute("active7", "active");
		
		return "entmypage/entAccountApplication";
		
	}
	
	@RequestMapping(value = "/entInquiryDetails", method = RequestMethod.GET)
	public String entInquiryDetails(Model model) {
		
		
		model.addAttribute("active8", "active");
		
		return "entmypage/entInquiryDetails";
		
	}
	
	@RequestMapping(value = "/entNoticeForm.do" , method = RequestMethod.GET)
	public String entNoticeForm() {
		
		return "entmypage/entNoticeForm";
		
	}
	
	
	@RequestMapping(value = "/entBoard", method = RequestMethod.GET)
	public String entBoard(Model model,
			@RequestParam(name = "bbs201ListPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(name = "bbs202ListPage", required = false, defaultValue = "1") int currentPage1
			) {
		
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		AccountVO av = user.getAccount();
		
		
		BoardBBS201PaginationVO<BoardVO> BBS201PagingVO = new BoardBBS201PaginationVO<BoardVO>();
		
		BBS201PagingVO.setEntNo(av.getEntNo());
		
		BBS201PagingVO.setCurrentPage(currentPage);
		
		int BBS201Count = myEntService.BBS201Count(av.getEntNo());
		
		BBS201PagingVO.setTotalRecord(BBS201Count);
		
		List<BoardVO> BBS201List = myEntService.BBS201List(BBS201PagingVO);
		
		BBS201PagingVO.setDataList(BBS201List);
		
		model.addAttribute("BBS201PagingVO", BBS201PagingVO);
		
		
		
		BoardBBS202PaginationVO<BoardVO> BBS202PagingVO = new BoardBBS202PaginationVO<BoardVO>();
		
		BBS202PagingVO.setEntNo(av.getEntNo());
		
		BBS202PagingVO.setCurrentPage(currentPage1);
		
		int BBS202Count = myEntService.BBS202Count(av.getEntNo());
		
		BBS202PagingVO.setTotalRecord(BBS202Count);
		
		List<BoardVO> BBS202List = myEntService.BBS202List(BBS202PagingVO);
		
		BBS202PagingVO.setDataList(BBS202List);
		
		model.addAttribute("BBS202PagingVO", BBS202PagingVO);
		
		model.addAttribute("active9", "active");
		return "entmypage/entBoard";
		
	}
	
	
	@RequestMapping(value = "/processDetail", method = RequestMethod.GET)
	public String processRegister(
			@RequestParam("recruitNo") String recruitNo, 
			@RequestParam("pstnCmmncdNm") String pstnCmmncdNm,
			@RequestParam("recruitTtl") String recruitTtl,
			@RequestParam(required = false) String pastQstnCtgryNm,
			@RequestParam(required = false) String qstnSubject,
			@RequestBody(required = false) CodingtestVO codeVO,
			HttpSession session,
			Model model
			){
//		log.info("################## recruitNo : " + recruitNo);
//		log.info("################## pstnCmmncdNm : " + pstnCmmncdNm);
//		log.info("################## recruitTtl : " + recruitTtl);
		
		List<ApplyProcessListVO> apList= myEntService.selectProcess(recruitNo, pstnCmmncdNm);
		List<EntIntroQSTNVO> entIntroQstnNo = myEntService.getentIntroQstnNo(recruitNo, pstnCmmncdNm);
		List<EntIntroQSTNVO> entCodingTestNo = myEntService.getEntCodingTestNo(recruitNo, pstnCmmncdNm);
		
		Gson gson = new Gson();
		String json = gson.toJson(entIntroQstnNo);
		String jsonTwo = gson.toJson(entCodingTestNo);
		
		
		log.info("################## apList : " + apList);
		log.info("################## recruitTtl : " + recruitTtl);
		
		
		List<CodingtestVO> codeList = codingtestService.entSelectList(codeVO);
		
		model.addAttribute("codeList", codeList);
		
		
		model.addAttribute("entIntroQstnNo", json);
		model.addAttribute("entCodingTestNo", jsonTwo);
		model.addAttribute("apList", apList);
		model.addAttribute("recruitTtl", recruitTtl);
		
		
		return "entmypage/processRegister";
	}
}
