package kr.co.itcruit.mypage.admin.service;

import java.util.List;

import kr.co.itcruit.ServiceResult;
import kr.co.itcruit.vo.AccountVO;
import kr.co.itcruit.vo.AtchVO;
import kr.co.itcruit.vo.BoardReportVO;
import kr.co.itcruit.vo.BoardVO;
import kr.co.itcruit.vo.EntSttsPaginationVO;
import kr.co.itcruit.vo.EnterpriseVO;
import kr.co.itcruit.vo.MidPaginationVO;
import kr.co.itcruit.vo.RecruitPaginationVO;
import kr.co.itcruit.vo.RecruitVO;
import kr.co.itcruit.vo.PaginationInfoVO;

public interface IAdminService {

	public ServiceResult faqInsert(BoardVO boardVO);

	public List<BoardVO> selectFreeBoardList(MidPaginationVO<BoardVO> pagingVO);

	public List<AtchVO> entSttsList(EntSttsPaginationVO<AtchVO> atchPagingVO);

	public ServiceResult entApproval(AccountVO av);

	public int reportCount();

	public List<BoardReportVO> reportList(RecruitPaginationVO<BoardReportVO> reportPagingVO);

	public ServiceResult handlingYn(BoardReportVO brVO);

	public ServiceResult stopAccount(AccountVO av);

	public int entSttsCount();

	int selectEntCount(PaginationInfoVO<EnterpriseVO> pagingVO);

	public List<EnterpriseVO> selectEntList(PaginationInfoVO<EnterpriseVO> pagingVO);

	public List<RecruitVO> mainChart(RecruitVO recruitVO);

	public int accountNum(AccountVO accountVO);

	public int entNum(EnterpriseVO enterpriseVO);

	public int monthNum(AccountVO accountVO);

	public List<RecruitVO> horizontalChartChart(RecruitVO recruitVO);

	public List<RecruitVO> pieChart(RecruitVO recruitVO);


}
