package com.example.latte;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.example.latte.web.interceptor.RunningTimeCheckInterceptor;
import com.example.latte.web.interceptor.ShoppingCategoriesInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
	
	@Autowired
	RunningTimeCheckInterceptor runningTimeCheckInterceptor;
	

	@Autowired
	ShoppingCategoriesInterceptor shoppingCategoriesInterceptor;

	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// 사용자 정의 HandlerInterceptor를 registry에 등록할 수 있다.
		registry.addInterceptor(runningTimeCheckInterceptor).addPathPatterns("/**");
		registry.addInterceptor(shoppingCategoriesInterceptor).addPathPatterns("/shopping/*");
	}
	
	@Override
	public void addArgumentResolvers(List<HandlerMethodArgumentResolver> resolvers) {
		// 사용자 정의 HandlerMethodArgementResolver를 resolvers에 등록할 수 있다.
	}
}
