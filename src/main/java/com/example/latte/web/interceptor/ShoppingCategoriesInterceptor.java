package com.example.latte.web.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.example.latte.service.MarketCategoryService;
import com.example.latte.vo.MarketCategory;
import com.example.latte.vo.MarketMidCategory;

@Component
public class ShoppingCategoriesInterceptor implements HandlerInterceptor {
	
	@Autowired
	MarketCategoryService marketCategoryService;
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		List<MarketCategory> allCategories = marketCategoryService.getAllCategories();
		modelAndView.addObject("allCategories", allCategories);
		
		/*
		List<MarketMidCategory> midCategories = marketCategoryService.
		*/
	}
}
