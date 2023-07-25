package com.team.webproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.webproject.common.Pagination;
import com.team.webproject.service.AsService;

import lombok.RequiredArgsConstructor;


@Controller
@RequestMapping("/as")
@RequiredArgsConstructor
public class AsController {
	
	private final AsService asService;
	private final Pagination pagination;
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
	String getAsOneOnOne() {
		return "/as/as-one-on-one";
	}
	
}
