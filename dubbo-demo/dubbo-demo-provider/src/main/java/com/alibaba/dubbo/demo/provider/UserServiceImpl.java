package com.alibaba.dubbo.demo.provider;

import com.alibaba.dubbo.demo.UserService;

public class UserServiceImpl implements UserService {
    @Override
    public String printName(String name) {
        System.out.println(name);
        return "====="+name+"=====";
    }
}
