package org.springframework.samples.petclinic;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class ViewConfiguration extends WebMvcConfigurerAdapter {

	public void addViewControllers(ViewControllerRegistry registry) {
//		registry.addViewController("/home").setViewName("home");
//		registry.addViewController("/").setViewName("home");
		 registry.addViewController("/orders").setViewName("orders");
//		registry.addViewController("/hello").setViewName("hello");
		registry.addViewController("/login").setViewName("login");
//		registry.addViewController("/403").setViewName("403");
	}

}
