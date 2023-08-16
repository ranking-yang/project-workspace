package com.team.webproject.mapper;

import java.util.List;

import com.team.webproject.dto.ReviewDTO;

public interface ReviewMapper {

	List<ReviewDTO> getAllReviews(); // 모든 리뷰 조회
	List<ReviewDTO> getPerformanceReviews(String performance_code); 
    //ReviewDTO getReviewByCode(Integer reviewCode); // 리뷰 코드로 특정 리뷰 조회
    List<ReviewDTO> getReviewsByWriterCode(Integer writerCode); // 작성자 코드로 리뷰 조회
    int insertReview(ReviewDTO review); // 리뷰 생성
    void updateReview(ReviewDTO review); // 리뷰 수정
    void deleteReview(Integer reviewCode); // 리뷰 삭제
}
