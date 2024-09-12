package com.team.webproject.configuration;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.firewall.DefaultHttpFirewall;
import org.springframework.security.web.firewall.HttpFirewall;

import lombok.RequiredArgsConstructor;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

	HttpServletRequest request;
	
	private final AuthenticationFailureHandler customFailureHandler;
	
	@Bean
	public static BCryptPasswordEncoder bCryptPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
	// "더블 슬래쉬 허용"
	@Override
	public void configure(WebSecurity web) throws Exception {
	    web.httpFirewall(defaultHttpFirewall());
	}
	 
	@Bean
	public HttpFirewall defaultHttpFirewall() {
	    return new DefaultHttpFirewall();
	}

	
	@Override
    protected void configure(HttpSecurity http) throws Exception {

        http.csrf().disable()
		    .authorizeRequests()
		    	.antMatchers("/admin/api").hasRole("admin") // 관리자 페이지 admin 권한있으면.
		    	.antMatchers("/mypage").hasRole("member") // 마이페이지 user 권한 있으면.
		    	.antMatchers("/as/one-on-one").hasRole("member") // 1:1 문의
		    	.antMatchers("/**").permitAll()
		    .and()
		        .formLogin()
		            .loginPage("/login")                         // 로그인으로 사용된 페이지의 매핑 URL
		            .loginProcessingUrl("/loginProc")                // 로그인을 처리할 매핑 URL
		            .failureHandler(customFailureHandler)
		            .usernameParameter("member_id") // 로그인시 사용된 계정 아이디 의 필드명
		            .passwordParameter("member_pwd") // 로그인시 사용된 계정 패스워드의 필드명
		            .successHandler(successHandler())
		            .permitAll()
		    .and()
		        .logout()		        	
		        	.logoutUrl("/logout") // 로그아웃 처리 를 요청할 매핑 URL
			        .logoutSuccessUrl("/main") //로그아웃 성공했을때 이동할 매핑 URL
			        .invalidateHttpSession(true).deleteCookies("JSESSIONID")// 세션 초기화
	        .and()
		    	.exceptionHandling()
				.accessDeniedPage("/main"); //권한 없으면
	}
	// 성공 핸들러
	@Bean
	public AuthenticationSuccessHandler successHandler() {
	    return new CustomLoginSuccessHandler("/defaultUrl");
	}
	
}
