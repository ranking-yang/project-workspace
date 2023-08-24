package com.team.webproject.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.webproject.common.Pagination;
import com.team.webproject.dto.OneOnAsDTO;
import com.team.webproject.service.AsService;
import com.team.webproject.service.LoginService;

import lombok.RequiredArgsConstructor;


@Controller
@RequestMapping("/as")
@RequiredArgsConstructor
public class AsController {
	
	private final AsService asService;
	private final Pagination pagination;
	private final LoginService loginservice;
	private int initPageNum = 1;
	
	@GetMapping("/notice")
	String getNotice(Model model) {
		model.addAttribute("pageBtnNum", asService.getNoticePageBtnNumber(initPageNum, pagination));
		model.addAttribute("listInPage", asService.showNoticePage(pagination.getStart(), pagination.getEnd()));
		model.addAttribute("pagination", pagination);
		return "/as/as-notice";
	}
	
	@GetMapping("/notice/list")
	String getNoticeForPage(int pageNum, Model model) {
		model.addAttribute("pageBtnNum", asService.getNoticePageBtnNumber(pageNum, pagination));
		model.addAttribute("listInPage", asService.showNoticePage(pagination.getStart(), pagination.getEnd()));
		model.addAttribute("pagination", pagination);
		return "/as/as-notice";
	}
	
	@GetMapping("/notice/detail")
	String getNoticeDetail(int no, Model model) {
		model.addAttribute("notice", asService.getNoticeContent(no));
		
		return "/as/as-notice-detail";
	}
	
	@GetMapping("/freq")
	String getFreqQuestion(Model model) {
		model.addAttribute("pageBtnNum", asService.getFreqPageBtnNumber(initPageNum, pagination));
		model.addAttribute("listInPage", asService.showFreqQuestionPage(pagination.getStart(), pagination.getEnd()));
		model.addAttribute("pagination", pagination);
		return "/as/as-freq-question";
	}
	
	@GetMapping("/freq/list")
	String getFreqQuestionForPage(int pageNum, Model model) {
		model.addAttribute("pageBtnNum", asService.getFreqPageBtnNumber(pageNum, pagination));
		model.addAttribute("listInPage", asService.showFreqQuestionPage(pagination.getStart(), pagination.getEnd()));
		model.addAttribute("pagination", pagination);
		return "/as/as-freq-question";
	}
	
	@GetMapping("/freq/detail")
	String getFreqQuestionDetail(int no, Model model) {
		model.addAttribute("freq", asService.getFreqContent(no));
		
		return "/as/as-freq-detail";
	}
	
	
	
	@GetMapping("/one-on-one")
	String getAsOneOnOne(Model model) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = ((UserDetails) principal).getUsername();
		model.addAttribute("pageBtnNum", asService.getOneOnPageBtnNumber(initPageNum, pagination));
		model.addAttribute("pagination", pagination);
		model.addAttribute("oneonDto", asService.getOneOnList(loginservice.getMember(username).getMember_code(), pagination.getStart(), pagination.getEnd()));
		return "/as/as-one-on-one";
	}
	
	@GetMapping("/one-on-one/list")
	String getOneOnForPage(int pageNum, Model model) {
		System.out.println("pageNum: >>>>>>>>"+ pageNum);
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = ((UserDetails) principal).getUsername();
		model.addAttribute("pageBtnNum", asService.getOneOnPageBtnNumber(pageNum, pagination));
		model.addAttribute("oneonDto", asService.getOneOnList(loginservice.getMember(username).getMember_code(), pagination.getStart(), pagination.getEnd()));
		model.addAttribute("pagination", pagination);
		return "/as/as-one-on-one";
	}
	
	@GetMapping("/one-on-one-detail")
	String getAsOneOn_detail() {
		return "/as/as-one-on-one-detail";
	}
	
	@PostMapping("/one-on-one/write")
	String writeOneOn(String oneon_title, String oneon_content) {
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = ((UserDetails) principal).getUsername();
		
		OneOnAsDTO oneondto = new OneOnAsDTO();
		oneondto.setOne_title(oneon_title);
		oneondto.setOne_content(oneon_content);
		oneondto.setWriter_code(loginservice.getMember(username).getMember_code());
		oneondto.setOne_state(1);
		asService.addOneOnContent(oneondto);
		
//		model.addAttribute("oneonDto", asService.getOneOnList(loginservice.getMember(username).getMember_code()));
		return "redirect:/as/one-on-one";
	}
	
	@GetMapping("/one-on-one/select")
	String selectOneOn(Model model, int onecode) {
		model.addAttribute("oneselect", asService.selectOneTitle(onecode)); 
		return "/as/as-one-on-one-select";
	}
	
}
