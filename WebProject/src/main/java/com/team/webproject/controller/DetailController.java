package com.team.webproject.controller;

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
import com.team.webproject.service.DetailService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class DetailController {	

	@Autowired
	DetailService detailService;
	
	@GetMapping("/product/product-detail")
	String callKopisAPI(Model model, String performance_code) throws JsonProcessingException {		
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		if (principal.equals("anonymousUser")) {
			model.addAttribute("userId", null);
		} else {			
			String username = ((UserDetails) principal).getUsername();
			model.addAttribute("userId", username);
		}
		
		JSONObject jsonob = detailService.getKopisInfo(performance_code);
		String place_id = jsonob.get("mt10id").toString();
		JSONObject jsonob1 = detailService.getLocationforMap(place_id);
		
		model.addAttribute("timetable", new JSONObject(detailService.getTimeTable(jsonob.get("dtguidance")))); // 공연 일 - JSON으로 변환
		model.addAttribute("runtime", jsonob.get("prfruntime")); // 러닝타임
		model.addAttribute("age", jsonob.get("prfage")); // 연령
		model.addAttribute("poster", jsonob.get("poster")); // 미리보기 이미지
		model.addAttribute("discountRates", detailService.getDisCount()); // DB에서 할인률 조회
		model.addAttribute("performance", detailService.getPerformance(performance_code)); // DB에서 값 조회
		model.addAttribute("la", jsonob1.get("la"));
		model.addAttribute("lo", jsonob1.get("lo"));
		
	    JSONArray lijs = new JSONArray();
	    lijs.add(jsonob.get("styurls"));
	         
	     model.addAttribute("image", lijs); // 소개이미지
		
		return "/detail/detail";
	}
	
	@GetMapping("/product/product-detail-ex")
	String callGovernmentAPI(Model model, String performance_code) throws JsonProcessingException {
		
		// 스프링 시큐리티에서 user 값 가져오기
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		if (principal.equals("anonymousUser")) {
			model.addAttribute("userId", null);
		} else {			
			String username = ((UserDetails) principal).getUsername();
			model.addAttribute("userId", username);
		}
		
		JSONObject jsonob = detailService.getPublicDataInfo(performance_code);
		
		model.addAttribute("discountRates", detailService.getDisCount()); // DB에서 할인률 조회
		model.addAttribute("performance", detailService.getPerformance(performance_code));
		model.addAttribute("la", jsonob.get("la"));
		model.addAttribute("lo", jsonob.get("lo"));

		return "/detail/detail_ex";
	}

}