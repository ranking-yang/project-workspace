//package com.team.webproject.configuration;
//
//import java.security.MessageDigest;
//
//import org.apache.commons.logging.Log;
//import org.apache.commons.logging.LogFactory;
//import org.springframework.security.crypto.password.PasswordEncoder;
//
//public class SHA512PasswordEncoder implements PasswordEncoder {
//    private final Log logger = LogFactory.getLog(getClass());
//
//    @Override
//    public String encode(CharSequence rawPassword) {
//        if (rawPassword == null) {
//            throw new IllegalArgumentException("rawPassword cannot be null");
//        }
//        return this.getSHA512Pw(rawPassword);
//    }
//
//    @Override
//    public boolean matches(CharSequence rawPassword, String encodedPassword) {
//        if (rawPassword == null) {
//            throw new IllegalArgumentException("rawPassword cannot be null");
//        }
//        if (encodedPassword == null || encodedPassword.length() == 0) {
//            this.logger.warn("Empty encoded password");
//            return false;
//        }
//
//        String encodedRawPw = this.getSHA512Pw(rawPassword);
//        if (encodedPassword.length() != encodedRawPw.length()) {
//            return false;
//        }
//        for (int i = 0; i < encodedPassword.length(); i++) {
//            if (encodedPassword.charAt(i) != encodedRawPw.charAt(i))
//                return false;
//        }
//        return true;
//    }
//
//    private String getSHA512Pw(CharSequence rawPassword) {
//        MessageDigest md = null;
//        try {
//            md = MessageDigest.getInstance("SHA-512");
//            md.update(rawPassword.toString().getBytes());
//        } catch (Exception e) {
//            this.logger.warn(e.getMessage());
//        }
//
//        byte[] msgb = md.digest();
//
//        StringBuilder sb = new StringBuilder();
//        for (int i = 0; i < msgb.length; i++) {
//            String tmp = Integer.toHexString(msgb[i] & 0xFF);
//            while (tmp.length() < 2)
//                tmp = "0" + tmp;
//            sb.append(tmp.substring(tmp.length() - 2));
//        }
//        return sb.toString();
//    }
//}