package com.team.webproject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team.webproject.dto.OneOnAsDTO;

public interface OneOnMapper {
	
	int addOneOnContent(OneOnAsDTO oneoncontent);
	
	int getCount();
	
	List<OneOnAsDTO> getPage(Integer writer, @Param("start")int start, @Param("end")int end);
	
	OneOnAsDTO select_OneOn_title(Integer onecode);
	
	List<OneOnAsDTO> getAllOneOn();
	
	int setAnswer(int onecode, String answer);
	
	List<OneOnAsDTO> getSearchDate(String stdate, String endate);
	List<OneOnAsDTO> getSearchAll(String text, String stdate, String endate, String option);
	List<OneOnAsDTO> getSearch(String text, String option);
}
