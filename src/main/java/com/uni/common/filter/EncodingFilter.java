package com.uni.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

//@WebFilter(filterName="encodingFilter", urlPatterns="/*")
//필터를 하나만 걸거면 어노테이션도 괜찮지만 여러 개인 경우 어노테이션걸면 복잡해진다
//서블릿마다 인코딩이 걸려있는데 암호화 후에 회원정보를 수정하거나 회원가입을 하는 경우 인코딩이 제대로 적용되지 않아 인코딩 필터를 따로 만듦
public class EncodingFilter implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		//System.out.println("인코딩 필터 동작");
		
		if(((HttpServletRequest)request).getMethod().equalsIgnoreCase("post")) {
			//System.out.println("post방식 요청됨");
			request.setCharacterEncoding("UTF-8");
		}
		
		//체인 코드 이 전은 서블릿 실행 전 실행될 코드들
		
		chain.doFilter(request, response); 
		
		//체인 코드 이후는 서블릿 실행 후 실행될 코드들 
		
		//System.out.println("===서블릿이 다 동작하고나서 출력됨===");
	}

}
