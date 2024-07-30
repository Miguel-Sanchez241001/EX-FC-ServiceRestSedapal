package com.restexample.servicerest;

import org.springdoc.core.models.GroupedOpenApi;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class ServicerestApplication {

	public static void main(String[] args) {
		SpringApplication.run(ServicerestApplication.class, args);
	}
 

	@Bean
	public GroupedOpenApi myApi() {
		return GroupedOpenApi.builder()
			.group("Servicio Rest Generico Example Entidad Externa")
			.pathsToMatch("/api/**","/auth/**"  )
			.build();
	}

	
}
