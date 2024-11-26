package com.example.museo;

import org.springframework.cache.annotation.EnableCaching;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@EnableCaching
public class MuseoApplication {
    public static void main(String[] args) {
        SpringApplication.run(MuseoApplication.class, args);
    }
}

