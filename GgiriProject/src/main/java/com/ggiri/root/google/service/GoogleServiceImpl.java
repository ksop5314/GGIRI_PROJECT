package com.ggiri.root.google.service;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;


@Service
public class GoogleServiceImpl implements GoogleService {

	@Override
	public String getReturnAccessToken(String code) {
		
		String googleBaseURL = "https://accounts.google.com/o/oauth2/v2/auth";
		String googleClientId = "15714476982-d6tnk6tv8f7hptqjh6qrhqsm42aglq72.apps.googleusercontent.com";
		String googleClientSecret = "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";
		String googleRedirectURL = "http://localhost:8080/root/ggiriMember/google_callback";
		String googleTokenURL = "https://oauth2.googleapis.com/token";
		
        
		
        return "구글 로그인 요청 처리 실패";
	}

	@Override
	public Map<String, Object> getUserInfo(String access_token) {
		Map<String, Object> resultMap = new HashMap<>();
		String reqURL = "https://www.googleapis.com/userinfo/v2/me";
		
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization", "Bearer " + access_token);
			conn.setRequestProperty("charset", "UTF-8");
			System.out.println(conn);
			
			int responseCode = conn.getResponseCode();
			String errorCode = conn.getResponseMessage();
			System.out.println("errorCode : " + errorCode);
			System.out.println("responseCode : " + responseCode);

			String response;
			InputStream stream = conn.getErrorStream();
			if (stream != null) {
				try (Scanner scanner = new Scanner(stream)) {
					scanner.useDelimiter("\\Z");
					response = scanner.next();
				}
				System.out.println("error response : " + response);
			}
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String br_line = "";
			String result = "";
			
			while((br_line = br.readLine()) != null) {
				result += br_line;
			}
			
			System.out.println("response body : " + result);
			System.out.println("result type : " + result.getClass().getName());
			
//			ObjectMapper objectMapper = new ObjectMapper();
//			Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {});
//			Map<String, Object> properties = (Map<String, Object>) jsonMap.get("properties");
//			Map<String, Object> kakao_account = (Map<String, Object>) jsonMap.get("kakao_account");
//			String nickname = properties.get("nickname").toString();
//			String email = properties.get("email").toString();
			
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			JsonObject profile = element.getAsJsonObject().get(access_token).getAsJsonObject();
			
			String email = profile.getAsJsonObject().get("email").getAsString();
			String name = profile.getAsJsonObject().get("name").getAsString();
			
			resultMap.put("email", email);
			resultMap.put("name", name);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resultMap;
	}
	
	@Override
	public void getLogout(String access_token) {
		// TODO Auto-generated method stub
		
	}
}
