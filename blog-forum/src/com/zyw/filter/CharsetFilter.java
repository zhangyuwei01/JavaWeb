package com.zyw.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * Servlet Filter implementation class CharsetFilter
 
@WebFilter("/CharsetFilter")*/
public class CharsetFilter implements Filter {
	private String encoding;
    /**
     * Default constructor. 
     */
    public CharsetFilter() {
    	
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		encoding=null;
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// place your code here
		if(encoding!=null){
			request.setCharacterEncoding(encoding);
			response.setContentType("text/html;charset=UTF-8");
			// pass the request along the filter chain
			chain.doFilter(request, response);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		encoding=fConfig.getInitParameter("encoding");
	}

}
