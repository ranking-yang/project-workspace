package com.team.webproject.service;

import java.util.List;
import java.util.Map;

import com.team.webproject.dto.PerformanceReviewDTO;
import com.team.webproject.dto.ReviewDTO;

public interface ReviewService {

	 
	List<ReviewDTO> getAllReviews();// 모든 리뷰 조회
	List<ReviewDTO> getPerformanceReviews(String performance_code); 
	ReviewDTO getReviewByCode(Integer reviewCode);
	List<ReviewDTO> reviews(Integer review_writer_code);
	List<ReviewDTO> reviewsASC(Integer review_writer_code);
	void insertReview(ReviewDTO review);
	int getReviewCode(Integer member_code);
	void updateTicketReviewCode(int review_code, String payment_code);
	void updateReview(ReviewDTO review);
	void deleteReview(Integer review_code);
	//List<ReviewDTO> getReviewsByWriterCode(Integer writerCode);
	Double getPerformanceAvgScore(String performance_code);
	int getPerformanceReviewCount(String performance_code);
	Map<Integer, Integer> getReviewScoreRate(String performance_code);
	List<PerformanceReviewDTO> getPerformanceReviewCountnAvg();
}
