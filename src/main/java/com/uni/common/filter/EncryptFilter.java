package com.uni.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import com.uni.common.wrapper.EncryptWrapper;

/**
 * Servlet Filter implementation class EncryptFilter
 */
//@WebFilter(filterName = "encryptFilter", urlPatterns={"/login.do","/insertMember.do","/insertMembergoogle.do"})
//@ 어노테이션으로 걸 수도 있다. web.xml에서 필터매핑할거라 주석처리함
public class EncryptFilter implements Filter {

    /**
     * Default constructor. 
     */
    public EncryptFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		//회원탈퇴 시 비밀번호 일치 후 탈퇴가 진행돼서 오리지널 비번을 따로 저장해둔다.
		((HttpServletRequest) request).getSession().setAttribute("originPwd", request.getParameter("userPwd"));
		
		request.setAttribute("userPwd", request.getParameter("userPwd"));
		System.out.println("변경 전 userPwd : " + request.getParameter("userPwd"));
		
		EncryptWrapper encRequest = new EncryptWrapper((HttpServletRequest)request);
		
		System.out.println("변경 후 userPwd : " + encRequest.getParameter("userPwd"));
		
		chain.doFilter(encRequest, response); //변경한 내용이 encRequest에 담겨있음
			
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
