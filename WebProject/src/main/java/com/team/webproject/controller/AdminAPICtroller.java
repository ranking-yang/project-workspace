package com.team.webproject.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.webproject.dto.ShowDTO;
import com.team.webproject.mapper.AddPerformance;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AdminAPICtroller {
	
	@Autowired
	AddPerformance addPerformance;
	
	@GetMapping("/admin/api")
	String admin_Api() {
		
		return "/admin/Admin_PageApi";
	}
	
	@RequestMapping(value="/admin/api/select", method= RequestMethod.POST)
	@ResponseBody
	public List<ShowDTO> ajax() {

		List<ShowDTO> list = addPerformance.getAllShow();
		
		return list;
	}
}
