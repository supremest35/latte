package com.example.latte.web.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.latte.dao.ShoppingManageDao;
import com.example.latte.vo.MarketCategory;
import com.example.latte.vo.MarketLowCategory;
import com.example.latte.vo.MarketMidCategory;
import com.example.latte.vo.ProductBrand;
import com.example.latte.vo.ProductColor;

@Controller
@RequestMapping("/ShoppingManage")
public class ShoppingManageController {
	
	@Autowired
	ShoppingManageDao shoppingManageDao;

	@ResponseBody
	@RequestMapping(value="retrieveUpperCategory.do", method = {RequestMethod.GET, RequestMethod.POST})
	public List<Object> retrieveUpperCategory(@RequestBody Map<String, Object> param){
		List<Object> resMap = shoppingManageDao.retrieveUpperCategory(param);
		return resMap;
	}
	
	@ResponseBody
	@RequestMapping("retrieveMidCategory.do")
	public List<Object> retrieveMidCategory(@RequestBody Map<String, Object> param){
		List<Object> resMap = shoppingManageDao.retrieveMidCategory(param);
		return resMap;
	}
	
	@ResponseBody
	@RequestMapping("retrieveLowCategory.do")
	public List<Object> retrieveLowCategory(@RequestBody Map<String, Object> param){
		List<Object> resMap = shoppingManageDao.retrieveLowCategory(param);
		return resMap;
	}
	
	@ResponseBody
	@RequestMapping("retrieveProductByColor.do")
	public List<Object> retrieveProductByColor(@RequestBody Map<String, Object> param){
		List<Object> resMap = shoppingManageDao.retrieveProductByColor(param);
		return resMap;
	}
}
