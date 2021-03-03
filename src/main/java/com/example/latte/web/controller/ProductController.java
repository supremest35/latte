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

import com.example.latte.service.MarketCategoryService;
import com.example.latte.service.ProductService;
import com.example.latte.vo.MarketCategory;
import com.example.latte.vo.MarketLowCategory;
import com.example.latte.vo.MarketMidCategory;
import com.example.latte.vo.Product;
import com.example.latte.vo.ProductBrand;
import com.example.latte.vo.ProductColor;
import com.example.latte.vo.ProductMall;
import com.example.latte.vo.ProductPhoto;
import com.example.latte.form.ProductForm;

@Controller
@RequestMapping("/shopping/product")
public class ProductController {
	
	@Value("${directory.product.photo}")
	String directory;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	MarketCategoryService marketCategoryService;

	@RequestMapping("/list.do")
	public String list( @RequestParam(name="catno", required=false, defaultValue="-1") int categoryNo,
						@RequestParam(name="catlvl", required=false) String catlvl,
						@RequestParam(name="pageno", required=false, defaultValue="1") int pageNo,
						@RequestParam(name="rows", required=false, defaultValue="6") int rows,
						Model model) {
		
		Map<String, Object> condition = new HashMap<String, Object>();
		if (categoryNo != -1) {
			condition.put("categoryNo", categoryNo);
			MarketMidCategory category = marketCategoryService.getMidCategory(categoryNo);
			model.addAttribute("category", category);
		}
		List<MarketLowCategory> lowCategories = marketCategoryService.getLowCategories(categoryNo);
		List<MarketMidCategory> midCategories = marketCategoryService.getMidCategories(categoryNo);
		List<ProductBrand> brands = productService.getAllBrands();
		List<ProductColor> colors = productService.getAllColors();
		
		model.addAttribute("lowCategories", lowCategories);
		model.addAttribute("midCategories", midCategories);
		model.addAttribute("brands", brands);
		model.addAttribute("colors", colors);
		
		condition.put("pageNo", pageNo);
		condition.put("rows", rows);
		condition.put("begin", (pageNo - 1)*rows + 1);
		condition.put("end",  pageNo*rows);
		condition.put("catlvl",  catlvl);
		
		Map<String, Object> resultMap = productService.getProducts(condition);
		
		model.addAttribute("page", resultMap.get("pagination"));
		model.addAttribute("products", resultMap.get("products"));
		model.addAttribute("resVo", condition);
		
		return "/shopping/product/list";
	}
	
	@RequestMapping("/detail.do")
	public String detail(@RequestParam("prodno") int prodNo, Model model) {
		
		// 그 상품의 상세정보 요청시 상품의 조회수가 증가한다.
		Product p = productService.getProductByNo(prodNo);
		p.setHitCnt(p.getHitCnt()+1);
		
		productService.updateProduct(p);
		
		Product product = productService.getProductDetail(prodNo);
		MarketLowCategory category = marketCategoryService.getLowCategory(product.getCategoryLowNo());
		
		model.addAttribute("product", product);
		model.addAttribute("category", category);
		
		return "/shopping/product/detail";
	}

	@RequestMapping("/form.do")
	public String product(Model model) {
		List<MarketCategory> categories = marketCategoryService.getAllCategories();
		List<MarketMidCategory> midCategories = marketCategoryService.getAllMidCategories(); 
		List<MarketLowCategory> lowCategories = marketCategoryService.getAllLowCategories();
		List<ProductColor> colors = productService.getAllColors();
		List<ProductMall> malls = productService.getAllMalls();
		
		model.addAttribute("categories", categories);
		model.addAttribute("midCategories", midCategories);
		model.addAttribute("lowCategories", lowCategories);
		model.addAttribute("colors", colors);
		model.addAttribute("malls", malls);
		
		return "/shopping/product/form";
	}
	
	@RequestMapping("/register.do")
	public String register(ProductForm productForm) throws IOException {
		
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
		
		ProductPhoto photo = new ProductPhoto();
		photo.setProductNo(product.getNo());
		photo.setFilename(product.getPhotoFilename());
		
		productService.addNewProductPhoto(photo);
		
		ProductBrand brand = new ProductBrand();
		brand.setName(product.getBrandName());
		
		productService.addNewProductBrand(brand);
		
		return "redirect:/shopping/main.do";
	}
	
}
