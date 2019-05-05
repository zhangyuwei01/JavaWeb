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
import com.zyw.vo.Note;

/**
 * Servlet implementation class NoteAdmin
 */
@WebServlet("/NoteAdmin")
public class NoteAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoteAdmin() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession(); //实例化一个session对象
		String action = request.getParameter("action");
		//发表留言
		if(action.equals("sendNote")){
			int messageId = (int) session.getAttribute("id");
			String word = request.getParameter("word");
			
			Note note = new Note();
			note.setMessageId(messageId);
			note.setWord(word);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			note.setNoteTime(sdf.format(new Date()));
			boolean flag = DAOFactory.getNoteDAOInstance().addNote(note);
			if(flag){
				response.getWriter().append("<script type='text/javascript'>location.href='note/note_main.jsp';</script>");
			}
			else{
				response.getWriter().append("<script type='text/javascript'>alert('对不起！留言发表失败！请稍后再试！');location.href='note/note_main.jsp';</script>");
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
