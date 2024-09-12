package com.team.webproject.service;

import java.util.List;

import com.nimbusds.jose.shaded.json.JSONObject;
import com.team.webproject.common.Pagination;
import com.team.webproject.dto.FreqQuestionDTO;
import com.team.webproject.dto.NoticeDTO;
import com.team.webproject.dto.OneOnAsDTO;

public interface AsService {
	
	String getNoticePageBtnNumber(int pageNum, Pagination pagination);
	
	List<NoticeDTO> showNoticePage(int start, int end);
	
	NoticeDTO getNoticeContent(int primaryKey);
	
	String getFreqPageBtnNumber(int pageNum, Pagination pagination);
	
	List<FreqQuestionDTO> showFreqQuestionPage(int start, int end);
	
	FreqQuestionDTO getFreqContent(int primaryKey);
	
	int saveNotice(NoticeDTO notice);
	
	Integer addOneOnContent(OneOnAsDTO onecontent);
	
	String getOneOnPageBtnNumber(int pageNum, Pagination pagination);
	
	List<OneOnAsDTO> getOneOnList(Integer write_code, int start, int end);
	
	OneOnAsDTO selectOneTitle(Integer onecode);
	
	List<OneOnAsDTO> getOneOnAll();
	
	int updateAnswer(Integer onecode, String answer);
	
	List<NoticeDTO> getAllNotices();
	
	NoticeDTO getNoticeByCode(int notice_code);
	
	int editNotice(NoticeDTO notice);
	
	void deleteNotice(List<JSONObject> noticeCodes);	

	List<OneOnAsDTO> getSearch(String stdate, String endate, String text, String option);

	int addFaq(FreqQuestionDTO newFaq);
	
	List<FreqQuestionDTO> getAllFaqs();
	
	void deleteFaqs(List<JSONObject> faqs);
	
	public FreqQuestionDTO getFaq(int faqCode);
	
	int editFaq(FreqQuestionDTO newFaq);

}
