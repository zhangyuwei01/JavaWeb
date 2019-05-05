package com.zyw.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zyw.factory.DAOFactory;
import com.zyw.vo.Message;

/**
 * Servlet implementation class MessageAdmin
 */
@WebServlet(description = "用户信息管理", urlPatterns = { "/MessageAdmin" })
public class MessageAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageAdmin() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession(); //实例化一个session对象
		ServletContext application = session.getServletContext(); //实例化一个application对象
		//取得action的值，该参数是通过URL或表单传递到servlet中的
		String action = request.getParameter("action");
		//注册
		if(action.equals("register")){
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String question = request.getParameter("question");
			String answer = request.getParameter("answer");
			Message msg = new Message();
			msg.setUsername(username);
			msg.setPassword(password);
			msg.setQuestion(question);
			msg.setAnswer(answer);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			msg.setRegisterTime(sdf.format(new Date()));
			boolean flag0=DAOFactory.getMessageDAOInstance().usernameRepeat(username);
			if(flag0){
				response.getWriter().append("<script type='text/javascript'>alert('对不起！该用户名已被注册！');history.go(-1);</script>");
				return;
			}
			boolean flag1=DAOFactory.getMessageDAOInstance().register(msg);
			if(flag1){
				response.getWriter().append("<script type='text/javascript'>alert('注册成功！去登录吧！');location.href='index.jsp';</script>");
			}
			else{
				response.getWriter().append("<script type='text/javascript'>alert('对不起！注册失败！请稍后再试！');history.go(-1);</script>");
			}
		}
		//登录
		else if(action.equals("login")){
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			boolean flag=DAOFactory.getMessageDAOInstance().usernameRepeat(username);
			if(!flag){
				response.getWriter().append("<script type='text/javascript'>alert('对不起！该用户名不存在！');history.go(-1);</script>");
				return;
			}
			Message msg = DAOFactory.getMessageDAOInstance().query(username);
			if(password.equals(msg.getPassword())==false){
				response.getWriter().append("<script type='text/javascript'>alert('对不起！密码错误！');history.go(-1);</script>");
				return;
			}
			
			//同一个用户不能多次登录
			Map<Integer,String> userMap;
			if(application.getAttribute("userMap")==null) {
				userMap = new HashMap<>();
				userMap.put(msg.getId(), session.getId());
				application.setAttribute("userMap", userMap);
			}else {
				userMap = (Map<Integer, String>) application.getAttribute("userMap");
				Set<Integer> set = userMap.keySet();
				
				for(Integer i : set) {
					if(msg.getId()==i) {
						response.getWriter().append("<script type='text/javascript'>alert('对不起！您已经登录！');history.go(-1);</script>");
						return;
					}
				}
				userMap.put(msg.getId(), session.getId());
			}
			
			session.setAttribute("username",username);
			session.setAttribute("id",msg.getId());
			response.sendRedirect("index.jsp");
		}
		//更新个人信息
		else if(action.equals("updateMyMessage")){
			Message msg = new Message();
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String question = request.getParameter("question");
			String answer = request.getParameter("answer");
			String sex =request.getParameter("sex");
			String birthday =request.getParameter("birthday");
			String[] hobby =request.getParameterValues("hobby");
			String hobbys =hobby[0];
			for(int i=1;i<hobby.length;i++){
				hobbys+="、"+hobby[i];
			}
			String signature =request.getParameter("signature");
			msg.setUsername(username);
			msg.setPassword(password);
			msg.setQuestion(question);
			msg.setAnswer(answer);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			msg.setRegisterTime(sdf.format(new Date()));
			msg.setSex(sex);
			msg.setBirthday(birthday);
			msg.setHobby(hobbys);
			msg.setSignature(signature);
			
			boolean flag=DAOFactory.getMessageDAOInstance().update(msg);
			if(flag){
				response.getWriter().append("<script type='text/javascript'>alert('用户信息更新成功！');location.href='message/message_main.jsp';</script>");
			}
			else{
				response.getWriter().append("<script type='text/javascript'>alert('对不起！用户信息更新失败！请稍后再试！');history.go(-1);</script>");
			}
		}
		//注销
		else if(action.equals("destroy")){
			Map<Integer,String> userMap = (Map<Integer, String>) application.getAttribute("userMap");
			userMap.remove(session.getAttribute("id"));
			session.invalidate();
			response.sendRedirect("index.jsp");
		}
		//找回密码（用户名）
		else if(action.equals("findPwd_username")){
			String username = request.getParameter("username");
			
			boolean flag=DAOFactory.getMessageDAOInstance().usernameRepeat(username);
			if(!flag){
				response.getWriter().append("<script type='text/javascript'>alert('对不起！该用户名不存在！');history.go(-1);</script>");
				return;
			}
			Message msg = DAOFactory.getMessageDAOInstance().query(username);
			session.setAttribute("username",username);
			session.setAttribute("question",msg.getQuestion());
			response.getWriter().append("<script type='text/javascript'>alert('还记得注册账号时，您留下的<验证问题>的答案吗？');location.href='message/message_findWithQuestion.jsp';</script>");
		}
		//找回密码（结果）
		else if(action.equals("findPwd_question")){
			String username = request.getParameter("username");
			String answer = request.getParameter("answer");
			
			Message msg = DAOFactory.getMessageDAOInstance().query(username);
			if(answer.equals(msg.getAnswer())==false){
				response.getWriter().append("<script type='text/javascript'>alert('对不起！回答错误！查询密码失败！');history.go(-1);</script>");
				return;
			}
			session.setAttribute("password",msg.getPassword());
			response.getWriter().append("<script type='text/javascript'>alert('回答正确！查询密码成功！请牢记您的密码！');location.href='message/message_findWithPassword.jsp';</script>");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
