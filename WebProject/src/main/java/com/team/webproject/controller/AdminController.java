package com.team.webproject.controller;

import java.net.Authenticator.RequestorType;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.webproject.dto.MembersDTO;
import com.team.webproject.dto.ShowDTO;
import com.team.webproject.mapper.AddPerformance;
import com.team.webproject.service.LoginService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AdminController {
	
	@Autowired
	AddPerformance addPerformance;
	
	private final LoginService exService;
	
	// 관리자 페이지
	@GetMapping("/admin/api")
	public String adminGET(){
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
	
	@RequestMapping(value = "/admin/api/add", method = RequestMethod.POST)
	@ResponseBody
	public void tableList(@RequestBody List<ShowDTO> dataArrayToSend) throws Exception {
		
		System.out.println(dataArrayToSend);
		System.out.println(dataArrayToSend.size());
		for(ShowDTO show : dataArrayToSend) {
			addPerformance.addShow(show);
			System.out.println(show);
		}
	}

}
