package kr.co.itcruit.vo;

import java.util.List;

import lombok.Data;

@Data
public class SearchTalentVO {

	private String accountId;
	private String accountNm;
	private String rsmNo;
	private String accountAddr1;
	private String rsmCareerYear;
	private String availLangCmmncdNm;
	private String pstnCmmncdNm;
	
	private List<PositionVO> rsmPositionVOList;		//pstnCmmncdNm
	private List<AvailLangListVO> availLangVOList; //availLangCmmncdNm
	
//	private int cnt;
//	private int select;
	
	//인재 검색용
	private String carrer; // 경력여부
	private String pstn;
	private String lang;
	private String lcl; //지역은 리스트로 안뽑고 그냥 검색
	
	private List<String> langList; //언어 옵션 목록
	private List<String> pstnList;	//직무 옵션 목록
	private List<String> localList;	//직무 옵션 목록
	
	
//	public void countSelectedOption() {
//        int count = 0;
//
//        if (carrer != null && !carrer.trim().isEmpty()) {
//            count++;
//        }
//
//        if (lang != null && !lang.trim().isEmpty()) {
//            count++;
//        }
//
//        if (pstn != null && !pstn.trim().isEmpty()) {
//            count++;
//        }
//
//        if (lcl != null && !lcl.trim().isEmpty()) {
//            count++;
//        }
//
//        select = count;
//    }
	
}