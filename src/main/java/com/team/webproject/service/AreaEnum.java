package com.team.webproject.service;

public enum AreaEnum {
	A01("서울"),
	A02("경기"),
	A03("강원"),
	A04("인천"),
	A05("충청"),
	A06("세종"),
	A07("대전"),
	A08("전라"),
	A09("광주"),
	A10("경상"),
	A11("부산"),
	A12("대구"),
	A13("울산"),
	A14("제주");
	
    private final String areaName;

    AreaEnum(String areaName) {
        this.areaName = areaName;
    }

    public String getAreaName() {
        return areaName;
    }

    public static String getAreaNameByCode(String areaCode) {
        for (AreaEnum area : AreaEnum.values()) {
            if (area.name().equalsIgnoreCase(areaCode)) {
                return area.getAreaName();
            }
        }
        return null; // 해당 지역 코드에 대한 이름이 없는 경우
    }
}
