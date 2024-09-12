package com.team.webproject.controller;

import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.team.webproject.common.Principal;
import com.team.webproject.dto.MembersDTO;
import com.team.webproject.dto.MessageDTO;
import com.team.webproject.dto.OAuthPropertiesDTO;
import com.team.webproject.dto.SmsResponseDTO;
import com.team.webproject.service.CouponService;
import com.team.webproject.service.LoginService;
import com.team.webproject.service.SmsService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class LoginController {

	private final LoginService exService;
	private final CouponService couponService;
	private final OAuthPropertiesDTO oauth;
	private final SmsService smsService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET(Model model, HttpServletRequest request,
			@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "exception", required = false) String exception) {

		model.addAttribute("loginRequest", new MembersDTO());
		model.addAttribute("error", error);
		model.addAttribute("exception", exception);
		String referrer = request.getHeader("Referer");
		request.getSession().setAttribute("prevPage", referrer);

		return "login/login";
	}

	@GetMapping("/logout")
	public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
		MembersDTO member = Principal.getUser();
		// logout작동 안함
		if (member.getMember_id().startsWith("kakao_")) {
			return oauth.getInfo().append("redirect:").append(oauth.getKakaoLogoutUri()).append("?client_id=")
					.append(oauth.getKakaoClientId()).append("&logout_redirect_uri=")
					.append(oauth.getKakaoLogoutRedirectUri()).toString();
		} else {
			new SecurityContextLogoutHandler().logout(request, response,
					SecurityContextHolder.getContext().getAuthentication());
			return "redirect:/main";
		}
	}

	// 타임티켓 회원가입 페이지로
	@GetMapping("/user/newJoin")
	public String newJoinGET(MembersDTO member) {
		return "join/newJoin";
	}

	// 회원가입
	@PostMapping("/user/newJoin")
	public String newJoinPOST(@ModelAttribute("member") @Valid MembersDTO member, Errors errors, Model model,
			String member_pwd_verify) {

		if (errors.hasErrors()) {
			// 회원가입 실패시 입력 데이터 값을 유지
			model.addAttribute("member", member);
			// 비밀번호 재확인
			if (!member.getMember_pwd().equals(member_pwd_verify)) {
				model.addAttribute("pwd_check", " 비밀번호가 일치하지 않습니다.");
			} else if (member_pwd_verify.equals("")) {
				model.addAttribute("pwd_check", " 비밀번호를 다시 한번 입력해주세요.");
			}

			// 유효성 통과 못한 필드와 메시지를 핸들링
			Map<String, String> validatorResult = exService.validateHandling(errors);
			for (String key : validatorResult.keySet()) {
				model.addAttribute(key, validatorResult.get(key));
			}
			return "join/newJoin";
		} else {
			exService.add(member);
			// 회원가입시 기본쿠폰 추가로직
			couponService.saveCouponIntoNewUser();
			return "redirect:/login";
		}
	}

	@RequestMapping(value = "/join/idcheck", method = RequestMethod.POST)
	@ResponseBody
	public String checkid(@RequestParam("id") String id) {
		if (exService.checkId(id) == 0) {
			return "사용가능한 id 입니다.";
		} else {
			return "중복되는 id 입니다.";
		}
	}

	@RequestMapping(value = "/sms/send", method = RequestMethod.POST)
	@ResponseBody
	public SmsResponseDTO sendSms(@RequestParam("to") String to) throws UnsupportedEncodingException,
			URISyntaxException, NoSuchAlgorithmException, InvalidKeyException, JsonProcessingException {
		MessageDTO messageDto = new MessageDTO();
		messageDto.setTo(to);
		SmsResponseDTO responseDto = smsService.sendSms(messageDto);

		return responseDto;
	}

	@RequestMapping(value = "/sms/test", method = RequestMethod.POST)
	@ResponseBody
	public SmsResponseDTO sendtest(@RequestParam("to") String to) throws UnsupportedEncodingException,
			URISyntaxException, NoSuchAlgorithmException, InvalidKeyException, JsonProcessingException {

		SmsResponseDTO responseDto = new SmsResponseDTO();
		responseDto.setSmsConfirmNum("1234");

		return responseDto;

	}

	// 아이디 찾기 페이지
	@GetMapping("/findId")
	public String findIdGET() {

		return "join/findId";
	}

	@PostMapping("/findId/find")
	public String findIdPost(String member_name, String member_birth, String member_phone, Model model) {

		MembersDTO member = exService.findId(member_name, member_birth, member_phone);
		model.addAttribute("findid", member.getMember_id());

		return "join/findIdResult";
	}

	// 비밀번호 찾기 페이지
	@GetMapping("/findPassword")
	public String findPasswordGET() {
		return "join/findPassword";
	}

	@GetMapping("/findPassword/find")
	public String findPasswordPost(String member_id, String member_name, String member_birth, String member_phone) {
		MembersDTO member = exService.findPw(member_id, member_name, member_birth, member_phone);

		return "join/findPassword";
	}

}