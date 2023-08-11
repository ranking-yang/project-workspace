package com.team.webproject.service;

import java.util.List;

import com.team.webproject.dto.ReviewDTO;

public interface ReviewService {
	 List<ReviewDTO> getAllReviews();
	 ReviewDTO getReviewByCode(Integer reviewCode);
	 //List<ReviewDTO> getReviewsByWriterCode(Integer writerCode);
	 int insertReview(ReviewDTO review);
	 void updateReview(ReviewDTO review);
	 void deleteReview(Integer reviewCode);
}
