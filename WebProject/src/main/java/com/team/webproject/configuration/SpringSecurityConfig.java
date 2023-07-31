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



@Configuration
@EnableWebSecurity
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
    LoginIdPwValidator loginIdPwValidator;
	
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
		    .authorizeRequests()
		        .antMatchers("/chk").permitAll()    // LoadBalancer Chk
//		        .antMatchers("/manage").hasAuthority("ROLE_ADMIN")
		        .anyRequest().authenticated()
		    .and()
		        .formLogin()
		        .loginPage("/login")
		        .loginProcessingUrl("/login")
		        .usernameParameter("member_id")
		        .passwordParameter("member_pwd")
		        .defaultSuccessUrl("/main", true)
		        .permitAll()
		    .and()
                .logout()
                .logoutRequestMatcher(new AntPathRequestMatcher("/logout"));
    }
    
    // 예외처리로 resources 파일 예외
    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/resources/**", "/user/newJoin", "/main", "/login");
    }
    // login check
    @Override
    public void configure(AuthenticationManagerBuilder auth) throws Exception {
    	
        auth.userDetailsService(loginIdPwValidator);
    }
}