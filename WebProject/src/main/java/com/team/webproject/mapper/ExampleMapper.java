package com.team.webproject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team.webproject.dto.Example;

@Mapper
public interface ExampleMapper {
	
	List<Example> getAll();

}