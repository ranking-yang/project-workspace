package com.team.webproject.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.origin.SystemEnvironmentOrigin;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.databind.json.JsonMapper;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;

import com.team.webproject.dto.ShowDTO;
import com.team.webproject.mapper.AddPerformance;
import com.team.webproject.service.DateChange;


import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ListShowAPIController {


	@Autowired
	AddPerformance addPerformance;
	
	
	
	private DateChange datech;
	private Map<String, String> detail(String id) {
		Map<String, String> li_detail = new HashMap<>();
		
		try {
			HttpComponentsClientHttpRequestFactory factory = new HttpComponentsClientHttpRequestFactory();
		    factory.setConnectTimeout(5000); //타임아웃 설정 5초
		    factory.setReadTimeout(5000);//타임아웃 설정 5초
		    RestTemplate restTemplate = new RestTemplate(factory);
		    
			String urldetail = "http://www.kopis.or.kr/openApi/restful/pblprfr/"+id+"?service=c7e9ff4fa5dd433aac399c3804a60abb";
			UriComponents uri = UriComponentsBuilder.fromHttpUrl(urldetail).build();
			ResponseEntity<String> resultMap = restTemplate.getForEntity(uri.toString(), String.class);
		    // xml convert 부분
		    XmlMapper xml = new XmlMapper();
		    Object dataInstance = xml.readValue(resultMap.getBody().getBytes(), Object.class);
		    // json convert 부분
		    JsonMapper jsonMapper = new JsonMapper();
		    String json = jsonMapper.writeValueAsString(dataInstance); // json to String 변환
		    JSONParser parser = new JSONParser();
		    JSONObject alljson = (JSONObject) parser.parse(json);
		    JSONObject dbjson =  (JSONObject) alljson.get("db");
		    String addressid = (String) dbjson.get("mt10id");
		    String addressurl = "http://www.kopis.or.kr/openApi/restful/prfplc/"+addressid+"?service=c7e9ff4fa5dd433aac399c3804a60abb";
		    UriComponents uri2 = UriComponentsBuilder.fromHttpUrl(addressurl).build();
			ResponseEntity<String> resultMap2 = restTemplate.getForEntity(uri2.toString(), String.class);
		    // xml convert 부분
		    XmlMapper xml2 = new XmlMapper();
		    Object dataInstance2 = xml2.readValue(resultMap2.getBody().getBytes(), Object.class);
		    // json convert 부분
		    JsonMapper jsonMapper2 = new JsonMapper();
		    String jsonaddress = jsonMapper2.writeValueAsString(dataInstance2); // json to String 변환
		    JSONParser parser2 = new JSONParser();
		    JSONObject addressResult = (JSONObject) parser2.parse(jsonaddress);
		    
		    JSONObject addresjson = (JSONObject)addressResult.get("db");
		    
		    String adres = (String) addresjson.get("adres");
		    String lat = (String) addresjson.get("la"); // 위도 적도 기준 북남 (Y)
		    String lon = (String) addresjson.get("lo"); // 경도 영국천문대 기준 동서 (X)
		    li_detail.put("adres", adres);
		    li_detail.put("lat", lat);
		    li_detail.put("lon", lon);
		    return li_detail;
		    
		}catch(HttpClientErrorException | HttpServerErrorException e) {
            System.out.println(e.toString());
            return null;
		}catch (Exception e) {
            System.out.println(e.toString());
            return null;
        }
        
	}
	@GetMapping("/admin/api/theater_show")
	@ResponseBody
	List<ShowDTO> getShow_Product() {
		List<ShowDTO> showli = new ArrayList<>();
		HashMap<String, Object> result = new HashMap<String, Object>();
		HashMap<String, String> category = new HashMap<>();
		category.put("연극", "AAAA");
		category.put("뮤지컬", "AAAB");
		category.put("무용", "BBBA");
        long start = System.currentTimeMillis();
        try {
 
            HttpComponentsClientHttpRequestFactory factory = new HttpComponentsClientHttpRequestFactory();
            factory.setConnectTimeout(5000); //타임아웃 설정 5초
            factory.setReadTimeout(5000);//타임아웃 설정 5초
            RestTemplate restTemplate = new RestTemplate(factory);
 
            HttpHeaders header = new HttpHeaders();
            HttpEntity<?> entity = new HttpEntity<>(header);
 
            String url = "http://www.kopis.or.kr/openApi/restful/pblprfr?service=c7e9ff4fa5dd433aac399c3804a60abb";

            LocalDate date = LocalDate.now();
            LocalDate plusdate = date.plusMonths(1);
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
            String now = date.format(formatter);
            String plusnow = plusdate.format(formatter);
            for(String key: category.keySet()) {
            	System.out.println(key);
            	String searchUrl = url+"&stdate="+now+"&eddate="+plusnow+"&cpage=1&rows=100&shcate="+category.get(key)+"&kidstate=N";
            	
            	UriComponents uri = UriComponentsBuilder.fromHttpUrl(searchUrl).build();
            	
            	
            	//이 한줄의 코드로 API를 호출해 MAP타입으로 전달 받는다.
            	ResponseEntity<String> resultMap = restTemplate.getForEntity(uri.toString(), String.class);
            	// xml convert 부분
            	XmlMapper xml = new XmlMapper();
            	Object dataInstance = xml.readValue(resultMap.getBody().getBytes(), Object.class);
            	// json convert 부분
            	JsonMapper jsonMapper = new JsonMapper();
            	String json = jsonMapper.writeValueAsString(dataInstance); // json to String 변환
            	JSONParser parser = new JSONParser();
            	JSONObject json2 = (JSONObject) parser.parse(json);
            	datech = new DateChange();
            	// api에서 가져오는 데이터 json list로
            	List<JSONObject> lijson = (List<JSONObject>) json2.get("db");
            	// DB에 들어가있는 값중 코드가 겹치는 코드 검사
            	
            	
            	for(int i=0; i<lijson.size(); i++) {
            		ShowDTO show = new ShowDTO();
            		JSONObject js = lijson.get(i);
            		
        			show.setPerformance_code((String)js.get("mt20id"));
        			show.setPerformance_name((String)js.get("prfnm"));
        			show.setPerformance_qty(50);
        			show.setMain_category("show");
        			show.setSub_category((String)js.get("genrenm"));
        			show.setPerformance_price(3000);
        			show.setStart_date(datech.transformDate((String)js.get("prfpdfrom")));
        			show.setEnd_date(datech.transformDate((String)js.get("prfpdto")));
        			Map<String, String> detail_map= detail((String)js.get("mt20id"));
        			show.setAddress(detail_map.get("adres"));
        			show.setPlace((String) js.get("fcltynm"));
        			show.setPoster((String) js.get("poster"));
        			show.setLat(Double.parseDouble(detail_map.get("lat")));
        			show.setLon(Double.parseDouble(detail_map.get("lon")));
        			try {
        				showli.add(show);
//        				System.out.println("3번"+show.toString());
//        				addPerformance.addShow(show);
        				
        			}catch(Exception e) {
        				continue;
        			}
            		
            	}
            }

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
        
        return showli;

    }
	@GetMapping("/admin/api/theater_music")
	@ResponseBody
	List<ShowDTO> getMusic_product() {
		List<ShowDTO> showli = new ArrayList<>();
		HashMap<String, Object> result = new HashMap<String, Object>();
		HashMap<String, String> category = new HashMap<>();
		category.put("클래식", "CCCA");
		category.put("오페라", "CCCB");
		category.put("국악", "CCCC");
		category.put("복합", "EEEA");
		long start = System.currentTimeMillis();
        try {
 
            HttpComponentsClientHttpRequestFactory factory = new HttpComponentsClientHttpRequestFactory();
            factory.setConnectTimeout(5000); //타임아웃 설정 5초
            factory.setReadTimeout(5000);//타임아웃 설정 5초
            RestTemplate restTemplate = new RestTemplate(factory);
 
            HttpHeaders header = new HttpHeaders();
            HttpEntity<?> entity = new HttpEntity<>(header);
 
            String url = "http://www.kopis.or.kr/openApi/restful/pblprfr?service=c7e9ff4fa5dd433aac399c3804a60abb";

            LocalDate date = LocalDate.now();
            LocalDate plusdate = date.plusMonths(1);
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
            String now = date.format(formatter);
            String plusnow = plusdate.format(formatter);
            for(String key: category.keySet()) {
            	String searchUrl = url+"&stdate="+now+"&eddate="+plusnow+"&cpage=1&rows=100&shcate="+category.get(key)+"&kidstate=N";
            	
            	UriComponents uri = UriComponentsBuilder.fromHttpUrl(searchUrl).build();
            	
            	
            	//이 한줄의 코드로 API를 호출해 MAP타입으로 전달 받는다.
            	ResponseEntity<String> resultMap = restTemplate.getForEntity(uri.toString(), String.class);
            	// xml convert 부분
            	XmlMapper xml = new XmlMapper();
            	Object dataInstance = xml.readValue(resultMap.getBody().getBytes(), Object.class);
            	// json convert 부분
            	JsonMapper jsonMapper = new JsonMapper();
            	String json = jsonMapper.writeValueAsString(dataInstance); // json to String 변환
            	JSONParser parser = new JSONParser();
            	JSONObject json2 = (JSONObject) parser.parse(json);
            	datech = new DateChange();
            	// api에서 가져오는 데이터 json list로
            	List<JSONObject> lijson = (List<JSONObject>) json2.get("db");
            	// DB에 들어가있는 값중 코드가 겹치는 코드 검사
            	
            	
            	for(int i=0; i<lijson.size(); i++) {
            		ShowDTO show = new ShowDTO();
            		JSONObject js = lijson.get(i);
            		
        			show.setPerformance_code((String)js.get("mt20id"));
        			show.setPerformance_name((String)js.get("prfnm"));
        			show.setPerformance_qty(50);
        			show.setMain_category("music");
        			show.setSub_category((String)js.get("genrenm"));
        			show.setPerformance_price(300);
        			show.setStart_date(datech.transformDate((String)js.get("prfpdfrom")));
        			show.setEnd_date(datech.transformDate((String)js.get("prfpdto")));
        			Map<String, String> detail_map= detail((String)js.get("mt20id"));
        			show.setAddress(detail_map.get("adres"));
        			show.setPlace((String) js.get("fcltynm"));
        			show.setPoster((String) js.get("poster"));
        			show.setLat(Double.parseDouble(detail_map.get("lat")));
        			show.setLon(Double.parseDouble(detail_map.get("lon")));
        			try {
//        				System.out.println("music:"+show.toString());
//        				addPerformance.addShow(show);
        				showli.add(show);
        			}catch(Exception e) {
        				continue;
        			}
            		
            	}
            }

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
        
        return showli;

    }
	@GetMapping("/admin/api/theater_kids")
	@ResponseBody
	List<ShowDTO> getKid_product() {
		List<ShowDTO> showli = new ArrayList<>();
		HashMap<String, Object> result = new HashMap<String, Object>();
		HashMap<String, String> category = new HashMap<>();
		category.put("연극", "AAAA");
		category.put("뮤지컬", "AAAB");
		category.put("무용", "BBBA");
		category.put("클래식", "CCCA");
		category.put("오페라", "CCCB");
		category.put("국악", "CCCC");
		category.put("복합", "EEEA");
		long start = System.currentTimeMillis();
        try {
 
            HttpComponentsClientHttpRequestFactory factory = new HttpComponentsClientHttpRequestFactory();
            factory.setConnectTimeout(5000); //타임아웃 설정 5초
            factory.setReadTimeout(5000);//타임아웃 설정 5초
            RestTemplate restTemplate = new RestTemplate(factory);
 
            HttpHeaders header = new HttpHeaders();
            HttpEntity<?> entity = new HttpEntity<>(header);
 
            String url = "http://www.kopis.or.kr/openApi/restful/pblprfr?service=c7e9ff4fa5dd433aac399c3804a60abb";

            LocalDate date = LocalDate.now();
            LocalDate plusdate = date.plusMonths(1);
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
            String now = date.format(formatter);
            String plusnow = plusdate.format(formatter);
            for(String key: category.keySet()) {
            	
            	String searchUrl = url+"&stdate="+now+"&eddate="+plusnow+"&cpage=1&rows=100&shcate="+category.get(key)+"&kidstate=Y";
            	
            	UriComponents uri = UriComponentsBuilder.fromHttpUrl(searchUrl).build();
            	
            	
            	//이 한줄의 코드로 API를 호출해 MAP타입으로 전달 받는다.
            	ResponseEntity<String> resultMap = restTemplate.getForEntity(uri.toString(), String.class);
            	// xml convert 부분
            	XmlMapper xml = new XmlMapper();
            	Object dataInstance = xml.readValue(resultMap.getBody().getBytes(), Object.class);
            	// json convert 부분
            	JsonMapper jsonMapper = new JsonMapper();
            	String json = jsonMapper.writeValueAsString(dataInstance); // json to String 변환
            	JSONParser parser = new JSONParser();
            	JSONObject json2 = (JSONObject) parser.parse(json);
            	datech = new DateChange();
            	// api에서 가져오는 데이터 json list로
            	List<JSONObject> lijson = (List<JSONObject>) json2.get("db");
            	
            	// DB에 들어가있는 값중 코드가 겹치는 코드 검사
            	List<ShowDTO> showDB = addPerformance.selectShow();
            	
            	for(int i=0; i<lijson.size(); i++) {
            		ShowDTO show = new ShowDTO();
            		JSONObject js = lijson.get(i);
            		
        			show.setPerformance_code((String)js.get("mt20id"));
        			show.setPerformance_name((String)js.get("prfnm"));
        			show.setPerformance_qty(50);
        			show.setMain_category("kid");
        			show.setSub_category((String)js.get("genrenm"));
        			show.setPerformance_price(300);
        			show.setStart_date(datech.transformDate((String)js.get("prfpdfrom")));
        			show.setEnd_date(datech.transformDate((String)js.get("prfpdto")));
        			Map<String, String> detail_map= detail((String)js.get("mt20id"));
        			show.setAddress(detail_map.get("adres"));
        			show.setPlace((String) js.get("fcltynm"));
        			show.setPoster((String) js.get("poster"));
        			show.setLat(Double.parseDouble(detail_map.get("lat")));
        			show.setLon(Double.parseDouble(detail_map.get("lon")));
        			try {
//        				System.out.println("kid:"+show.toString());
//        				addPerformance.addShow(show);
        				showli.add(show);
        			}catch(Exception e) {
        				continue;
        			}
            		
            	}
            }

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
        
        return showli;

    }
}