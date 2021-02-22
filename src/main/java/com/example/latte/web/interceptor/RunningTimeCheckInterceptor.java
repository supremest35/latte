package com.example.latte.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j2;

@Component
@Log4j2
public class RunningTimeCheckInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		log.info("["+request.getRequestURI()+"] 요청 처리 시작");
		
		StopWatch stopWatch = new StopWatch();
		stopWatch.start();
		request.setAttribute("stopWatch", stopWatch);
		
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		StopWatch stopWatch = (StopWatch) request.getAttribute("stopWatch");
		stopWatch.stop();
		
		log.info("["+request.getRequestURI()+"] 요청 처리 종료");
		log.info("["+request.getRequestURI()+"] 실행시간 : " + stopWatch.getTotalTimeMillis() + "밀리초" + System.lineSeparator());
	}


}
