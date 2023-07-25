package com.team.webproject.controller;

import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.team.webproject.mapper.PerformanceMapper;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class DetailController {
	
	// 나중에 product list controller랑 합치기	
	@Autowired
	PerformanceMapper performanceMapper;
   
    @GetMapping("/detail")
   String callAPI(Model model) throws JsonProcessingException {

       HashMap<String, Object> result = new HashMap<String, Object>();

       String jsonInString = "";

       try {

           HttpComponentsClientHttpRequestFactory factory = new HttpComponentsClientHttpRequestFactory();
           factory.setConnectTimeout(5000); //타임아웃 설정 5초
           factory.setReadTimeout(5000);//타임아웃 설정 5초
           RestTemplate restTemplate = new RestTemplate(factory);

           HttpHeaders header = new HttpHeaders();
           HttpEntity<?> entity = new HttpEntity<>(header);

           String url = "http://www.kopis.or.kr/openApi/restful/pblprfr/PF222378";

           UriComponents uri = UriComponentsBuilder.fromHttpUrl(url+"?"+"service=c7e9ff4fa5dd433aac399c3804a60abb").build();

           //이 한줄의 코드로 API를 호출해 MAP타입으로 전달 받는다.
           ResponseEntity<Map> resultMap = restTemplate.exchange(uri.toString(), HttpMethod.GET, entity, Map.class);
           result.put("statusCode", resultMap.getStatusCodeValue()); //http status code를 확인
           result.put("header", resultMap.getHeaders()); //헤더 정보 확인
           result.put("body", resultMap.getBody()); //실제 데이터 정보 확인
           
           //데이터를 제대로 전달 받았는지 확인 string형태로 파싱해줌
           ObjectMapper mapper = new ObjectMapper();
           System.out.println(mapper.writeValueAsString(resultMap.getBody().get("db")));
           jsonInString = mapper.writeValueAsString(resultMap.getBody().get("db"));
           JSONParser parser = new JSONParser();
           JSONObject jsonob = (JSONObject) parser.parse(jsonInString);
           
           model.addAttribute("date", jsonob.get("dtguidance")); // 공연 일
           model.addAttribute("runtime", jsonob.get("prfruntime")); // 러닝타임
           model.addAttribute("age", jsonob.get("prfage")); // 연령
           model.addAttribute("image", jsonob.get("styurls")); // 소개이미지

       } catch (HttpClientErrorException | HttpServerErrorException e) {
           result.put("statusCode", e.getRawStatusCode());
           result.put("body"  , e.getStatusText());
           System.out.println(e.toString());
           
       } catch (Exception e) {
           result.put("statusCode", "999");
           result.put("body"  , "excpetion오류");
           System.out.println(e.toString()); 
       }
       
       model.addAttribute("perfomance", performanceMapper.getPerformance("PF222378")); // 임의로 넣어놓음
       
       return "/detail/detail";  
   }
	
}
