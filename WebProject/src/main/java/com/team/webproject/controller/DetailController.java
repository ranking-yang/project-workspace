package com.team.webproject.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.team.webproject.common.Principal;
import com.team.webproject.dto.ReviewDTO;
import com.team.webproject.mapper.LoginMapper;
import com.team.webproject.service.DetailService;
import com.team.webproject.service.LoginService;
import com.team.webproject.service.PaymentService;
import com.team.webproject.service.ProductListService;
import com.team.webproject.service.QnAService;
import com.team.webproject.service.ReviewService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class DetailController {	

	@Autowired
	DetailService detailService;
	
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	LoginMapper loginMapper;
	
	@Autowired
	PaymentService performanceService;
	
	@Autowired
	LoginService membersService;
	
	@Autowired
	ProductListService productService;
	@Autowired
	QnAService qnaService;

	
	@SuppressWarnings("unchecked")
	@GetMapping("/product-detail")
	String callKopisAPI(HttpSession session, Model model, String performance_code) throws JsonProcessingException {		

		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal.equals("anonymousUser")) { // 로그인상태가 아님
			model.addAttribute("member_id", null);
		} else {			
			String member_id = Principal.getUser().getMember_id();
			model.addAttribute("member_id", member_id);		
			model.addAttribute("member_code", Principal.getUser().getMember_code());
		}
		
		JSONObject jsonob = detailService.getKopisInfo(performance_code);
		model.addAttribute("timetable", new JSONObject(detailService.getTimeTable(jsonob.get("dtguidance")))); // 공연 일 - JSON으로 변환
		model.addAttribute("runtime", jsonob.get("prfruntime")); // 러닝타임
		model.addAttribute("age", jsonob.get("prfage")); // 연령
		model.addAttribute("poster", jsonob.get("poster")); // 미리보기 이미지
		model.addAttribute("discountRates", detailService.getDisCount()); // DB에서 할인률 조회
		model.addAttribute("performance", detailService.getPerformance(performance_code)); // DB에서 값 조회
		model.addAttribute("reviews", reviewService.getPerformanceReviews(performance_code)); // 해당공연의 리뷰
		model.addAttribute("avgScore", reviewService.getPerformanceAvgScore(performance_code)); // 해당공연의 평점
		model.addAttribute("countReviews", reviewService.getPerformanceReviewCount(performance_code)); // 해당공연의 리뷰 개수
		model.addAttribute("scoreRate", reviewService.getReviewScoreRate(performance_code)); // 별점 비율
		model.addAttribute("qnalist", qnaService.getPerformanceQnA(performance_code)); // 해당공연의 QnA
		model.addAttribute("qnaCount", qnaService.getPerformanceQnACount(performance_code)); // 해당공연의 QnA	
		model.addAttribute("kakaomapAppkey", detailService.getkakaomapAppkey());
		
	    JSONArray lijs = new JSONArray();
	    lijs.add(jsonob.get("styurls"));
	         
	     model.addAttribute("image", lijs); // 소개이미지
		
		return "/detail/detail";
	}
	
	@GetMapping("/product-detail-ex")
	String callGovernmentAPI(Model model, String performance_code) throws JsonProcessingException {
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal.equals("anonymousUser")) { // 로그인상태가 아님
			model.addAttribute("member_id", null);
		} else {			
			String member_id = Principal.getUser().getMember_id();
			model.addAttribute("member_id", member_id);		
			model.addAttribute("member_code", Principal.getUser().getMember_code());
		}
		
		
		JSONObject jsonob = detailService.getPublicDataInfo(performance_code);
		
		model.addAttribute("discountRates", detailService.getDisCount()); // DB에서 할인률 조회
		model.addAttribute("performance", detailService.getPerformance(performance_code));
		model.addAttribute("ex_info", jsonob);
		model.addAttribute("reviews", reviewService.getPerformanceReviews(performance_code)); // 해당공연의 리뷰
		model.addAttribute("avgScore", reviewService.getPerformanceAvgScore(performance_code)); // 해당공연의 평점
		model.addAttribute("countReviews", reviewService.getPerformanceReviewCount(performance_code)); // 해당공연의 리뷰 개수
		model.addAttribute("scoreRate", reviewService.getReviewScoreRate(performance_code)); // 별점 비율
		model.addAttribute("qnalist", qnaService.getPerformanceQnA(performance_code)); // 해당공연의 QnA
		model.addAttribute("qnaCount", qnaService.getPerformanceQnACount(performance_code)); // 해당공연의 QnA
		model.addAttribute("kakaomapAppkey", detailService.getkakaomapAppkey());

		return "/detail/detail_ex";
	}
	
	// 박정준 코드
	
	@GetMapping("/product/reviews")
    public String getAllReviews(Model model) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal.equals("anonymousUser")) { // 로그인상태가 아님
			model.addAttribute("member_id", null);
		} else {			
			String member_id = ((UserDetails) principal).getUsername();
			Integer member_code = productService.getMember_code(member_id);
			
			model.addAttribute("userId", member_id);
			model.addAttribute("userCode", member_code);

		}

        List<ReviewDTO> reviews = reviewService.getAllReviews();
        model.addAttribute("reviews", reviews);

        return "/detail/detail"; // 리뷰 정보를 상세 페이지로 전달하고 해당 뷰를 반환
    }
}