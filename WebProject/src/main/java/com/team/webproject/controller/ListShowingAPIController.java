package com.team.webproject.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
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
import com.fasterxml.jackson.databind.json.JsonMapper;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;
import com.team.webproject.dto.ShowDTO;
import com.team.webproject.service.PerformanceImpl;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ListShowingAPIController {
	
	@GetMapping("/showing")
	String getProduct(Model model) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		 
        String jsonInString = "";
        long start = System.currentTimeMillis();
        try {
 
            HttpComponentsClientHttpRequestFactory factory = new HttpComponentsClientHttpRequestFactory();
            factory.setConnectTimeout(5000); //타임아웃 설정 5초
            factory.setReadTimeout(5000);//타임아웃 설정 5초
            RestTemplate restTemplate = new RestTemplate(factory);
 
            HttpHeaders header = new HttpHeaders();
            HttpEntity<?> entity = new HttpEntity<>(header);
 
            String url = "http://www.culture.go.kr/openapi/rest/publicperformancedisplays/realm"
            		+ "?serviceKey=cXG%2BsVlagSV2%2FrTreOPObTV1p66Hho1fOgZi0uxSNS3GGBq7xLhMe9uPRSf3u4Ya%2BoyDgW4evwP42PU18PTy0g%3D%3D"
            		+ "&sortStdr=1&RequestTime=20100810:23003422";
            LocalDate date = LocalDate.now();
            LocalDate plusdate = date.plusMonths(1);
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
            String now = date.format(formatter);
            String plusnow = plusdate.format(formatter);
            String searchUrl = url+"&realmCode=D000&cPage=1&rows=10&from="+now+"to="+plusnow;
            
            UriComponents uri = UriComponentsBuilder.fromHttpUrl(searchUrl).build();
            System.out.println(uri);
            
            //이 한줄의 코드로 API를 호출해 MAP타입으로 전달 받는다.
            ResponseEntity<String> resultMap = restTemplate.getForEntity(uri.toString(), String.class);
            // xml convert 부분
            System.out.println(resultMap);
            System.out.println(resultMap.getHeaders());
            System.out.println(resultMap.getBody());
            
            XmlMapper xml = new XmlMapper();
            Object dataInstance = xml.readValue(resultMap.getBody().getBytes(), Object.class);
            
            // json convert 부분
            JsonMapper jsonMapper = new JsonMapper();
            String json = jsonMapper.writeValueAsString(dataInstance); // json to String 변환
            
            System.out.println(json);
            JSONParser parser = new JSONParser();
            JSONObject json2 = (JSONObject) parser.parse(json);
            
            
            model.addAttribute("json", json2.get("msgBody"));
            long end = System.currentTimeMillis();
            System.out.println("실행시간 : " + (end - start)/1000.0);
            
            
        } catch (HttpClientErrorException | HttpServerErrorException e) {
            result.put("statusCode", e.getRawStatusCode());
            result.put("body"  , e.getStatusText());
            System.out.println(e.toString());
            
        } catch (Exception e) {
            result.put("statusCode", "999");
            result.put("body"  , "excpetion오류");
            System.out.println(e.toString()); 
        }
        return "/search-list/search-list";
 
    }
	
}
