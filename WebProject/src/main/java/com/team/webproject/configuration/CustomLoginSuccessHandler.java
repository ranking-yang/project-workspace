package com.team.webproject.configuration;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;


public class CustomLoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
	public CustomLoginSuccessHandler(String defaultTargetUrl) {
		setDefaultTargetUrl(defaultTargetUrl);
	}


	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws ServletException, IOException {
		
		List<String> roleNames = new ArrayList<>();
		authentication.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});
		if (roleNames.contains("ROLE_admin")) {
			response.sendRedirect("/admin/api");
			return;
		}
		
		HttpSession session = request.getSession();
		
		if (session != null) {
			String redirectUrl = (String) session.getAttribute("prevPage");
			
			if (redirectUrl != null) {
				
				if ("/login".equals(redirectUrl.substring(redirectUrl.length()-6, redirectUrl.length()))) { // login 이 prevPage 이면
					String tempUrl = redirectUrl.substring(0, redirectUrl.length() -6);
					redirectUrl = tempUrl+"/main";
					getRedirectStrategy().sendRedirect(request, response, redirectUrl);
				
				} else if(redirectUrl.contains("error")){ // error가 포함 되어 있다면.
					
					int tempint = redirectUrl.indexOf("/login");
					String tempUrl = redirectUrl.substring(0,tempint); 
					redirectUrl = tempUrl+"/main";
					getRedirectStrategy().sendRedirect(request, response, redirectUrl);
				
				} else if(redirectUrl.contains("findId")){ // error가 포함 되어 있다면.
					
					int tempint = redirectUrl.indexOf("/findId");
					String tempUrl = redirectUrl.substring(0,tempint); 
					redirectUrl = tempUrl+"/main";
					getRedirectStrategy().sendRedirect(request, response, redirectUrl);
				
				}else if(redirectUrl.contains("findPassword") ){ // error가 포함 되어 있다면.
					
					int tempint = redirectUrl.indexOf("/findPassword");
					String tempUrl = redirectUrl.substring(0,tempint); 
					redirectUrl = tempUrl+"/main";
					getRedirectStrategy().sendRedirect(request, response, redirectUrl);
				
				}else if(redirectUrl.contains("/user/newJoin")){ // error가 포함 되어 있다면.
					
					int tempint = redirectUrl.indexOf("/user/newJoin");
					String tempUrl = redirectUrl.substring(0,tempint); 
					redirectUrl = tempUrl+"/main";
					getRedirectStrategy().sendRedirect(request, response, redirectUrl);
				
				}else { // 로그인이 성공되면. 로그인 실패 후 로그인이면 main으로 redirect
					
					session.removeAttribute("prevPage");
					getRedirectStrategy().sendRedirect(request, response, redirectUrl);
				
				}
			
			} else {
				super.onAuthenticationSuccess(request, response, authentication);
			}
		} else {
			super.onAuthenticationSuccess(request, response, authentication);
		}
	}


}