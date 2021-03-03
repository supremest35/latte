package com.example.latte.web.controller.rest;



import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.latte.form.DiaryEventForm;
import com.example.latte.service.MiniHomeService;
import com.example.latte.vo.Diary;
import com.example.latte.vo.Folder;
import com.example.latte.vo.MiniHomeBoard;


@CrossOrigin("*")
@RestController("apiNewsController")
@RequestMapping("/board/api")
public class NewsController {

	@Autowired
	MiniHomeService miniHomeService;
	
	@GetMapping("/news/{searchWord}")
	   public StringBuffer search(@PathVariable("searchWord") String searchWord) { 
		  String clientId = "R71zMRO23o2BHtP2EsmZ";
	      String clientSecret = "Ueu5lTAPcI";
	      try {
	      String text = URLEncoder.encode(searchWord, "UTF-8");
	      String apiURL = "https://openapi.naver.com/v1/search/news.json?query="+ text +"&start=1&display=100";
	      URL url = new URL(apiURL);
	      HttpURLConnection con = (HttpURLConnection)url.openConnection();
	      con.setRequestMethod("GET");
	      con.setRequestProperty("X-Naver-Client-Id", clientId);
	      con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	      // response 수신
	      int responseCode = con.getResponseCode();
	      System.out.println("responseCode="+ responseCode);
	      if(responseCode==200) {
	      BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
	      String inputLine;
	      StringBuffer response = new StringBuffer();
	      while ((inputLine = in.readLine()) != null) {
	      response.append(inputLine);
	      }
	      in.close();
	      System.out.println(response.toString());
	      return response;
	      } else {
	      System.out.println("API 호출 에러 발생 : 에러코드=" + responseCode);
	      }
	      } catch (Exception e) {
	      System.out.println(e);
	      }
	      return null;
	   }
	
	

}
