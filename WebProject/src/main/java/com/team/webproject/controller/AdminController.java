package com.team.webproject.controller;

import java.net.Authenticator.RequestorType;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.webproject.dto.MDPerformanceDTO;
import com.team.webproject.dto.MD_getDTO;
import com.team.webproject.dto.MDrecomDTO;
import com.team.webproject.dto.MembersDTO;
import com.team.webproject.dto.PerformanceDTO;
import com.team.webproject.dto.ShowDTO;
import com.team.webproject.mapper.AddPerformance;
import com.team.webproject.mapper.MD_RecomMapper;
import com.team.webproject.service.DateChange;
import com.team.webproject.service.LoginService;
import com.team.webproject.service.ProductListService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AdminController {
	
	@Autowired
	AddPerformance addPerformance;
	
	@Autowired
	ProductListService product;
	
	@Autowired
	MD_RecomMapper recom_MD;
	
	private final LoginService exService;
	private DateChange datech;
	// 관리자 페이지
	@GetMapping("/admin/api")
	public String adminGET(Model model){
		
		List<PerformanceDTO> performance_admin = product.getAllProduct();
		model.addAttribute("performance", performance_admin);
		
		return "admin/admin_main";
		
	}
	
	@PostMapping("/admin")
	public String adminPOST(
			@Param("id") String id,
			@Param("pwd") String pwd
			) {
		
		System.out.println("id: " + id);
		System.out.println("pwd: " + pwd);
		
		
		return "admin/adminPage";
	}
	
	// 관리자 페이지 전체 공연 DB조회
	@RequestMapping(value="/admin/api/select", method=RequestMethod.POST)
	@ResponseBody
	public List<ShowDTO> adminSelect(){
		
		List<ShowDTO> show = addPerformance.selectShow();
		for(ShowDTO data : show) {
			System.out.println(data.toString());
		}
		System.out.println(show.size());
		return show;
	}
	
	@PostMapping("/admin/mdreom/add")
	public void tableList(@RequestBody  MD_getDTO mdget){
		
		MDrecomDTO mddto = new MDrecomDTO();
		
		mddto.setMd_title(mdget.getMd_title());
		datech = new DateChange();
		mddto.setMd_period_start(datech.transformDate4(mdget.getMd_stdate()));
		mddto.setMd_period_end(datech.transformDate4(mdget.getMd_endate()));
		String area_concat = String.join(",", mdget.getMd_local());
		String show_concat = String.join(",", mdget.getMd_show());
		System.out.println(area_concat);
		System.out.println(show_concat);
		mddto.setMd_area(area_concat);
		mddto.setMd_genrenm(show_concat);
		recom_MD.addMDrecom(mddto);
		System.out.println(mddto);
		int md_seq = recom_MD.currseq();
		
		MDPerformanceDTO mdperDTO = new MDPerformanceDTO();
		for(int i =0; i<mdget.getMd_performance().size(); i++) {
			
			mdperDTO.setRecommened_performance(mdget.getMd_performance().get(i));
			mdperDTO.setMd_code(md_seq);
			mdperDTO.setRecommened_performance_name(mdget.getMd_perfotitle().get(i));
			recom_MD.addMDperfo(mdperDTO);
			System.out.println(mdperDTO);
		}
		
		
		
	}
	
	

}
