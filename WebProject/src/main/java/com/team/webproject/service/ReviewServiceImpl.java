package com.team.webproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.webproject.dto.ReviewDTO;
import com.team.webproject.mapper.ReviewMapper;

import lombok.RequiredArgsConstructor;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	
	@Autowired
	ReviewMapper reviewMapper;

    @Override
    public List<ReviewDTO> getAllReviews() {
        return reviewMapper.getAllReviews();
    }

    @Override
    public ReviewDTO getReviewByCode(Integer reviewCode) {
        return reviewMapper.getReviewByCode(reviewCode);
    }

    @Override
    public List<ReviewDTO> getReviewsByWriterCode(Integer writerCode) {
        return reviewMapper.getReviewsByWriterCode(writerCode);
    }

    @Override
    public void insertReview(ReviewDTO review) {
        reviewMapper.insertReview(review);
    }

    @Override
    public void updateReview(ReviewDTO review) {
        reviewMapper.updateReview(review);
    }

    @Override
    public void deleteReview(Integer reviewCode) {
        reviewMapper.deleteReview(reviewCode);
    }

	@Override
	public List<ReviewDTO> getPerformanceReviews(String performance_code) {
		return reviewMapper.getPerformanceReviews(performance_code);
	}
}
