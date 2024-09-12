package com.team.webproject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team.webproject.dto.FreqQuestionDTO;

public interface FreqQuestionMapper {
	
	int getCount();
	
	List<FreqQuestionDTO> getPage(@Param("start")int start, @Param("end")int end);
	
	FreqQuestionDTO getRecord(@Param("pk")int pk);
	
	int addNewFaq(FreqQuestionDTO newFaq);
	
	List<FreqQuestionDTO> getAllFaq();
	
	int deleteFaq(@Param("question_code")int question_code);
	
	int updateFaq(FreqQuestionDTO newFaq);

}
