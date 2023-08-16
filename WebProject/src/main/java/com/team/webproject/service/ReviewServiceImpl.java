package com.team.webproject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.team.webproject.dto.ReviewDTO;
import com.team.webproject.dto.ReviewScoreDTO;
import com.team.webproject.mapper.ReviewMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewService{
	

	private final ReviewMapper reviewMapper;

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

	@Override
	public Double getPerformanceAvgScore(String performance_code) {
		return reviewMapper.getPerformanceAvgScore(performance_code);
	}

	@Override
	public int getPerformanceReviewCount(String performance_code) {
		return reviewMapper.getPerformanceReviewCount(performance_code);
	}

	@Override
	public Map<Integer, Integer> getReviewScoreRate(String performance_code) {
	    int total = reviewMapper.getPerformanceReviewCount(performance_code);
	    Map<Integer, Integer> scoreRateMap = new HashMap<>();
	    List<Integer> scoreList = reviewMapper.getReviewScoreList(performance_code);

	    if (scoreList != null && !scoreList.isEmpty()) {
	        Map<Integer, Integer> scoreToIndexMap = new HashMap<>();
	        scoreToIndexMap.put(5, 0);
	        scoreToIndexMap.put(4, 1);
	        scoreToIndexMap.put(3, 2);
	        scoreToIndexMap.put(2, 3);
	        scoreToIndexMap.put(1, 4);

	        ReviewScoreDTO review_scores = new ReviewScoreDTO();
	        int[] scoreValues = {5, 4, 3, 2, 1};

	        for (int score : scoreValues) {
	            int index = scoreToIndexMap.get(score);
	            if (index < scoreList.size() && scoreList.get(index) != null && total != 0) {
	                int rate = (int) ((scoreList.get(index).doubleValue() / total) * 100);
	                scoreRateMap.put(score, rate);
	            } else {
	                scoreRateMap.put(score, 0);
	            }
	        }
	    }

	    return scoreRateMap;
	}
}
