package com.pzh.info.dao;

import com.pzh.info.domain.Role;
import com.pzh.info.domain.User;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class RoleDaoTest {
	@Autowired
	private RoleDao roleDao;

	@Test
	void getById() {
		Role role = roleDao.selectById("r001");
		System.out.println(role);
	}
}
