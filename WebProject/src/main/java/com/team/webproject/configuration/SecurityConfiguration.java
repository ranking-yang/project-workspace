package com.team.webproject.configuration;

//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Bean;
//import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.security.web.SecurityFilterChain;
//import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
// 
//import lombok.AllArgsConstructor;
// 
//@EnableWebSecurity
//@AllArgsConstructor
//public class SecurityConfiguration {
// 
//	private final UserDetailsService userDetailsService;
// 
//	@Bean
//	public static BCryptPasswordEncoder bCryptPasswordEncoder() {
//		return new BCryptPasswordEncoder();
//	}
// 
//	@Bean
//	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
//		/* @formatter:off */
//		http
//			.authorizeRequests()
//				.antMatchers("/", "/login", "/join/newJoin", "/main", "/resources/**").permitAll() // 설정한 리소스의 접근을 인증절차 없이 허용
//				.anyRequest().authenticated() // 그 외 모든 리소스를 의미하며 인증 필요
//				.and()
//			.formLogin()
//				.permitAll()
//				.loginPage("/login") // 기본 로그인 페이지
//				.and()
//			.logout()
//				.permitAll()
//				// .logoutUrl("/logout") // 로그아웃 URL (기본 값 : /logout)
//				// .logoutSuccessUrl("/login?logout") // 로그아웃 성공 URL (기본 값 : "/login?logout")
//				.logoutRequestMatcher(new AntPathRequestMatcher("/logout")) // 주소창에 요청해도 포스트로 인식하여 로그아웃
//				.deleteCookies("JSESSIONID") // 로그아웃 시 JSESSIONID 제거
//				.invalidateHttpSession(true) // 로그아웃 시 세션 종료
//				.clearAuthentication(true); // 로그아웃 시 권한 제거
//		
//		return http.build();
//		/* @formatter:on */
//	}
// 
//	@Autowired
//	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
//		auth.userDetailsService(userDetailsService).passwordEncoder(bCryptPasswordEncoder());
//	}
//}


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.team.webproject.dto.MembersDTO;
import com.team.webproject.mapper.LoginMapper;
import com.team.webproject.service.LoginService;
import com.team.webproject.service.LoginServiceImpl;

import lombok.RequiredArgsConstructor;

import static org.springframework.security.config.Customizer.withDefaults;

import java.util.Collection;

import javax.servlet.DispatcherType;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;



@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

	HttpServletRequest request;
	
	private final LoginServiceImpl loginService ;
	
	@Bean
	public static BCryptPasswordEncoder bCryptPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
	@Override
    protected void configure(HttpSecurity http) throws Exception {

        http
		    .authorizeRequests()
//		        .antMatchers("/admin/api").permitAll()    // 설정한 리소스의 접근을 인증절차 없이 허용
//		        .hasAuthority("ROLE_ADMIN")
//		    	.antMatchers("/admin/api").hasRole("admin")
		    	.anyRequest().permitAll() // 모든 접근 허용
		    	
		    .and()
		        .formLogin()
		        .loginPage("/login")
		        .defaultSuccessUrl("/main", true)
		        .permitAll()
            .and()
            	.exceptionHandling()
        		.accessDeniedPage("/login"); //권한 없으면
    }
    
//    // 예외처리로 resources 파일 예외
//    public void configure(WebSecurity web) throws Exception {
//    	try {
//    		web.ignoring().antMatchers("/status","/resources/**", "/user/newJoin","/logout", "/login","/join/idcheck","/main", "/sms/test","/search", "/product/performance", "/detail", "/product/product-detail**", "/product/product-detail?performance_code=*");
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
//        
//    }
    
//    // login check
    
}
