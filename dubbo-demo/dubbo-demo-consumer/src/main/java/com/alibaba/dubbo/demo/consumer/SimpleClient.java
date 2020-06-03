package com.alibaba.dubbo.demo.consumer;

import com.alibaba.dubbo.config.ApplicationConfig;
import com.alibaba.dubbo.config.ReferenceConfig;
import com.alibaba.dubbo.demo.UserService;

public class SimpleClient {
    public UserService bulidRemoteService(String remoteUrl){
        ReferenceConfig<UserService> referenceConfig = new ReferenceConfig();
        referenceConfig.setInterface(UserService.class);
        referenceConfig.setUrl(remoteUrl);
        referenceConfig.setApplication(new ApplicationConfig("SimpleClient"));
        return referenceConfig.get();
    }

    public static void main(String[] args) {
        UserService userService = new SimpleClient().bulidRemoteService("dubbo://127.0.0.1:20880/com.alibaba.dubbo.demo.UserService");
        System.out.println(userService.printName("client"));

    }
}
