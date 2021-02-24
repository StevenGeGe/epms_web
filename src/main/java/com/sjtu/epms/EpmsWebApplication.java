package com.sjtu.epms;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling
@SpringBootApplication
public class EpmsWebApplication extends SpringBootServletInitializer {

    /**
     * .
     * 主函数
     *
     * @param args 参数数组
     */
    public static void main(String[] args) {
        SpringApplication.run(EpmsWebApplication.class, args);
    }

}
