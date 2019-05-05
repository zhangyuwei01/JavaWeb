package com.zyw.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zyw.factory.DAOFactory;
import com.zyw.vo.Article;
import com.zyw.vo.Comment;

/**
 * Servlet implementation class ArticleAdmin
*/
@WebServlet("/ArticleAdmin")
public class ArticleAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ArticleAdmin() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession(); //实例化一个session对象
		//取得action的值，该参数是通过URL或表单传递到servlet中的
		String action = request.getParameter("action");
		//发表文章
		if(action.equals("sendArticle")){
			String title = request.getParameter("title");
			int messageId = (int) session.getAttribute("id");
			String catalogs = request.getParameter("catalogs");
			String content = request.getParameter("content");
			
			Article article = new Article();
			article.setMessageId(messageId);
			article.setTitle(title);
			article.setCatalogs(catalogs);
			article.setContent(content);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			article.setPublishTime(sdf.format(new Date()));
			boolean flag = DAOFactory.getArticeDAOInstance().sendArticle(article);
			if(flag){
				response.getWriter().append("<script type='text/javascript'>alert('文章发表成功！');location.href='article/article_main.jsp';</script>");
			}
			else{
				response.getWriter().append("<script type='text/javascript'>alert('对不起！文章发表失败！请稍后再试！');location.href='article/article_send.jsp';</script>");
			}
		}
		//修改文章
		else if(action.equals("updateArticle")){
			int id = Integer.parseInt(request.getParameter("id"));
			String title = request.getParameter("title");
			String catalogs = request.getParameter("catalogs");
			String content = request.getParameter("content");
			
			Article article = new Article();
			article.setId(id);
			article.setTitle(title);
			article.setCatalogs(catalogs);
			article.setContent(content);
			
			boolean flag = DAOFactory.getArticeDAOInstance().updateArticle(article);
			if(flag){
				response.getWriter().append("<script type='text/javascript'>alert('文章修改成功！');location.href='article/article_mine.jsp';</script>");
			}
			else{
				response.getWriter().append("<script type='text/javascript'>alert('对不起！文章修改失败！请稍后再试！');location.href='article/article_mine.jsp';</script>");
			}
		}
		//删除文章
		else if(action.equals("deleteArticle")){
			int id = Integer.parseInt(request.getParameter("id"));
			boolean flag = DAOFactory.getArticeDAOInstance().deleteMyArticle(id);
			if(flag){
				response.getWriter().append("<script type='text/javascript'>alert('文章删除成功！');location.href='article/article_mine.jsp';</script>");
			}
			else{
				response.getWriter().append("<script type='text/javascript'>alert('对不起！文章删除失败！请稍后再试！');location.href='article/article_mine.jsp';</script>");
			}
		}
		//通过标题搜索文章
		else if(action.equals("searchByTitle")){
			String title = request.getParameter("title");
			List<Article> articleList = new ArrayList<>();
			articleList = DAOFactory.getArticeDAOInstance().searchByLikeProperty("title", title);
			
			session.setAttribute("list", articleList);
			response.sendRedirect("article/article_search.jsp");
		}
		//通过分类搜索文章
		else if(action.equals("searchByCatalogs")){
			String catalogs = request.getParameter("catalogs");
			List<Article> articleList = new  ArrayList<>();
			articleList = DAOFactory.getArticeDAOInstance().searchByLikeProperty("catalogs", catalogs);
			
			session.setAttribute("list", articleList);
			response.sendRedirect("article/article_search.jsp");
		}
		//通过作者搜索文章
		else if(action.equals("searchByUsername")){
			String username = request.getParameter("username");
			List<Article> articleList = new ArrayList<>();
			articleList = DAOFactory.getArticeDAOInstance().searchByLikeProperty("username", username);
			
			session.setAttribute("list", articleList);
			response.sendRedirect("article/article_search.jsp");
		}
		//通过内容搜索文章
		else if(action.equals("searchByContent")){
			String content = request.getParameter("content");
			List<Article> articleList = new ArrayList<>();
			articleList = DAOFactory.getArticeDAOInstance().searchByLikeProperty("content", content);
			
			session.setAttribute("list", articleList);
			response.sendRedirect("article/article_search.jsp");
		}
		//发表评论
		else if(action.equals("sendComment")){
			int messageId = (int) session.getAttribute("id");
			int articleId = Integer.parseInt(request.getParameter("articleId"));
			String reply = request.getParameter("reply");
			
			Comment comment = new Comment();
			comment.setMessageId(messageId);
			comment.setArticleId(articleId);
			comment.setReply(reply);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			comment.setCommentTime(sdf.format(new Date()));
			boolean flag = DAOFactory.getArticeDAOInstance().sendComment(comment);
			if(flag){
				response.getWriter().append("<script type='text/javascript'>location.href='article/article_detail.jsp?id="+articleId+"';</script>");
			}
			else{
				response.getWriter().append("<script type='text/javascript'>alert('对不起！评论发表失败！请稍后再试！');location.href='article/article_detail.jsp?id="+articleId+"';</script>");
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
