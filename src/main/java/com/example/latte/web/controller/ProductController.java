package com.example.latte.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.latte.service.ProductService;
import com.example.latte.vo.MarketCategory;
import com.example.latte.vo.Product;
import com.example.latte.form.ProductForm;

@Controller
@RequestMapping("/shopping/product")
public class ProductController {
	
	@Value("${directory.product.photo}")
	String directory;
	
	@Autowired
	ProductService productService;

	@RequestMapping("/list.do")
	public String list(@RequestParam(name="catno", required=false, defaultValue="-1") int categoryNo,
			@RequestParam(name="pageno", required=false, defaultValue="1") int pageNo,
			@RequestParam(name="rows", required=false, defaultValue="6") int rows,
			Model model) {
		
		Map<String, Object> condition = new HashMap<String, Object>();
		if (categoryNo != -1) {
			condition.put("categoryNo", categoryNo);
			MarketCategory category = productService.getCategory(categoryNo);
			model.addAttribute("category", category);
		}
		condition.put("pageNo", pageNo);
		condition.put("rows", rows);
		condition.put("begin", (pageNo - 1)*rows + 1);
		condition.put("end",  pageNo*rows);
		
		Map<String, Object> resultMap = productService.getProducts(condition);
		
		model.addAttribute("page", resultMap.get("pagination"));
		model.addAttribute("products", resultMap.get("products"));
		
		return "/shopping/product/list";
	}
	
	@RequestMapping("/detail.do")
	public String detail(@RequestParam("prodno") int prodNo, Model model) {
		Product product = productService.getProductDetail(prodNo);
		
		MarketCategory category = productService.getCategory(product.getCategoryNo());
		
		model.addAttribute("product", product);
		model.addAttribute("category", category);
		
		return "/shopping/product/detail";
	}

	@RequestMapping("/form.do")
	public String product() {
		return "/shopping/product/form";
	}
	
	@RequestMapping("/register.do")
	public String register(ProductForm productForm) throws IOException {
		
		System.out.println(productForm);
		Product product = new Product();
		BeanUtils.copyProperties(productForm, product);
		
		MultipartFile photofile = productForm.getPhotofile();
		if (!photofile.isEmpty()) {
			String filename = photofile.getOriginalFilename();
			filename = System.currentTimeMillis() + filename;
			File file = new File(directory, filename);
			FileCopyUtils.copy(photofile.getInputStream(), new FileOutputStream(file));
			product.setPhotoFilename(filename);
		} else {
			product.setPhotoFilename("nopic");
		}
		
		productService.addNewProduct(product);
		
		return "redirect:/shopping/main.do";
	}
	
}
