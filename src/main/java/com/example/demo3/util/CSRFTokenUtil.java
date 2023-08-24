package com.example.demo3.util;

import javax.servlet.http.HttpSession;
import java.util.UUID;

public class CSRFTokenUtil {
    private static CSRFTokenUtil instances;
    public static CSRFTokenUtil getCSRFTokens() {
        return instances;
    }
    public static final String CSRF_TOKEN_SESSION_ATTR_NAME = "csrfToken";
    public static  String getCsrfTokenSessionAttrName(){
        return CSRF_TOKEN_SESSION_ATTR_NAME;
    }

    public static String generateCSRFToken(HttpSession session) {
        String token = UUID.randomUUID().toString();
        session.setAttribute(CSRF_TOKEN_SESSION_ATTR_NAME, token);
        return token;
    }
}