package com.zyw.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.zyw.factory.DAOFactory;
import com.zyw.vo.MultimediaFile;

/**
 * Servlet implementation class UploadAudioAdmin
 */
@WebServlet("/UploadAudioAdmin")
public class UploadAudioAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ServletConfig servletconfig;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadAudioAdmin() {
        super();
    }
    
    public void init(ServletConfig config) throws ServletException {
		this.servletconfig = config;
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession(); //实例化一个session对象
		// 新建一个SmartUpload对象
		SmartUpload su = new SmartUpload(); 
		// 上传初始化
		su.initialize(servletconfig, request, response); 
		// 限制每个上传文件的最大长度。
		su.setMaxFileSize(1024*1024*20); 
		// 限制总上传数据的长度。
		su.setTotalMaxFileSize(1024*1024*100); 
		// 设定允许上传的文件（通过扩展名限制）,仅允许doc,txt文件。
		su.setAllowedFilesList("mp3");

		// 上传文件
		try {
			su.upload();
		} catch (SmartUploadException e) {
			e.printStackTrace();
		}
		// 将上传文件全部保存到指定目录
		try {
			int count = su.save("D:/Program Files/Java/apache-tomcat-8.0.45/webapps/upload/audio");
			System.out.println("上传的音频count="+count);
			int messageId = (int) session.getAttribute("id");
			String fileName = su.getFiles().getFile(0).getFileName();
			String fileType = su.getFiles().getFile(0).getFileExt();
			String fileSize = su.getFiles().getFile(0).getSize()/1048576+"MB";
			MultimediaFile file = new MultimediaFile();
			file.setMessageId(messageId);
			file.setFileName(fileName);
			file.setFileType(fileType);
			file.setFileSize(fileSize);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			file.setUploadTime(sdf.format(new Date()));
			boolean flag = DAOFactory.getFileDAOInstance().addFile(file);
			if(flag){
				response.getWriter().append("<script type='text/javascript'>alert('音乐上传成功！');location.href='audio/audio_main.jsp';</script>");
			}
			else{
				response.getWriter().append("<script type='text/javascript'>alert('对不起！音频上传失败！请稍后再试！');location.href='audio/audio_main.jsp';</script>");
			}
		} catch (SmartUploadException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
