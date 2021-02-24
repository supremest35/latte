package com.example.latte.web.interceptor;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.example.latte.dao.MarketCategoryDao;
import com.example.latte.service.MarketCategoryService;
import com.example.latte.service.ProductService;
import com.example.latte.vo.MarketCategory;


@Component
public class ShoppingCategoriesInterceptor implements HandlerInterceptor {

	@Autowired
	ProductService productService;
	
	@Autowired
	MarketCategoryService marketCategoryService;
	
	@Autowired
	MarketCategoryDao marketCategoryDao;
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		List<List<MarketCategory>> categories = new ArrayList<List<MarketCategory>>();
		
		for(int i = 0; i <= 600; i+=100) {

			List<MarketCategory> marketCategories = marketCategoryDao.getCategoriesByUppCatNo(i);
			categories.add(marketCategories);
			
		}
		
		modelAndView.addObject("categories", categories);
	}
}
