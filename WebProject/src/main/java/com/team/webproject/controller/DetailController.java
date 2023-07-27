package com.team.webproject.controller;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.team.webproject.service.DetailServiceimpl;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class DetailController {	

	@Autowired
	DetailServiceimpl detailServiceimpl;
	
	@GetMapping("/product/product-detail")
	String callKopisAPI(Model model, String performance_code) throws JsonProcessingException {		
		
		JSONObject jsonob = detailServiceimpl.getKopisInfo(performance_code);

		model.addAttribute("timetable", new JSONObject(detailServiceimpl.getTimeTable(jsonob.get("dtguidance")))); // 공연 일 - JSON으로 변환
		model.addAttribute("runtime", jsonob.get("prfruntime")); // 러닝타임
		model.addAttribute("age", jsonob.get("prfage")); // 연령
		model.addAttribute("discountRates", detailServiceimpl.getDisCount()); // DB에서 할인률 조회
		model.addAttribute("performance", detailServiceimpl.getPerformance(performance_code)); // DB에서 값 조회

		return "/detail/detail";
	}
	
	@GetMapping("/product/product-detail-ex")
	String callGovernmentAPI(Model model, String performance_code) throws JsonProcessingException {

		detailServiceimpl.getPublicDataInfo(performance_code);

		model.addAttribute("performance", detailServiceimpl.getPerformance(performance_code));

		return "/detail/detail";
	}

}