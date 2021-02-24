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

import lombok.extern.log4j.Log4j2;


@Component
@Log4j2
public class ShoppingCategoriesInterceptor implements HandlerInterceptor {
	
	@Autowired
	MarketCategoryService marketCategoryService;
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		List<MarketCategory> allCategories = marketCategoryService.getAllCategories();
		modelAndView.addObject("allCategories", allCategories);
		
		for (int i=100; i<=600; i+=100) {
			if (i == 100) {
				List<MarketMidCategory> fashionCategories = marketCategoryService.getMidCategories(i);
				modelAndView.addObject("fashionCategories", fashionCategories);
			}
			if (i == 200) {
				List<MarketMidCategory> computerCategories = marketCategoryService.getMidCategories(i);
				modelAndView.addObject("computerCategories", computerCategories);
			}
			if (i == 300) {
				List<MarketMidCategory> livingCategories = marketCategoryService.getMidCategories(i);
				modelAndView.addObject("livingCategories", livingCategories);
			}
			if (i == 400) {
				List<MarketMidCategory> foodCategories = marketCategoryService.getMidCategories(i);
				modelAndView.addObject("foodCategories", foodCategories);
			}
			if (i == 500) {
				List<MarketMidCategory> carCategories = marketCategoryService.getMidCategories(i);
				modelAndView.addObject("carCategories", carCategories);
			}
			if (i == 600) {
				List<MarketMidCategory> acornCategories = marketCategoryService.getMidCategories(i);
				modelAndView.addObject("acornCategories", acornCategories);
			}
		}
	}
}
