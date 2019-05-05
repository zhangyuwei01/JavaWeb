package com.zyw.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zyw.factory.DAOFactory;

/**
 * Servlet implementation class FileAdmin
 */
@WebServlet("/FileAdmin")
public class FileAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileAdmin() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String action = request.getParameter("action");
		String id = request.getParameter("id");
		if(action.equals("deleteImage")){
			boolean flag = DAOFactory.getFileDAOInstance().deleteMyFile(Integer.parseInt(id));
			if(flag){
				response.getWriter().append("<script type='text/javascript'>alert('图片删除成功！');location.href='image/image_mine.jsp';</script>");
			}
			else{
				response.getWriter().append("<script type='text/javascript'>alert('对不起！图片删除失败！请稍后再试！');location.href='image/image_mine.jsp';</script>");
			}
		}
		else if(action.equals("deleteAudio")){
			boolean flag = DAOFactory.getFileDAOInstance().deleteMyFile(Integer.parseInt(id));
			if(flag){
				response.getWriter().append("<script type='text/javascript'>alert('音乐删除成功！');location.href='audio/audio_mine.jsp';</script>");
			}
			else{
				response.getWriter().append("<script type='text/javascript'>alert('对不起！音乐删除失败！请稍后再试！');location.href='audio/audio_mine.jsp';</script>");
			}
		}
		else if(action.equals("deleteVideo")){
			boolean flag = DAOFactory.getFileDAOInstance().deleteMyFile(Integer.parseInt(id));
			if(flag){
				response.getWriter().append("<script type='text/javascript'>alert('视频删除成功！');location.href='video/video_mine.jsp';</script>");
			}
			else{
				response.getWriter().append("<script type='text/javascript'>alert('对不起！视频删除失败！请稍后再试！');location.href='video/video_mine.jsp';</script>");
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
