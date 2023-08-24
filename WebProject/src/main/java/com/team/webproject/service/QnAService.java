package com.team.webproject.service;

import java.util.List;

import com.team.webproject.dto.QnADTO;

public interface QnAService {
	List<QnADTO> getUserQnAs(int member_code);
	List<QnADTO> getPerformanceQnA(String performance_code);
	int getPerformanceQnACount(String performance_code);
	List<QnADTO> getAllQnAs();
	List<QnADTO> getQnAsAnswerYet();
	List<QnADTO> getQnAsAnswered();
	QnADTO getQnAbyQacode(int qa_code);
	int addAnswertoQ(int qa_code, String qa_answer);
}
