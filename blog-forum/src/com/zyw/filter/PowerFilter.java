package com.zyw.filter;

import java.io.IOException;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class LoginFilter
 
@WebFilter("/LoginFilter")*/
public class PowerFilter implements Filter {
    /**
     * Default constructor. 
     */
    public PowerFilter() {
    	
    }
    
	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		
	}
	
	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// place your code here
		//定义请求对象，用来获取客户端信息
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		//定义返回对象，用来向客户端返回验证失败信息
        //HttpServletResponse httpResp = (HttpServletResponse)response;
        
		HttpSession session = httpRequest.getSession();
		//判断用户是否登录
		if(session.getAttribute("username")==null || session.getAttribute("id")==null){
			response.getWriter().append("<script type='text/javascript'>alert('请先登录！');history.go(-1);</script>");
			return;
		}
		// pass the request along the filter chain
		chain.doFilter(request, response);
		
		/**
		 * add by 张玉伟  20180812 校验token
		 */
		// ******************** 方案一：利用token认证 ********************
		/*//定义请求对象，用来获取客户端信息
		HttpServletRequest httpRequest = (HttpServletRequest)req;
		//定义返回对象，用来向客户端返回验证失败信息
        HttpServletResponse httpResp = (HttpServletResponse)resp;
        httpResp.setCharacterEncoding("UTF-8");
        httpResp.setContentType("application/json;charset=utf-8");
        httpResp.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
		
		HttpSession session = httpRequest.getSession();
		if(session==null) {
			httpResp.getWriter().write("会话超时！请重新登录！");return;
		}
		
        //客户端token
        String clientToken = httpRequest.getHeader("token");
        //服务器端token
        String serverToken = session.getAttribute("server_token").toString();
        //系统当前时间
        long currentTime = System.currentTimeMillis();
        //token有效期
        long validTime = Long.parseLong(session.getAttribute("valid_time").toString());
        
        if(clientToken==null) {
        	httpResp.getWriter().write("未找到token！");return;
        }
        if(!clientToken.equals(serverToken)) {
        	httpResp.getWriter().write("token不合法！");return;
        }
        if(currentTime>validTime) {
        	httpResp.getWriter().write("token超时！");return;
        }
        chain.doFilter(req, resp);*/
		/*if(JWTHelper.paraseJWT(clientToken) != null){
			 chain.doFilter(req, resp);
			 return;
	 	  }*/
		
		// ******************** 方案二：利用session认证 ********************
		/**
		 * add by 张玉伟  20180813 校验session
		 */
		/*//定义请求对象，用来获取客户端信息
		HttpServletRequest httpRequest = (HttpServletRequest)req;
		//定义返回对象，用来向客户端返回验证失败信息
        HttpServletResponse httpResp = (HttpServletResponse)resp;
        httpResp.setCharacterEncoding("UTF-8");
        httpResp.setContentType("application/json;charset=utf-8");
        httpResp.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
		
		HttpSession session = httpRequest.getSession(false);
		if(session==null) {
			httpResp.getWriter().write("会话超时！请重新登录！");return;
		}
		
        //客户端sessionId
        String clientSessionId = httpRequest.getHeader("sessionId");
        //服务器端sessionId
        String serverSessionId = session.getId();
        
        if(clientSessionId==null) {
        	httpResp.getWriter().write("没有权限！请登录！");return;
        }
        if(!clientSessionId.equals(serverSessionId)) {
        	httpResp.getWriter().write("认证不合法！请重新登录！");return;
        }
        chain.doFilter(req, resp);*/
	}
	
	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
