package com.mufengxz;

import com.mufengxz.entity.dto.User;
import com.mufengxz.service.UserService;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@SpringBootTest
class MufengxzBackendApplicationTests {

    UserService userService;
    @Test
    void contextLoads() {
        System.out.println(new BCryptPasswordEncoder().encode("123456"));
        User user = userService.findAccountByNameOrEmail("admin");
        System.out.println(user.getPassword());
    }

}
