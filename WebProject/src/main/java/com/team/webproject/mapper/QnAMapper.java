package com.team.webproject.mapper;

import java.util.List;

import com.team.webproject.dto.QnADTO;

public interface QnAMapper {
	List<QnADTO> getUserQnAs(int member_code);
	List<QnADTO> getPerformanceQnA(String performance_code);
	int insertQnA(QnADTO qna);
	int addAnswertoQ(int qa_code);
	int getPerformanceQnACount(String performance_code);
}
