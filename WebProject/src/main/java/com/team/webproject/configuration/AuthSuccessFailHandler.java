package com.team.webproject.configuration;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.team.webproject.dto.MembersDTO;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@Component // 빈 등록
@Slf4j // 로그
public class AuthSuccessFailHandler implements AuthenticationSuccessHandler , AuthenticationFailureHandler {

    @Autowired
    private ObjectMapper objectMapper = new ObjectMapper();


    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        String json = null;
        MembersDTO dto = (MembersDTO) authentication.getPrincipal();
        json = objectMapper.writeValueAsString(dto);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        response.getWriter().println(json);
    }

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
        String json  = objectMapper.writeValueAsString(false);

        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json"); // ? @ResponseBody 사용 안했을때는 직접 작용
        response.getWriter().println(json);
    }
}