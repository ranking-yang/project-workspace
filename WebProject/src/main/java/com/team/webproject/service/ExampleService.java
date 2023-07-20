package com.team.webproject.service;

import com.team.webproject.dto.MembersDTO;

public interface ExampleService {
	

	void memberJoin(MembersDTO member) throws Exception;

	int add(MembersDTO login);
}
