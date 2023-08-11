package com.team.webproject.common;

import org.springframework.security.core.context.SecurityContextHolder;

import com.team.webproject.dto.MembersDTO;


public class Principal {
	
	public static MembersDTO getUser() {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return (MembersDTO) principal;
	}

}
