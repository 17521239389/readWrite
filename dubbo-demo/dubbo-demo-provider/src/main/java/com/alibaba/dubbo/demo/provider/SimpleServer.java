package com.alibaba.dubbo.demo.provider;

import com.alibaba.dubbo.config.ApplicationConfig;
import com.alibaba.dubbo.config.ProtocolConfig;
import com.alibaba.dubbo.config.RegistryConfig;
import com.alibaba.dubbo.config.ServiceConfig;
import com.alibaba.dubbo.demo.UserService;

import java.io.IOException;

public class SimpleServer {
    public void openService(int port){
        //服务配置
        ServiceConfig serviceConfig = new ServiceConfig();
        //设置暴露的服务
        serviceConfig.setInterface(UserService.class);
        //设置协议
        serviceConfig.setProtocol(new ProtocolConfig("dubbo",port));
        //设置注册中心
        serviceConfig.setRegistry(new RegistryConfig(RegistryConfig.NO_AVAILABLE));
        //设置应用名称
        serviceConfig.setApplication(new ApplicationConfig("simpleServer"));
        //设置服务具体实现类
        serviceConfig.setRef(new UserServiceImpl());
        //暴露服务
        serviceConfig.export();
        System.out.println("服务已开启"+port);
    }

    public static void main(String[] args) throws IOException {
        new SimpleServer().openService(20880);
        System.in.read();
    }

}
