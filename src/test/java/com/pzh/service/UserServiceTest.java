package com.pzh.service;

import com.pzh.domain.User;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class UserServiceTest {
	@Autowired
	private UserService userService;

	@Test
	void getById() {
		User user = userService.getById("1");
		System.out.println(user);
	}
}
