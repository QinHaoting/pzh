package com.pzh.dao;

import com.pzh.domain.User;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class UserDaoTest {
	@Autowired
	private UserDao userDao;

	@Test
	void getById() {
		User user = userDao.selectById("1");
		System.out.println(user);
	}
}
