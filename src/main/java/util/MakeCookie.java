package util;


import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;

public class MakeCookie {
	
	public static void makeCookie(HttpServletResponse response, String name, String id, int maxAge, String path) {
		Cookie cookie = new Cookie(name, id);
		cookie.setMaxAge(maxAge);
		cookie.setPath(path);
		response.addCookie(cookie);
	}
	
}
