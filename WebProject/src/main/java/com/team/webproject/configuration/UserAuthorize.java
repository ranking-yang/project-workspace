//package com.team.webproject.configuration;
//
//import org.springframework.stereotype.Component;
//
//@Component("webSecurity")
//public class WebSecurity {
//
//    public boolean checkAuthority(Authentication authentication, String userid) {
//        if(authentication.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_ADMIN"))
//                || userid.equals("me") || userid.equals(authentication.getName()) ) {
//            return true;
//        }else {
//            return false;
//        }
//    }
//}
