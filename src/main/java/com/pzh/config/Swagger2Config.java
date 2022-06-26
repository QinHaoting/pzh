package com.pzh.config;

import com.github.xiaoymin.knife4j.spring.annotations.EnableKnife4j;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Configuration
@EnableSwagger2
@EnableKnife4j
public class Swagger2Config {

    @Value("${swagger.enable}")
    private boolean swaggerEnable;
    //是否允许显示swagger。此值可在application.yml中设定。
    //作为开关，可在生产环境和开发环境打开或关闭，简便易行。

    @Bean
    public Docket createRestApi() {
        return new Docket(DocumentationType.SWAGGER_2)
                .enable(swaggerEnable)
                .apiInfo(apiInfo())
                .select()
                .apis(RequestHandlerSelectors.basePackage("com.pzh.controller")) //指定扫描包
                .apis(RequestHandlerSelectors.withClassAnnotation(Api.class))
                .paths(PathSelectors.any())
                //只显示api路径下的页面
                //.paths(Predicates.and(PathSelectors.regex("/api/.*")))
                .build()
                .groupName("API");
    }

    private ApiInfo apiInfo() {
        //作者信息
        Contact contact = new Contact("秦浩廷", "http://localhost:80/doc.html#/", "1165101405@qq.com");
        return new ApiInfoBuilder()
                .title("攀枝花物流管理系统API文档")
                .description("攀枝花物流管理系统API文档")
                .contact(contact)
                .version("1.0.0")
                .build();
    }
}

