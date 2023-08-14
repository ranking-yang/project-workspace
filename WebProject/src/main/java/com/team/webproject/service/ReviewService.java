package com.team.webproject.service;

import java.util.List;

import com.team.webproject.dto.ReviewDTO;

public interface ReviewService {
	 List<ReviewDTO> getAllReviews();// 모든 리뷰 조회
	 List<ReviewDTO> getPerformanceReviews(String performance_code); 
	 //ReviewDTO getReviewByCode(Integer reviewCode);
	 //List<ReviewDTO> getReviewsByWriterCode(Integer writerCode);
	 int insertReview(ReviewDTO review);
	 void updateReview(ReviewDTO review);
	 void deleteReview(Integer reviewCode);
}
