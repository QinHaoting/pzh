package com.pzh.info.dao;

import com.pzh.info.domain.User;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class UserDaoTest {
	@Autowired
	private UserDao userDao;

	@Test
	void getById() {
		User user = userDao.selectById("u001");
		System.out.println(user);
	}
}
