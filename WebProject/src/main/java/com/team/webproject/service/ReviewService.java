package com.team.webproject.service;

import java.util.List;
import java.util.Map;

import com.team.webproject.dto.ReviewDTO;
import com.team.webproject.dto.ReviewScoreDTO;

public interface ReviewService {
	List<ReviewDTO> getAllReviews();// 모든 리뷰 조회
	List<ReviewDTO> getPerformanceReviews(String performance_code);
	ReviewDTO getReviewByCode(Integer reviewCode);
	List<ReviewDTO> getReviewsByWriterCode(Integer writerCode);
	void insertReview(ReviewDTO review);
	void updateReview(ReviewDTO review);
	void deleteReview(Integer reviewCode);
	Double getPerformanceAvgScore(String performance_code);
	int getPerformanceReviewCount(String performance_code);
	Map<Integer, Integer> getReviewScoreRate(String performance_code);
}
