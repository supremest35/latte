package com.example.latte.web.controller.rest;

 import java.io.BufferedReader; import java.io.IOException; import
 java.io.InputStreamReader; import java.net.HttpURLConnection; import
 java.net.URL; import java.net.URLEncoder;
 
 import org.springframework.web.bind.annotation.CrossOrigin; import
 org.springframework.web.bind.annotation.GetMapping; import
 org.springframework.web.bind.annotation.PathVariable; import
 org.springframework.web.bind.annotation.RequestMapping; import
 org.springframework.web.bind.annotation.RestController;
 
  @CrossOrigin("*")
  @RestController("apiWeatherController") 
  @RequestMapping("/board/api") public class WeatherController { 
	  
 @GetMapping("/weather/{searchWord}") 
 public StringBuffer search(@PathVariable("searchWord") String searchWord) throws IOException {
	 System.out.println("검색창"+searchWord);
	 
	 String text = URLEncoder.encode(searchWord, "UTF-8"); 
	 String apiURL ="api.openweathermap.org/data/2.5/weather?q="+text+"&appid=e36da81b031737c5fa6f29d386decd41&unit=metric"; 
	  URL url = new
	  URL(apiURL); HttpURLConnection con = (HttpURLConnection)url.openConnection();
	  
	  // response 수신 
	  int responseCode = con.getResponseCode();
	  System.out.println("responseCode="+ responseCode); 
	  
	  if(responseCode==200) {
	  BufferedReader in = new BufferedReader(new
	  InputStreamReader(con.getInputStream())); 
	  String inputLine; 
	  StringBuffer
	  response = new StringBuffer(); while ((inputLine = in.readLine()) != null) {
	  response.append(inputLine); } in.close();
	 System.out.println(response.toString()); 
	 
	 return response; 
	 } else {
	 System.out.println("API 호출 에러 발생 : 에러코드=" + responseCode); 
	 } 
	  return null; 
	 } 
	 }
 