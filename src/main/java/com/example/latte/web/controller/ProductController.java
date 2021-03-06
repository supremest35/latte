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

import com.example.latte.dto.ProductDto;
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
	public String list(@RequestParam(name = "catno", required = false, defaultValue = "-1") int categoryNo,
			@RequestParam(name = "catlvl", required = false, defaultValue = "1") String catlvl,
			@RequestParam(name = "rows", required = false, defaultValue = "6") int rows, Model model) {

		Map<String, Object> condition = new HashMap<String, Object>();
		if (categoryNo != -1) {
			condition.put("categoryNo", categoryNo);
			switch (catlvl) {
			case "1":
				MarketCategory category = marketCategoryService.getCategoryByNo(categoryNo);
				model.addAttribute("category", category);
				break;
			case "2":
				MarketMidCategory midCategory = marketCategoryService.getMidCategory(categoryNo);
				model.addAttribute("category", midCategory);
				break;
			case "3":
				MarketLowCategory lowCategory = marketCategoryService.getLowCategory(categoryNo);
				model.addAttribute("category", lowCategory);
				break;
			}
		}
		List<MarketLowCategory> lowCategories = marketCategoryService.getLowCategories(categoryNo);
		List<MarketMidCategory> midCategories = marketCategoryService.getMidCategories(categoryNo);
		List<ProductBrand> brands = productService.getAllBrands();
		List<ProductColor> colors = productService.getAllColors();

		model.addAttribute("lowCategories", lowCategories);
		model.addAttribute("midCategories", midCategories);
		model.addAttribute("brands", brands);
		model.addAttribute("colors", colors);

		condition.put("rows", rows);
		condition.put("catlvl", catlvl);

		Map<String, Object> resultMap = productService.getProducts(condition);

		model.addAttribute("page", resultMap.get("pagination"));
		model.addAttribute("products", resultMap.get("products"));
		model.addAttribute("resVo", condition);

		return "/shopping/product/list";
	}

	@RequestMapping("/detail.do")
	public String detail(@RequestParam("prodno") int prodNo, Model model) {

		Product p = productService.getProductByNo(prodNo);
		p.setHitCnt(p.getHitCnt() + 1);

		productService.updateProduct(p);

		Product product = productService.getProductDetail(prodNo);
		MarketLowCategory category = marketCategoryService.getLowCategory(product.getCategoryLowNo());
		
		List<Product> details = productService.getProductDetailsByProdNo(prodNo);
		ProductDto minAndMaxPrice = productService.getProductMinAndMaxPrice(prodNo);

		model.addAttribute("product", product);
		model.addAttribute("minAndMaxPrice", minAndMaxPrice);
		model.addAttribute("details", details);
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
	public String register(Product insertProduct) throws IOException {

		Product product = new Product();
		BeanUtils.copyProperties(insertProduct, product);

		product.setDetailBrandName(product.getProductBrandName());
		product.setDetailCd(product.getProductCd());
		product.setDetailName(product.getProductName());

		MultipartFile photoFile = insertProduct.getPhotoFile();
		if (!photoFile.isEmpty()) {
			String filename = photoFile.getOriginalFilename();
			filename = System.currentTimeMillis() + filename;
			File file = new File(directory, filename);
			FileCopyUtils.copy(photoFile.getInputStream(), new FileOutputStream(file));
			product.setPhotoFilename(filename);
		} else {
			product.setPhotoFilename("nopic");
		}
		productService.addNewProduct(product);
		
		/*
		Product p = productService.getProductByNo(product.getNo());
		p.setDetailProductNo(product.getNo());
		productService.updateProduct(p);
		*/

		ProductPhoto photo = new ProductPhoto();
		photo.setProductNo(product.getNo());
		photo.setFilename(product.getPhotoFilename());
		productService.addNewProductPhoto(photo);

		ProductBrand brand = new ProductBrand();
		brand.setName(product.getProductBrandName());
		productService.addNewProductBrand(brand);

		return "redirect:/shopping/main.do";
	}

}
