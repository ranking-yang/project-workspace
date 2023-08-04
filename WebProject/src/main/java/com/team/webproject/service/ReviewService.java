package com.team.webproject.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.team.webproject.dto.ReviewDTO;
import com.team.webproject.mapper.ReviewMapper;

public class ReviewService {
	private final ReviewMapper reviewMapper;

    @Autowired
    public ReviewService(ReviewMapper reviewMapper) {
        this.reviewMapper = reviewMapper;
    }

    public void insertReview(ReviewDTO review) {
        reviewMapper.insertReview(review);
    }

    public ReviewDTO selectReviewByCode(Integer reviewCode) {
        return reviewMapper.selectReviewByCode(reviewCode);
    }

    public void updateReview(ReviewDTO review) {
        reviewMapper.updateReview(review);
    }

    public void deleteReview(Integer reviewCode) {
        reviewMapper.deleteReview(reviewCode);
    }
}
