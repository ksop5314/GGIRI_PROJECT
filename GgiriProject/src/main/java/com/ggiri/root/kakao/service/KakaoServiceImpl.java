package com.ggiri.root.kakao.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;


@Service
public class KakaoServiceImpl implements KakaoService{
	
	@Override
	public String getReturnAccessToken(String code) {
		String access_token = "";
		String refresh_token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";
		
		try {
			
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=0bc794d215c15ba457b2eb709fecd070");
			sb.append("&redirect_uri=http://localhost:8080/root/ggiriMember/kakao_callback");
			sb.append("&code=" + code);
			bw.write(sb.toString());
			bw.flush();
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String br_line = "";
			String result = "";
			
			while((br_line = br.readLine()) != null) {
				result += br_line;
			}
			
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			access_token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_token = element.getAsJsonObject().get("refresh_token").getAsString();
			
			br.close();
			bw.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return access_token;
	}
	
	@Override
	public Map<String, Object> getUserInfo(String access_token) {
		Map<String, Object> resultMap = new HashMap<>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization", "Bearer"+access_token);
			
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String br_line = "";
			String result = "";
			
			while((br_line = br.readLine()) != null) {
				result += br_line;
			}
			
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
			
			String id = properties.getAsJsonObject().get("id").getAsString();
			String profile_nickname = properties.getAsJsonObject().get("profile_nickname").getAsString();
			String account_email = properties.getAsJsonObject().get("account_email").getAsString();
			
			resultMap.put("profile_nickname", profile_nickname);
			resultMap.put("account_email", account_email);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resultMap;
	}
	
	@Override
	public void getLogout(String access_token) {
		String reqURL = "https://kapi.kakao.com/v1/user/logout";
		try {

			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "Bearer" + access_token);
			
			int responseCode = conn.getResponseCode();
			
			if(responseCode == 400) {
				throw new RuntimeException("카카오 로그아웃 도중 오류 발생");
			}
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			String br_line = "";
			String result = "";
			
			while((br_line = br.readLine()) != null) {
				result += br_line;
			}
			
			System.out.println(result);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
