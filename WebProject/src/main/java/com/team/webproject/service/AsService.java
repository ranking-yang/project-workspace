package com.team.webproject.service;

import java.util.List;

import com.team.webproject.common.Pagination;
import com.team.webproject.dto.FreqQuestionDTO;
import com.team.webproject.dto.NoticeDTO;

public interface AsService {
	
	String getNoticePageBtnNumber(int pageNum, Pagination pagination);
	
	List<NoticeDTO> showNoticePage(int start, int end);
	
	NoticeDTO getNoticeContent(int primaryKey);
	
	String getFreqPageBtnNumber(int pageNum, Pagination pagination);
	
	List<FreqQuestionDTO> showFreqQuestionPage(int start, int end);
	
	FreqQuestionDTO getFreqContent(int primaryKey);
	
}
