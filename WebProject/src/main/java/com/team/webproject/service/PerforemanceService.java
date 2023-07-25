package com.team.webproject.service;

import java.util.List;

import org.json.simple.JSONObject;

import com.team.webproject.dto.ShowDTO;

public interface PerforemanceService {
	List<JSONObject> selectShow();
	
	int addShow(ShowDTO show);
	
	
}
