package com.example.latte;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan("com.example.latte.dao")
@SpringBootApplication
public class LatteApplication {

	public static void main(String[] args) {
		SpringApplication.run(LatteApplication.class, args);
	}

}
