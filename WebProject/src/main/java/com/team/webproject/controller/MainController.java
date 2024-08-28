package com.team.webproject.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.webproject.dto.MD_getPosterDTO;
import com.team.webproject.dto.MDrecomDTO;
import com.team.webproject.dto.MembersDTO;
import com.team.webproject.dto.PerfomSaleDTO;
import com.team.webproject.dto.RankDTO;
import com.team.webproject.mapper.LoginMapper;
import com.team.webproject.mapper.MD_RecomMapper;
import com.team.webproject.mapper.PaymentMapper;
import com.team.webproject.service.CouponService;
import com.team.webproject.service.PaymentService;

@Controller
@RequestMapping("/main")
public class MainController {
	
	@Autowired
	CouponService couponService;

	@Autowired
	LoginMapper loginMapper;

	
	@Autowired
	MD_RecomMapper mdMapper;
	
	@Autowired
	PaymentService payment;
	
	@Autowired 
	PaymentMapper paymapper;
	
	
	
	@GetMapping(value = { "/", "" })
	String main(Model model, HttpServletRequest request) {

		// 전체 securityholder 내용
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal.equals("anonymousUser")) {
			model.addAttribute("userId", null);
			return "main/main";
		}
		String username = null;

		List<GrantedAuthority> authority = new ArrayList<>(((MembersDTO) principal).getAuthorities());
	
		if (authority.get(0).getAuthority().equals("ROLE_member")) {
			
			username = ((UserDetails) principal).getUsername();
			model.addAttribute("userId", username);
			
			// 생일이 있는 달인지 파악해서 쿠폰을 전달해주는 로직
			if(!couponService.checkIfBirthDayCouponExists(username)) {
				couponService.giveBirthDayCoupon(username);
			}
			return "main/main";
		// 권한이 admin 이면
		} else {
			username = ((UserDetails) principal).getUsername();
			model.addAttribute("userId", username);
			return "admin/api";
		}
		
	}
	
	@GetMapping("/mdrecom")
	String mdrecommend(Model model) {
		List<MDrecomDTO> mdDto = mdMapper.getMDrecom();
		List<MD_getPosterDTO> postDto = mdMapper.getMDposter();
		model.addAttribute("md_list", mdDto);
		model.addAttribute("md_poster_li", postDto);
		
		return "/main/mdrecommend";
	}
	
	
	@GetMapping("/mdlist")
	String mdlist() {
		
		return "/main/mdlist";
	}
	
	@GetMapping("/rank")
	@ResponseBody
	RankDTO getRank(){
		List<String> li_rank = payment.ranking_getperfom();
		List<PerfomSaleDTO> li_per = new ArrayList<>();
		
		for(String rank : li_rank) {
			for(PerfomSaleDTO per : paymapper.getAllPayPerfom()) {
				if(per.getPerformance_code().equals(rank)){
					li_per.add(per);
					break;
				}
			}
			
		}
		List<Float> perfom = payment.getPostli(li_per);
		RankDTO rankData = new RankDTO();
	    rankData.setLi_per(li_per);
	    rankData.setPerfom(perfom);
		return rankData;
	}
	
	@GetMapping("/reviewRank")
	@ResponseBody
	RankDTO getstarRank(){
		List<String> li_rank = payment.ranking_getreview();

		List<PerfomSaleDTO> li_per = new ArrayList<>();

		for(String rank : li_rank) {
			for(PerfomSaleDTO per : paymapper.getAllPayPerfom()) {
				if(per.getPerformance_code().equals(rank)){
					li_per.add(per);
					break;
				}
			}
			
		}
		List<Float> perfom = payment.getPostli(li_per);
		RankDTO rankData = new RankDTO();
	    rankData.setLi_per(li_per);
	    rankData.setPerfom(perfom);
		return rankData;
	}
	
	@GetMapping("/starRank")
	@ResponseBody
	RankDTO getreviewRank(){
		List<String> li_rank = payment.ranking_getstar();
		List<PerfomSaleDTO> li_per = new ArrayList<>();
		
		for(String rank : li_rank) {
			for(PerfomSaleDTO per : paymapper.getAllPayPerfom()) {
				if(per.getPerformance_code().equals(rank)){
					li_per.add(per);
					break;
				}
			}
			
		}
		List<Float> perfom = payment.getPostli(li_per);
		RankDTO rankData = new RankDTO();
	    rankData.setLi_per(li_per);
	    rankData.setPerfom(perfom);
		return rankData;
	}
	
	@GetMapping("/personal_info")	
	String goToPersonal() {
		return "/common/personal_info";
	}
}
