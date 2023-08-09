package com.team.webproject.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.team.webproject.dto.MembersDTO;
import com.team.webproject.dto.PerformanceDTO;
import com.team.webproject.dto.ReviewDTO;
import com.team.webproject.mapper.LoginMapper;
import com.team.webproject.service.DetailService;
import com.team.webproject.service.LoginService;
import com.team.webproject.service.PaymentService;
import com.team.webproject.service.ProductListService;
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
	
	@GetMapping("/product-detail")
	String callKopisAPI(HttpSession session, Model model, String performance_code) throws JsonProcessingException {		

		
		JSONObject jsonob = detailService.getKopisInfo(performance_code);
		
		model.addAttribute("timetable", new JSONObject(detailService.getTimeTable(jsonob.get("dtguidance")))); // 공연 일 - JSON으로 변환
		model.addAttribute("runtime", jsonob.get("prfruntime")); // 러닝타임
		model.addAttribute("age", jsonob.get("prfage")); // 연령
		model.addAttribute("poster", jsonob.get("poster")); // 미리보기 이미지
		model.addAttribute("discountRates", detailService.getDisCount()); // DB에서 할인률 조회
		model.addAttribute("performance", detailService.getPerformance(performance_code)); // DB에서 값 조회
		model.addAttribute("reviews", reviewService.getPerformanceReviews(performance_code));

	    JSONArray lijs = new JSONArray();
	    lijs.add(jsonob.get("styurls"));
	         
	     model.addAttribute("image", lijs); // 소개이미지
		
		return "/detail/detail";
	}
	
	@GetMapping("/product-detail-ex")
	String callGovernmentAPI(Model model, String performance_code) throws JsonProcessingException {
		
		JSONObject jsonob = detailService.getPublicDataInfo(performance_code);
		
		model.addAttribute("discountRates", detailService.getDisCount()); // DB에서 할인률 조회
		model.addAttribute("performance", detailService.getPerformance(performance_code));
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
			MembersDTO member = loginMapper.checklogin(member_id);
			
			model.addAttribute("userId", member_id);
			System.out.println("아이디 : " + member_id);
			model.addAttribute("userCode", member_code);
			System.out.println("detail_member_id: "+ member_id);

		}

        List<ReviewDTO> reviews = reviewService.getAllReviews();
        model.addAttribute("reviews", reviews);
        return "/detail/detail"; // 리뷰 정보를 상세 페이지로 전달하고 해당 뷰를 반환
    }

	
	 @GetMapping("/product/reviews/{reviewCode}") public String
	 getReviewByCode(@PathVariable Integer reviewCode, Model model) { ReviewDTO
	 review = reviewService.getReviewByCode(reviewCode);
	 model.addAttribute("review", review); return "/detail/detail"; // 리뷰 정보를 상세페이지로 전달하고 해당 뷰를 반환 
	 }
	 

    // 다른 REST 엔드포인트와 메서드 구현
    // ...

    @PostMapping("/product/reviews")
    @ResponseBody
    public void insertReview(@RequestBody ReviewDTO review) {
    	System.out.println(review.toString());
    	
    	// ReviewDTO에 관련된 작업 수행
        reviewService.insertReview(review);
			
//        return "/detail/detail"; // 리뷰 정보를 상세 페이지로 전달하고 해당 뷰를 반환
    }

    @PutMapping("/product/reviews/{reviewCode}")
    public String updateReview(@PathVariable Integer reviewCode, @RequestBody ReviewDTO review) {
        review.setReview_code(reviewCode);
        reviewService.updateReview(review);
        //return "redirect:/product/product-detail"; // 리뷰를 수정하고 상세 페이지로 리다이렉트
        return "/detail/detail"; // 리뷰 정보를 상세 페이지로 전달하고 해당 뷰를 반환
    }

    @DeleteMapping("/product/reviews/{reviewCode}")
    public String deleteReview(@PathVariable Integer reviewCode) {
        reviewService.deleteReview(reviewCode);
        //return "redirect:/product/product-detail"; // 리뷰를 삭제하고 상세 페이지로 리다이렉트
        return "/detail/detail"; // 리뷰 정보를 상세 페이지로 전달하고 해당 뷰를 반환
    }
    
    @GetMapping("/product/reviews/MembersDTO")
    public ResponseEntity<MembersDTO> getMembers() {
        // MembersDTO 객체 생성 및 데이터 설정
        MembersDTO membersDTO = new MembersDTO();
        membersDTO.getMember_code();
        membersDTO.getMember_id();
        // ... 필요한 데이터 설정 ...

        // JSON 변환 및 반환
        return ResponseEntity.ok(membersDTO);
    }

    
}