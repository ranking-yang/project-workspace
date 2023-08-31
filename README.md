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
+ [🎨 스토리보드](https://drive.google.com/file/d/1dpwZ6RSm_LbYeQefhA2cu5Wa-EyjZf3r/view?usp=sharing)
+ [🎭 발표자료](https://drive.google.com/file/d/157JN0OymTJTJ5l0VPaxA94YwXgVSyFiR/view?usp=sharing)
+ [🚀 티켓킹_바로가기](http://3.39.232.202/main)
+ 자세한 사항은 [Wiki](https://github.com/AmuGeoNaHae/project-workspace.wiki.git)를 참고해주세요
<br>


## 👩‍💻 개발자
+ 양서열, 권영준, 김수진, 박정준, 이종현, 이희정

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

![회원가입, 로그인](https://github.com/AmuGeoNaHae/project-workspace/assets/132882336/547046b8-a19e-4ff6-9b81-588f49a68fc5)

```
- 일반 회원가입 : Naver SMS API를 사용하여 인증 후, 회원가입 진행
- 간편 로그인 : OAuth2.0을 사용하여 간편 로그인 진행
```

### ✅ 메인

![메인](https://github.com/AmuGeoNaHae/project-workspace/assets/132882336/fd5184f3-e17b-482b-bf0c-4743eaac3d18)

```
- 랭킹 기능을 통해 사용자가 사이트에 방문했을 때 관심도가 높은 작품을 보여줌
```

### ✅ 작품 리스트 및 찜기능

![작품 리스트, 찜기능](https://github.com/AmuGeoNaHae/project-workspace/assets/132882336/4785dbe3-e53f-4a31-852d-edf599befb80)
![지역별카테고리](https://github.com/AmuGeoNaHae/project-workspace/assets/132882336/940dfc59-0201-4ba5-97ec-9ec5b19a4651)

```
- 작품 리스트 : 카테고리 및 지역 필터링 기능
- 찜기능 : 로그인한 사용자가 관심 있는 작품을 모아서 확인 할 수 있는 기능 
```

### ✅ 상세페이지

![상세페이지](https://github.com/AmuGeoNaHae/project-workspace/assets/132882336/ff6e0a4c-78f0-4ad8-80cb-42639d551d77)

```
- REST API를 통해 가져온 정보를 토대로 페이지를 구성
```

### ✅ 결제

![결제](https://github.com/AmuGeoNaHae/project-workspace/assets/132882336/0ba8ccbf-8789-42a3-87df-dd646c04de9f)

```
- 결제 API를 이용하여 PG사 결제를 진행 및 DB 저장
```

### ✅ 검색

![검색기능](https://github.com/AmuGeoNaHae/project-workspace/assets/132882336/49132761-75f8-4ee8-8f4a-b71bdf8fa6fe)

```
- 검색어와 관련된 작품을 검색하여 작품들을 보여주는 기능
```

### ✅ 마이페이지

![로그인_회원정보수정](https://github.com/AmuGeoNaHae/project-workspace/assets/132882336/17b49ab1-afc9-4167-b87e-ce4a5e6345e6)
![마이페이지](https://github.com/AmuGeoNaHae/project-workspace/assets/132882336/75ef4375-f34f-4819-9afa-123f9ecc4e31)

```
- 예매내역, 취소/환불 내역, 후기, Q&A, 회원정보수정 기능
```

### ✅ MD 추천

![MD추천_찜목록](https://github.com/AmuGeoNaHae/project-workspace/assets/132882336/736436aa-42ac-43bb-b970-6ee714f7f32e)

```
- 기능 설명
```

### ✅ 관리자

![관리자_공지사항_FaQ](https://github.com/AmuGeoNaHae/project-workspace/assets/132882336/bed4cedc-6ff7-43e5-b48e-cd64f46538d7)
![관리자qna_문의_답변하기](https://github.com/AmuGeoNaHae/project-workspace/assets/132882336/e4c9cebe-784e-40cb-911c-b2842ced0ff4)
![관리자_api조회_추가](https://github.com/AmuGeoNaHae/project-workspace/assets/132882336/006cd1fc-15bb-4086-8048-957399a64282)
![관리자_환불](https://github.com/AmuGeoNaHae/project-workspace/assets/132882336/71a4bcc7-eb0e-4cc1-82f8-6ec52552d8df)

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

