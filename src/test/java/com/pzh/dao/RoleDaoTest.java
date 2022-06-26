package com.pzh.dao;

import com.pzh.domain.Role;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class RoleDaoTest {
	@Autowired
	private RoleDao roleDao;

	@Test
	void getById() {
		Role role = roleDao.selectById("1");
		System.out.println(role);
	}
}
