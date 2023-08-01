package com.team.webproject.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import static org.springframework.security.config.Customizer.withDefaults;

import javax.servlet.DispatcherType;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;



@Configuration
@EnableWebSecurity
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
    LoginIdPwValidator loginIdPwValidator;
	
	HttpServletRequest request;
	

    protected void configure(HttpSecurity http, HttpSession session) throws Exception {
        http
		    .authorizeRequests()
//		        .antMatchers("/admin/api").permitAll()    // 설정한 리소스의 접근을 인증절차 없이 허용
//		        .hasAuthority("ROLE_ADMIN")
//		    	.antMatchers("/admin").authenticated()
//		    	.antMatchers("/mypage").access("hasRole('"+session.getAttribute("userId")+"')")
		    	.anyRequest().permitAll() // 모든 접근 허용
		    	
		    .and()
		        .formLogin()
		        .loginPage("/login")
//		        .loginProcessingUrl("/login")
//		        .usernameParameter("member_id")
//		        .passwordParameter("member_pwd")
		        .defaultSuccessUrl("/mypage", true)
		        .permitAll()
		    .and()
                .logout()
                .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
            .and()
            	.exceptionHandling()
        		.accessDeniedPage("/login"); //권한 없으면
    }
    
    // 예외처리로 resources 파일 예외
    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/status","/resources/**", "/user/newJoin", "/login","/join/idcheck", "/sms/test","/search", "/product/performance", "/detail", "/product/product-detail**", "/product/product-detail?performance_code=*");
    }
    // login check
    @Override
    public void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(loginIdPwValidator);
    }
}