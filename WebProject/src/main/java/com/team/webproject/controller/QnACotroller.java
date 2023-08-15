package com.team.webproject.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.team.webproject.dto.QnADTO;
import com.team.webproject.mapper.QnAMapper;

@RestController
public class QnACotroller {

	 
	@Autowired
	QnAMapper qnaMapper;
	
	@PostMapping(value={"/addQnA"})
	@CrossOrigin(origins = "", methods = RequestMethod.POST)
	ResponseEntity<Map<String, Object>> addQnA(@RequestBody QnADTO qnaData) {
		
		qnaMapper.insertQnA(qnaData);
		System.out.println(qnaData);
		
		Map<String, Object> response = new HashMap<>();
	    response.put("message", "QnA가 추가되었습니다.");
	    
	    // JSON 형태로 응답 전송
	    return ResponseEntity.ok().body(response);
	}
	
	
	 @PostMapping("/getQnAlist")
	    public ResponseEntity<Map<String, Object>> getQnAlist(@RequestBody JSONObject json) {
		 	String performance_code = (String) json.get("performance_code");
		 	List<QnADTO> getQnAlist =  qnaMapper.getPerformanceQnA(performance_code);
		 	int countQnAlist = qnaMapper.getPerformanceQnACount(performance_code);
		 	
		 	Map<String, Object> result = new HashMap<>();
		 	result.put("qnalist", getQnAlist);
		 	result.put("count", countQnAlist);
		 	
		 	
	        return ResponseEntity.ok().body(result);
	    }

	
}
