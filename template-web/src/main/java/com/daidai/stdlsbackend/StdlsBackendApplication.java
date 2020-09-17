package com.daidai.stdlsbackend;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.daidai.stdlsbackend.dao*")
public class StdlsBackendApplication {

	public static void main(String[] args) {
		SpringApplication.run(StdlsBackendApplication.class, args);
	}

}
