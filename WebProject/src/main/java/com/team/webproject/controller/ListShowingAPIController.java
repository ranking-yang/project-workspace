package com.team.webproject.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.json.JsonMapper;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;
import com.team.webproject.dto.PerformanceDTO;
import com.team.webproject.mapper.AddPerformance;
import com.team.webproject.service.DateChange;

import lombok.RequiredArgsConstructor;

@PropertySource("classpath:/protected/data_api.properties")
@Controller
@RequiredArgsConstructor
public class ListShowingAPIController {
	
	@Autowired
	AddPerformance addPerformance;
	
	@Value("${culture.servicekey}")
	private String culture_servicekey;

	private DateChange datech;

	private String address(String id) {
		
		try {
			
			StringBuilder urlBuilder = new StringBuilder("http://www.culture.go.kr/openapi/rest/publicperformancedisplays/d/"); /*URL*/
		    urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=" + culture_servicekey); /*Service Key*/
		    urlBuilder.append("&" + URLEncoder.encode("RequestTime","UTF-8") + "=" + URLEncoder.encode("20100810:23003422", "UTF-8")); /*Optional 필드*/
		    urlBuilder.append("&" + URLEncoder.encode("seq","UTF-8") + "=" + URLEncoder.encode(id, "UTF-8")); /**/
		        
		    URL url = new URL(urlBuilder.toString());
		    
		    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		    conn.setRequestMethod("GET");
		    conn.setRequestProperty("Content-type", "application/json");
		    BufferedReader rd;
		        
		    if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
		    	rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		    } else {
		        rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		    }
		    
		    StringBuilder sb = new StringBuilder();
		    String line;
		    while ((line = rd.readLine()) != null) {
		         sb.append(line);
		    }
		    rd.close();
		    conn.disconnect();
		    XmlMapper xml = new XmlMapper();
	        Object dataInstance = xml.readValue(sb.toString().getBytes(), Object.class);
	            
	        // json convert 부분
	        JsonMapper jsonMapper = new JsonMapper();
	        String json = jsonMapper.writeValueAsString(dataInstance); // json to String 변환
	            
	        JSONParser parser = new JSONParser();
	        JSONObject json2 = (JSONObject) parser.parse(json);
	        JSONObject json3 = (JSONObject)json2.get("msgBody");
	        JSONObject json4 = (JSONObject)json3.get("perforInfo");
	        String adres =(String) json4.get("placeAddr");
		    return adres;
		        
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@GetMapping("/admin/api/showing")
	@ResponseBody
	public List<PerformanceDTO> callAPI() {
		List<PerformanceDTO> showli = new ArrayList<>();
		LocalDate date = LocalDate.now();
        LocalDate plusdate = date.plusMonths(1);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
        String now = date.format(formatter);
        String plusnow = plusdate.format(formatter);
		
        try {
        	
			StringBuilder urlBuilder = new StringBuilder("http://www.culture.go.kr/openapi/rest/publicperformancedisplays/realm"); /*URL*/
		    urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=" + culture_servicekey); /*Service Key*/
		    urlBuilder.append("&" + URLEncoder.encode("sortStdr","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*1:등록일, 2:공연명, 3:지역*/
		    urlBuilder.append("&" + URLEncoder.encode("ComMsgHeader","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /**/
		    urlBuilder.append("&" + URLEncoder.encode("RequestTime","UTF-8") + "=" + URLEncoder.encode("20100810:23003422", "UTF-8")); /*Optional 필드*/
		    urlBuilder.append("&" + URLEncoder.encode("CallBackURI","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*Optional 필드*/
		    urlBuilder.append("&" + URLEncoder.encode("MsgBody","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /**/
		    urlBuilder.append("&" + URLEncoder.encode("realmCode","UTF-8") + "=" + URLEncoder.encode("D000", "UTF-8")); /*코드*/
		    urlBuilder.append("&" + URLEncoder.encode("cPage","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /**/
		    urlBuilder.append("&" + URLEncoder.encode("rows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /**/
		    urlBuilder.append("&" + URLEncoder.encode("from","UTF-8") + "=" + URLEncoder.encode(now, "UTF-8")); /**/
		    urlBuilder.append("&" + URLEncoder.encode("to","UTF-8") + "=" + URLEncoder.encode(plusnow, "UTF-8")); /**/
		        
		    URL url = new URL(urlBuilder.toString());
		    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		    conn.setRequestMethod("GET");
		    conn.setRequestProperty("Content-type", "application/json");

		    BufferedReader rd;
		    if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
		    	rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		    } else {
		        rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		    }
		        
		    StringBuilder sb = new StringBuilder();
		    String line;
		    
		    while ((line = rd.readLine()) != null) {
		    	sb.append(line);
		    }
		    
		    rd.close();
		    conn.disconnect();
		    
		    XmlMapper xml = new XmlMapper();
	        Object dataInstance = xml.readValue(sb.toString().getBytes(), Object.class);
	            
	        // json convert 부분
	        JsonMapper jsonMapper = new JsonMapper();
	        String json = jsonMapper.writeValueAsString(dataInstance); // json to String 변환
	            
	        JSONParser parser = new JSONParser();
	        JSONObject json2 = (JSONObject) parser.parse(json);
	        JSONObject json3 = (JSONObject)json2.get("msgBody");
	        JSONArray json4 = (JSONArray)json3.get("perforList");
	            
		    datech = new DateChange();
		    for(int i =0; i < json4.size(); i++) {
		    	PerformanceDTO show = new PerformanceDTO();

		    	JSONObject js = (JSONObject) json4.get(i);
		        	
		    	show.setPerformance_code((String)js.get("seq"));
		        show.setPerformance_name((String)js.get("title"));
		        show.setPerformance_qty(50);
		        show.setMain_category("art");
		        show.setSub_category((String)js.get("realmName"));
		        show.setPerformance_price(3000);
		        show.setStart_date(datech.transformDate2((String)js.get("startDate")));
		        show.setEnd_date(datech.transformDate2((String)js.get("endDate")));
		        
		        String adres = address((String)js.get("seq"));
		        show.setAddress(adres);
		        show.setPlace((String) js.get("place"));
		        show.setPoster((String) js.get("thumbnail"));
		        show.setLatitude(Double.parseDouble((String)js.get("gpsY")));        
		        show.setLongitude(Double.parseDouble((String)js.get("gpsX")));
		        
				showli.add(show);
				

		    }
		        
        } catch(Exception e) {
        	e.printStackTrace();
		}
        
		return showli;
	}
	
}