package com.team.webproject.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.team.webproject.dto.QnADTO;
import com.team.webproject.mapper.QnAMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class QnAServiceImpl implements QnAService{
	
	private final QnAMapper qnaMapper;
	
	@Override
	public List<QnADTO> getUserQnAs(int member_code) {
		return qnaMapper.getUserQnAs(member_code);
	}

	@Override
	public List<QnADTO> getPerformanceQnA(String performance_code) {
		return qnaMapper.getPerformanceQnA(performance_code);
	}

	@Override
	public int getPerformanceQnACount(String performance_code) {
		return qnaMapper.getPerformanceQnACount(performance_code);
	}

	@Override
	public List<QnADTO> getAllQnAs() {
		return qnaMapper.getAllQnAs();
	}

	@Override
	public List<QnADTO> getQnAsAnswerYet() {
		return qnaMapper.getQnAsAnswerYet();
	}

	@Override
	public List<QnADTO> getQnAsAnswered() {
		return qnaMapper.getQnAsAnswered();
	}

	@Override
	public QnADTO getQnAbyQacode(int qa_code) {
		return qnaMapper.getQnAbyQacode(qa_code);
	}

	@Override
	public int addAnswertoQ(int qa_code, String qa_answer) {
		return qnaMapper.addAnswertoQ(qa_code, qa_answer);
	}

}
