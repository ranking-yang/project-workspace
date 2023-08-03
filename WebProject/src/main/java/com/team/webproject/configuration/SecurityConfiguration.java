package com.team.webproject.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.firewall.DefaultHttpFirewall;
import org.springframework.security.web.firewall.HttpFirewall;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.team.webproject.dto.MembersDTO;
import com.team.webproject.mapper.LoginMapper;
import com.team.webproject.service.LoginService;
import com.team.webproject.service.LoginServiceImpl;

import lombok.RequiredArgsConstructor;
import javax.servlet.http.HttpServletRequest;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
	@Autowired
	AuthSuccessFailHandler authSuccessFailHandler;
	HttpServletRequest request;
	
	private final LoginServiceImpl loginService ;
	
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
	//------------------------------------------
	
	@Override
    protected void configure(HttpSecurity http) throws Exception {

        http.csrf().disable()
		    .authorizeRequests()
//		        .antMatchers("/admin/api").permitAll()    // 설정한 리소스의 접근을 인증절차 없이 허용
//		        .hasAuthority("ROLE_ADMIN")
		    	.antMatchers("/admin/api").hasRole("admin") // 관리자 페이지 admin 권한있으면.
		    	.antMatchers("/mypage").hasRole("user") // 마이페이지 user 권한 있으면.
		    	.antMatchers("/**").permitAll()
		    .and()
		        .formLogin()
		            .loginPage("/login")                         // 로그인으로 사용된 페이지의 매핑 URL
		            .loginProcessingUrl("/loginProc")                // 로그인을 처리할 매핑 URL
		            .defaultSuccessUrl("/main", true)
		            .usernameParameter("member_id") // 로그인시 사용된 계정 아이디 의 필드명
		            .passwordParameter("member_pwd") // 로그인시 사용된 계정 패스워드의 필드명
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
       
}
