package com.devpro.shop16;

import java.util.Collections;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class StartServer {

	public static void main(String[] args) {
//		SpringApplication.run(StartServer.class, args);

		SpringApplication start = new SpringApplication(StartServer.class);
		start.setDefaultProperties(Collections.singletonMap("server.port", "6060"));
		start.run(args);
	}

}
