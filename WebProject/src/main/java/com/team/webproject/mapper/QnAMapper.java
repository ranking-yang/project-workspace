package com.team.webproject.mapper;

import java.util.List;

import com.team.webproject.dto.QnADTO;

public interface QnAMapper {
	List<QnADTO> getAllQnAs();
	List<QnADTO> getUserQnAs(int member_code);
	List<QnADTO> getPerformanceQnA(String performance_code);
	int insertQnA(QnADTO qna);
	int addAnswertoQ(int qa_code, String qa_answer);
	int getPerformanceQnACount(String performance_code);
	List<QnADTO> getQnAsAnswerYet();
	List<QnADTO> getQnAsAnswered();
	QnADTO getQnAbyQacode(int qa_code);
}
