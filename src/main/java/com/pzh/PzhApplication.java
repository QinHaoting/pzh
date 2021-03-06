package com.pzh;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@EnableTransactionManagement
@SpringBootApplication(scanBasePackages = {"com.pzh"})
public class PzhApplication {

	public static void main(String[] args) {
		SpringApplication.run(PzhApplication.class, args);
	}

}
