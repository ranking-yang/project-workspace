package com.team.webproject.dto;

/*
 	md추천에서 requestbody를 받기 위한 dto이다.
 	List<String>으로 받아와서 String.join을 하기 위해 만들었다.
 	DB에 md추천 지역, md추천 장르 부분의 db를 만들어야 할것 같다.
 
 */

import java.util.List;

import lombok.Data;

@Data
public class MD_getDTO {
	private String md_title;
	private String md_stdate;
	private String md_endate;
	private List<String> md_local;
	private List<String> md_show;
	private List<String> md_performance;
	private List<String> md_perfotitle;
}
