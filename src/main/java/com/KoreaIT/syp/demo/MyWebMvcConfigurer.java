package com.KoreaIT.syp.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.KoreaIT.syp.demo.interceptor.BeforeActionInterceptor;
import com.KoreaIT.syp.demo.interceptor.NeedLoginInterceptor;
import com.KoreaIT.syp.demo.interceptor.NeedLogoutInterceptor;

@Configuration
public class MyWebMvcConfigurer implements WebMvcConfigurer {
	// BeforeActionInterceptor 불러오기 (연결)
	@Autowired
	BeforeActionInterceptor beforeActionInterceptor;
	
	// NeedLoginInterceptor 불러오기 (로그인 상태에서 가능한 기능)
	@Autowired
	NeedLoginInterceptor needLoginInterceptor;
	
	// NeedLogoutInterceptor 불러오기 (로그아웃 상태에서 가능한 기능)
	@Autowired
	NeedLogoutInterceptor needLogoutInterceptor;
	
	// /resource/common.css
	// 인터셉트 적용
	public void addInterceptors(InterceptorRegistry registry) {
		InterceptorRegistration ir;

		ir = registry.addInterceptor(beforeActionInterceptor);
		ir.addPathPatterns("/**");
		ir.addPathPatterns("/favicon.ico");
		ir.excludePathPatterns("/resource/**");
		ir.excludePathPatterns("/error");
		
		// 로그인 필요
		ir = registry.addInterceptor(needLoginInterceptor);
		ir.addPathPatterns("/usr/article/write");
		ir.addPathPatterns("/usr/article/doWrite");
		ir.addPathPatterns("/usr/article/modify");
		ir.addPathPatterns("/usr/article/doModify");
		ir.addPathPatterns("/usr/article/doDelete");
		
		ir.addPathPatterns("/usr/member/myPage");
		ir.addPathPatterns("/usr/member/checkPw");
		ir.addPathPatterns("/usr/member/doCheckPw");
		ir.addPathPatterns("/usr/member/modify");
		ir.addPathPatterns("/usr/member/doModify");
		
		ir.addPathPatterns("/usr/reply/doWrite");
		ir.addPathPatterns("/usr/reply/modify");
		ir.addPathPatterns("/usr/reply/doModify");
		ir.addPathPatterns("/usr/reply/doDelete");

		ir.addPathPatterns("/usr/reactionPoint/doGoodReaction");
		ir.addPathPatterns("/usr/reactionPoint/doBadReaction");
		ir.addPathPatterns("/usr/reactionPoint/doCancelGoodReaction");
		ir.addPathPatterns("/usr/reactionPoint/doCancelBadReaction");
		
		// 로그아웃 필요
		ir = registry.addInterceptor(needLogoutInterceptor);
		ir.addPathPatterns("/usr/member/login");
		ir.addPathPatterns("/usr/member/doLogin");
		ir.addPathPatterns("/usr/member/join");
		ir.addPathPatterns("/usr/member/doJoin");
		ir.addPathPatterns("/usr/member/findLoginId");
		ir.addPathPatterns("/usr/member/doFindLoginId");
		ir.addPathPatterns("/usr/member/findLoginPw");
		ir.addPathPatterns("/usr/member/doFindLoginPw");
	}
	
	@Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
        	.allowedOrigins("http://localhost:8082", "http://localhost:8082/usr/bus/map") // 허용할 출처
            .allowedMethods("GET", "POST") // 허용할 HTTP method
            .allowCredentials(true) // 쿠키 인증 요청 허용
            .maxAge(3000); // 원하는 시간만큼 pre-flight 리퀘스트를 캐싱
    }
}
