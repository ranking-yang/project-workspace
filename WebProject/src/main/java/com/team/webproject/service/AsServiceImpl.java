package com.team.webproject.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.nimbusds.jose.shaded.json.JSONObject;
import com.team.webproject.common.Pagination;
import com.team.webproject.dto.FreqQuestionDTO;
import com.team.webproject.dto.NoticeDTO;
import com.team.webproject.dto.OneOnAsDTO;
import com.team.webproject.mapper.FreqQuestionMapper;
import com.team.webproject.mapper.NoticeMapper;
import com.team.webproject.mapper.OneOnMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AsServiceImpl implements AsService {
	
	private final NoticeMapper noticeMapper;
	private final FreqQuestionMapper freqMapper;
	private final OneOnMapper oneonMapper;
	private final FreqQuestionMapper faqMapper;
	
	@Override
	public String getNoticePageBtnNumber(int pageNum, Pagination pagination) {
		StringBuilder sb = new StringBuilder();
		int size = noticeMapper.getCount();
		
		int pageBtnNum = size % 10 == 0 ? size / 10 : size / 10 + 1;
		
		pagination.setPageNum(pageNum);
		pagination.setMaxNum(pageBtnNum);
		
		int cnt = 1;
		while (pageNum >= (cnt + 5)) {
			cnt += 5;
		}
		
		int end = pageBtnNum < cnt + 5 ? pageBtnNum : cnt + 4;
		for (int i = cnt; i <= end; ++i) {
			sb.append(i).append("/");
		}
		
		
		return sb.toString();
	}
	@Override
	public List<NoticeDTO> showNoticePage(int start, int end) {
		return noticeMapper.getPage(start, end);
	}
	@Override
	public NoticeDTO getNoticeContent(int primaryKey) {
		
		return noticeMapper.getRecord(primaryKey);
	}
	@Override
	public String getFreqPageBtnNumber(int pageNum, Pagination pagination) {
		StringBuilder sb = new StringBuilder();
		int size = freqMapper.getCount();
		
		int pageBtnNum = size % 10 == 0 ? size / 10 : size / 10 + 1;
		
		pagination.setPageNum(pageNum);
		pagination.setMaxNum(pageBtnNum);
		
		int cnt = 1;
		while (pageNum >= (cnt + 5)) {
			cnt += 5;
		}
		
		int end = pageBtnNum < cnt + 5 ? pageBtnNum : cnt + 4;
		for (int i = cnt; i <= end; ++i) {
			sb.append(i).append("/");
		}
		
		
		return sb.toString();
	}
	@Override
	public List<FreqQuestionDTO> showFreqQuestionPage(int start, int end) {
		return freqMapper.getPage(start, end);
	}
	@Override
	public FreqQuestionDTO getFreqContent(int primaryKey) {
		return freqMapper.getRecord(primaryKey);
	}
	@Override
	public Integer addOneOnContent(OneOnAsDTO onecontent) {
		return oneonMapper.addOneOnContent(onecontent);
	}
	
	@Override
	public OneOnAsDTO selectOneTitle(Integer onecode) {
		return oneonMapper.select_OneOn_title(onecode);
	}
	@Override
	public List<OneOnAsDTO> getOneOnAll(){
		return oneonMapper.getAllOneOn();
	}
	@Override
	public int updateAnswer(Integer onecode, String answer) {
		return oneonMapper.setAnswer(onecode, answer);
	}
	
	@Override
	public int saveNotice(NoticeDTO notice) {
		
		return noticeMapper.insertNotice(notice);
	}
	@Override

	public List<NoticeDTO> getAllNotices() {
		return noticeMapper.getAllNotices();
	}
	@Override
	public NoticeDTO getNoticeByCode(int notice_code) {
		return noticeMapper.getNoticeByCode(notice_code);
	}
	@Override
	public int editNotice(NoticeDTO notice) {
		return noticeMapper.editNotice(notice);
	}
	
	@Override
	public void deleteNotice(List<JSONObject> noticeCodes) {
		for(JSONObject code : noticeCodes) {
			noticeMapper.deleteNotice((int)(code.get("code")));
		}
	}
	public String getOneOnPageBtnNumber(int pageNum, Pagination pagination) {
		StringBuilder sb = new StringBuilder();
		int size = oneonMapper.getCount();
		
		int pageBtnNum = size % 10 == 0 ? size / 10 : size / 10 + 1;
		
		pagination.setPageNum(pageNum);
		pagination.setMaxNum(pageBtnNum);
		
		int cnt = 1;
		while (pageNum >= (cnt + 5)) {
			cnt += 5;
		}
		
		int end = pageBtnNum < cnt + 5 ? pageBtnNum : cnt + 4;
		for (int i = cnt; i <= end; ++i) {
			sb.append(i).append("/");
		}
		
		
		return sb.toString();
	}
	@Override
	public List<OneOnAsDTO> getOneOnList(Integer write_code, int start, int end) {
		return oneonMapper.getPage(write_code, start, end);

	}
	@Override
	public List<OneOnAsDTO> getSearch(String stdate, String endate, String text, String option) {
		if(stdate.isEmpty() && endate.isEmpty() && !(text.isEmpty())) {
			List<OneOnAsDTO> getli = oneonMapper.getSearch(text, option);
			return getli;
		}else if(!stdate.isEmpty() && !endate.isEmpty() && (text.isEmpty())) {
			List<OneOnAsDTO> getli = oneonMapper.getSearchDate(stdate, endate);
			return getli;
		}else if(!stdate.isEmpty() && !endate.isEmpty() && !(text.isEmpty())) {
			List<OneOnAsDTO> getli = oneonMapper.getSearchAll(text, stdate, endate, option);
			return getli;
		}else {
			return oneonMapper.getAllOneOn();
		}
		
	}
	
	@Override
	public int addFaq(FreqQuestionDTO newFaq) {
		return faqMapper.addNewFaq(newFaq);
	}
	
	@Override
	public List<FreqQuestionDTO> getAllFaqs() {
		return faqMapper.getAllFaq();
	}
	
	@Override
	public void deleteFaqs(List<JSONObject> faqs) {
		for(JSONObject code : faqs) {
			faqMapper.deleteFaq((int)(code.get("code")));
		}		
	}
	
	public FreqQuestionDTO getFaq(int faqCode) {
		return faqMapper.getRecord(faqCode);
	}
	
	@Override
	public int editFaq(FreqQuestionDTO newFaq) {
		return faqMapper.updateFaq(newFaq);
	}
	

}
