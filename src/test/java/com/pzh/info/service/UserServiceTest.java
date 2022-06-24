package com.pzh.info.service;

import com.pzh.info.dao.UserDao;
import com.pzh.info.domain.User;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class UserServiceTest {
	@Autowired
	private UserService userService;

	@Test
	void getById() {
		User user = userService.getById("u001");
		System.out.println(user);
	}
}
