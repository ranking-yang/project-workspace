package com.team.webproject.service;

import java.util.List;

import com.team.webproject.dto.QnADTO;

public interface QnAService {
	List<QnADTO> getUserQnAs(int member_code);
	List<QnADTO> getPerformanceQnA(String performance_code);
	int getPerformanceQnACount(String performance_code);
}
