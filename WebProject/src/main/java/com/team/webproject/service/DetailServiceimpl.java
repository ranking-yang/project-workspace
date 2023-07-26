package com.team.webproject.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Service;

@Service
public class DetailServiceimpl implements DetailService {

	@Override
	public Map<String, List<String>> getTimeTable(Object schedule) {
		// JSON으로 정리할 데이터를 담을 Map
		Map<String, List<String>> scheduleMap = new HashMap<>();

		String[] schedules = schedule.toString().split("\\),");

		for (String s : schedules) {
			String[] dayTime = s.split("\\(|\\)");
			if (dayTime.length < 2) {
				continue;
			} else {
				String[] days = expandDayRange(dayTime[0].trim());
				String time = dayTime[1];

				for (String day : days) {

					if (day != null) {
						scheduleMap.computeIfAbsent(day, k -> new ArrayList<>()).add(time);	
					}                	
				}
			}            
		}

		return scheduleMap;
	}

	@Override
	public String[] expandDayRange(String dayRange) {
		String[] weekdays = {"1", "2", "3", "4", "5", "6", "0"};

		// 축약형과 전체 요일명을 매핑하는 맵 생성
		Map<String, String> dayMap = new HashMap<>();
		dayMap.put("월", "1");
		dayMap.put("화", "2");
		dayMap.put("수", "3");
		dayMap.put("목", "4");
		dayMap.put("금", "5");
		dayMap.put("토", "6");
		dayMap.put("일", "0");

		// 요일 범위를 나타내는 정규식
		Pattern pattern = Pattern.compile("(월|화|수|목|금|토|일)요일 ~ (월|화|수|목|금|토|일)요일");
		Matcher matcher = pattern.matcher(dayRange);

		if (matcher.find()) {
			String startDayAbbr = matcher.group(1); // 축약형 요일
			String endDayAbbr = matcher.group(2); // 축약형 요일

			// 축약형을 전체 요일명으로 변환
			String startDay = dayMap.get(startDayAbbr);
			String endDay = dayMap.get(endDayAbbr);

			int startIndex = Arrays.asList(weekdays).indexOf(startDay);
			int endIndex = Arrays.asList(weekdays).indexOf(endDay);
			int rangeLength = (endIndex - startIndex) + 1;

			// 기존 days 배열을 확장하기 위한 새로운 배열 생성
			String[] expandedDays = new String[rangeLength];
			for (int i = 0; i < rangeLength; i++) {
				expandedDays[i] = weekdays[startIndex + i];
			}

			return expandedDays;
		} else {
			// "~" 기호가 없을 경우 단일 요일로 간주
			String dayAbbr = dayRange.substring(0, 1);
			String day = dayMap.get(dayAbbr);
			return new String[]{day};
		}
	}
}
