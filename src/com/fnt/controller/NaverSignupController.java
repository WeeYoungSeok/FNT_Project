package com.fnt.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@WebServlet("/naversignup.do")
public class NaverSignupController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public NaverSignupController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String clientId = "T0e_dO0FJagJxo8igTCZ";//애플리케이션 클라이언트 아이디값";
		String clientSecret = "vayV2rXfog";//애플리케이션 클라이언트 시크릿값";
		String code = request.getParameter("code");
		String state = request.getParameter("state");
		String redirectURI = URLEncoder.encode("http://qclass.iptime.org:8787/FNT_Project/fntsignupformnaver.jsp", "UTF-8");
		//String redirectURI = URLEncoder.encode("http://127.0.0.1:8787/FNT_Project/fntsignupformnaver.jsp", "UTF-8");
		String apiURL;
		apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
		apiURL += "client_id=" + clientId;
		apiURL += "&client_secret=" + clientSecret;
		apiURL += "&redirect_uri=" + redirectURI;
		apiURL += "&code=" + code;
		apiURL += "&state=" + state;
		System.out.println("apiURL="+apiURL);
		StringBuffer res = new StringBuffer();
		try {
		  URL url = new URL(apiURL);
		  HttpURLConnection con = (HttpURLConnection)url.openConnection();
		  con.setRequestMethod("GET");
		  int responseCode = con.getResponseCode();
		  BufferedReader br;
		  if(responseCode==200) { // 정상 호출
		    br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		  } else {  // 에러 발생
		    br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		  }
		  String inputLine;
		  while ((inputLine = br.readLine()) != null) {
		    res.append(inputLine);
		  }
		  br.close();
		  if(responseCode==200) {
		    System.out.println("\n" + res.toString());
		  }
		} catch (Exception e) {
		  System.out.println(e);
		}
		
		JsonObject json = JsonParser.parseString(res.toString()).getAsJsonObject();
		
		String token = json.get("access_token").toString(); // 네이버 로그인 접근 토큰;
        String header = "Bearer " + token; // Bearer 다음에 공백 추가
        
        request.getSession().setAttribute("access_token", token);

        String profileApiUrl = "https://openapi.naver.com/v1/nid/me";
        
        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("Authorization", header);
        String responseBody = get(profileApiUrl,requestHeaders);

        request.setAttribute("profile", responseBody);
        JsonObject jsonObject = JsonParser.parseString(responseBody).getAsJsonObject().getAsJsonObject("response");
        request.setAttribute("profileJson", jsonObject);
        dispatch("fntsignupformnaver.jsp", request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

    private static String get(String apiUrl, Map<String, String> requestHeaders){
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }

            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 에러 발생
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }

    private static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }

    private static String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);

        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();

            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }

            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }
	
	public void dispatch(String url, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
}
