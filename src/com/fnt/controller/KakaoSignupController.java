package com.fnt.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@WebServlet("/kakaosignup.do")
public class KakaoSignupController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public KakaoSignupController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*ServletInputStream is = request.getInputStream();
		StringBuilder json = new StringBuilder();
		
		InputStreamReader isr = new InputStreamReader(is);
		int size = 0;
		char[] b = new char[1024];
		while ( (size = isr.read(b)) > 0) {
			json.append(b, 0, size);
		}
		isr.close();
		
		System.out.println(json);*/
		
		// String apiUrl = "http://kauth.kakao.com/oauth/authorize?client_id=b11351d1a82132cce9f677667f92302a&redirect_uri=http://127.0.0.1:8787/FNT_Project/kakaosignup.do&response_type=code";
		String access_token = request.getParameter("access_token");
		System.out.println(access_token);
		String apiUrl = "https://kapi.kakao.com/v2/user/me";
		
		StringBuffer res = new StringBuffer();
		
		try {
		  URL url = new URL(apiUrl);
		  HttpURLConnection con = (HttpURLConnection)url.openConnection();
		  con.setRequestMethod("GET");
		  con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
		  con.setRequestProperty("Authorization", "Bearer " + access_token);
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
		    JsonObject profileJson = JsonParser.parseString(res.toString()).getAsJsonObject();
		    request.setAttribute("profileJson", profileJson.get("kakao_account"));
		  }
		} catch (Exception e) {
		}
		
        //dispatch("fntsignupformkakao.jsp", request, response);
		dispatch("LoginCrudController?command=logka", request, response);
	}

	private String get(String apiUrl, Map<String, String> requestHeaders) {
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

	private String readBody(InputStream body) {
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

	private static HttpURLConnection connect(String apiUrl) {
		try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public void dispatch(String url, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

}
