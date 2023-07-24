package com.team.webproject;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieServlet extends HttpServlet{
	
	public void setCookie(HttpServletResponse response) {
	    Cookie cookie = new Cookie("cookieName", "cookieValue");
	    cookie.setMaxAge(24*60*60); // 쿠키 expiration 타임
	    cookie.setPath("/"); // 모든 경로에서 접근 가능 하도록 설정
	    response.addCookie(cookie);
	}
	
	public void infoCookie(HttpServletRequest request) {
	    Cookie[] cookie = request.getCookies();
	    for (Cookie cok : cookie) {
	        System.out.println("쿠키 이름: " + cok.getName());
	        System.out.println("쿠키 값: " + cok.getValue());
	    }
	}
}
