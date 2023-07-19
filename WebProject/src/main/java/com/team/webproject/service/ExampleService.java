package com.team.webproject.service;

import java.util.List;

import com.team.webproject.dto.Example;
import com.team.webproject.dto.MembersDTO;

public interface ExampleService {
	List<Example> getAll();

	public void memberJoin(MembersDTO member) throws Exception;

	int add(MembersDTO login);
}
