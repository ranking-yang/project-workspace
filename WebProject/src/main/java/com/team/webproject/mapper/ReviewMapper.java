package com.team.webproject.mapper;

import java.util.List;

import com.team.webproject.dto.ReviewDTO;
import com.team.webproject.dto.ReviewScoreDTO;

public interface ReviewMapper {
	List<ReviewDTO> getAllReviews(); // 모든 리뷰 조회
	List<ReviewDTO> getPerformanceReviews(String performance_code); 
    ReviewDTO getReviewByCode(Integer reviewCode); // 리뷰 코드로 특정 리뷰 조회
    List<ReviewDTO> getReviewsByWriterCode(Integer writerCode); // 작성자 코드로 리뷰 조회
    void insertReview(ReviewDTO review); // 리뷰 생성
    void updateReview(ReviewDTO review); // 리뷰 수정
    void deleteReview(Integer reviewCode); // 리뷰 삭제
	Double getPerformanceAvgScore(String performance_code); // 해당공연의 평균 별점 가져오기
	int getPerformanceReviewCount(String performance_code); // 해당 공연의 리뷰 개수
	List<Integer> getReviewScoreList(String performance_code);
}
