package com.zyw.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zyw.factory.DAOFactory;
import com.zyw.vo.Luck;

/**
 * Servlet implementation class GameAdmin
 */
@WebServlet("/GameAdmin")
public class GameAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GameAdmin() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession();
		//获取action的值
		String action = request.getParameter("action");
		//大转盘抽奖
		if(action.equals("choujiang")){
			int messageId = (int) session.getAttribute("id");
			String mode = request.getParameter("mode");
			String content = request.getParameter("content");
			
			Luck luck = new Luck();
			luck.setMessageId(messageId);
			luck.setMode(mode);
			luck.setContent(content);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			luck.setLuckTime(sdf.format(new Date()));
			DAOFactory.getGameDAOInstance().choujiang(luck);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
