package kr.co.itcruit.vo;

import java.util.List;

import lombok.Data;

@Data
public class EntCodingtestVO {
	
	private String entNm;
	private int entNo;
	
	private int entCodingtestNo;
	private int processNo;
	private int processNoOrder;
	
	private String recruitNo;
	private String pstnCmmncdNm;
	
	private String strtDt;
	private String endDt;
	
	private String applyNo;
	private String qstnAnsr;
	private int entCodingtestNoOrder;
	
	private String ctPassYn;
	
	private int qstnNo; //
	private String accountId;
	//qstnAnsr applyNo entCodingtestNoOrder , 
	//ent_codingtest_qstn_ansr에 값 집어넣을 데이터 담을 필드	
	private String passYn = "N";
	
	
    private String qstnTtl;
    private String qstnCn;
	
	//qstnNo; qstnTtl만 가져오면 될듯함
	private List<CodingtestVO> entCodingtestList;
}
