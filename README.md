<img src="https://img.shields.io/badge/JAVA-007396?style=for-the-badge&logo=java&logoColor=white"> <img src="https://img.shields.io/badge/eclipse-2C2255?style=for-the-badge&logo=eclipseide&logoColor=white"> <img src="https://img.shields.io/badge/OracleSQL-F80000?style=for-the-badge&logo=Oracle&logoColor=white">
<img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=GitHub&logoColor=white">
<img src="https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=Git&logoColor=white">
<img src="https://img.shields.io/badge/springboot-6DB33F?style=for-the-badge&logo=springboot&logoColor=white"/>
<img src="https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jQuery&logoColor=white"/>
<img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"/>
<img src="https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white"/>
<img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white"/>
<img src="https://img.shields.io/badge/Amazon AWS-232F3E?style=for-the-badge&logo=Amazon%20AWS&logoColor=white"/>
<br>
# 🎫 티켓킹
### 🚀  배포 주소
 * [티켓킹 바로가기](http://3.39.232.202/main)
<br>


## 👩‍💻 개발자
+ 양서열, 이종현, 권영준, 김수진, 박정준, 이희정

<br>

## 🛠 개발 도구
### ◻ Tools
+ Eclipse Web (ver-2023-06)
+ VS Code (ver-1.80.2)

### ◻ Framework
+ Spring boot (ver-2.7.13)
+ Spring WebClient (ver-2.7.13)
+ Mybatis (ver-3.5.13)

### ◻ Library
+ HikariCP (ver-4.0.3)
+ Lombok (ver-1.18.28)
+ jackson-databind (ver-2.13.5)
+ OAuth2.0
+ Spring security (ver-5.7.9)
+ iamport-rest-client (ver-0.2.23)
+ Chart.js

### ◻ Front-End
+ HTML
+ CSS
+ JavaScript
+ jQuery (ver-3.7.0)

### ◻ Back-End
+ Java (ver-jdk11)

### ◻ DBMS
+ Oracle SQL (ver-ojdbc8)

### ◻ SQL GUI Tool
+ SQL Developer

### ◻ Web service hosting and infrastructure
+ AWS

### ◻ 협업도구
+ Git

<br>
<hr>

### ✔ 목차
 ##

  [1. 기술 개요](#1-기술-개요) <br>
  [2. 기능 소개](#2-기능-소개) <br>
  [3. API 정보](#3-api-정보) <br>

<hr>
<br>

# 1. 기술 개요

 ### 📌 프로그램 설명
 공연, 전시 관련 API를 이용한 통합 티켓 예매 웹페이지

 ### 📌 선정 이유
 팀 프로젝트에 있어 ‘흥미로움’을 바탕으로 프로젝트에 접목될 기반 기술을 고민하였다. <br>
 우리가 수집하기 힘든 양의 데이터를 활용해보면 좋을 것 같다는 결론에 도달하였고. <br>
 이를 위해 REST API 필요성이 부각되어, 적합한 주제인 '티켓 예매 사이트' 개발을 진행하였다.

 ### 📌 시퀀스 다이어그램
![image](https://github.com/AmuGeoNaHae/project-workspace/assets/132882336/d8ea3640-4d9d-4d54-8e7d-ada845a03877)

  ##

# 2. 기능 소개

### ✅ 로그인 / 회원가입
```
- 일반 회원가입 : Naver SMS API를 사용하여 인증 후, 회원가입 진행
- 간편 로그인 : OAuth2.0을 사용하여 간편 로그인 진행
```

### ✅ 메인
```
- 랭킹 기능을 통해 사용자가 사이트에 방문했을 때 관심도가 높은 작품을 보여줌
```

### ✅ 작품 리스트 및 찜기능
```
- 작품 리스트 : 카테고리 및 지역 필터링 기능
- 찜기능 : 로그인한 사용자가 관심 있는 작품을 모아서 확인 할 수 있는 기능 
```

### ✅ 상세페이지
```
- REST API를 통해 가져온 정보를 토대로 페이지를 구성
```

### ✅ 결제
```
- 결제 API를 이용하여 PG사 결제를 진행 및 DB 저장
```

### ✅ 검색
```
- 검색어와 관련된 작품을 검색하여 작품들을 보여주는 기능
```

### ✅ 마이페이지
```
- 예매내역, 취소/환불 내역, 후기, Q&A, 회원정보수정 기능
```

### ✅ MD 추천

![ezgif com-video-to-gif](https://github.com/AmuGeoNaHae/project-workspace/assets/45970992/3f9a6ed6-d4e9-48c8-b8f1-8cfa426be595")

```
- 기능 설명
```

### ✅ 관리자
```
- API 작품 관리, 공지사항 관리, Q&A 관리, 1:1 문의 관리, 환불 관리, MD 추천 관리, 통계 관리
```
 

 ##

# 3. API 정보

   ### ☑ KOPIS API
   
        KOPIS API를 이용해 공연, 음악회 정보를 REST API 방식을 통해 데이터를 가져온다.
       공연의 상세 정보로는 공연이름, 날짜, 가격, 이용등급, 팸플릿 이미지 등을 가져온다.
       가져온 정보는 JSON 형태로 가져와 DTO를 통해 SQL에 저장한다.
         
   ### ☑ 공공데이터 전시정보 API
   
       공공데이터에 전시정보 API를 통해서는 미술 등 전시정보를 REST API 방식을 통해 데이터를 가져온다.
      KOPIS API와 마찬가지로 JSON 형태로 가져와 DTO를 통해 SQL에 저장한다.
      
   ### ☑ Naver Simple & Easy Notification Service API

       Naver Simple & Easy Notification을 통해 회원가입, 아이디 찾기, 비밀번호 찾기 등의 SMS 메세지를 통해
      핸드폰 인증번호로 인증절차를 진행하였다.
      
   ### ☑ Kakao Maps API

        공연, 전시정보에 공연장의 좌표값인 위경도를 이용해 Kakao Maps 지도에 표시해주는 기능에 활용하였다.
        
   ### ☑ Portone API

        결제 환경은 Portone API를 통해 진행하였으며, 결제 및 환불 시스템을 구축하였다.

