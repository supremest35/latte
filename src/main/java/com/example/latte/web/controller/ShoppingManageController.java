package com.example.latte.web.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.latte.dao.ShoppingManageDao;

@Controller
@RequestMapping("/ShoppingManage")
public class ShoppingManageController {
	
	@Autowired
	ShoppingManageDao shoppingManageDao;

	@ResponseBody
	@RequestMapping(value="retireveUpperCategory.do", method = {RequestMethod.GET, RequestMethod.POST})
	public List<Object> retireveUpperCategory(@RequestBody Map<String, Object> param){
		List<Object> resMap = shoppingManageDao.retireveUpperCategory(param);
		return resMap;
	}
	
	@ResponseBody
	@RequestMapping("retireveMidCategory.do")
	public List<Object> retireveMidCategory(@RequestBody Map<String, Object> param){
		List<Object> resMap = shoppingManageDao.retireveMidCategory(param);
		return resMap;
	}
	
	@ResponseBody
	@RequestMapping("retireveLowCategory.do")
	public List<Object> retireveLowCategory(@RequestBody Map<String, Object> param){
		List<Object> resMap = shoppingManageDao.retireveLowCategory(param);
		return resMap;
	}
}
