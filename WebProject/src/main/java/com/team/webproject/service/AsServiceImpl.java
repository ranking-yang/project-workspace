package com.team.webproject.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.team.webproject.common.Pagination;
import com.team.webproject.dto.FreqQuestionDTO;
import com.team.webproject.dto.NoticeDTO;
import com.team.webproject.mapper.FreqQuestionMapper;
import com.team.webproject.mapper.NoticeMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AsServiceImpl implements AsService {
	
	private final NoticeMapper noticeMapper;
	private final FreqQuestionMapper freqMapper;
	
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
	

}
