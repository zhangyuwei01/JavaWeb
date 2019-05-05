package com.zyw.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.zyw.dao.ArticleDAO;
import com.zyw.util.DbConnection;
import com.zyw.vo.Article;
import com.zyw.vo.Comment;

public class ArticleDAOImpl implements ArticleDAO {

	@Override
	public Boolean sendArticle(Article article) {
		String sql = "insert into article(messageId,title,catalogs,publishTime,content) values(?,?,?,?,?)";
		try {
			Connection con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, article.getMessageId());
			ps.setString(2, article.getTitle());
			ps.setString(3, article.getCatalogs());
			ps.setString(4, article.getPublishTime());
			ps.setString(5, article.getContent());
			int result = ps.executeUpdate();
			if(result>0){
				ps.close();
				con.close();
			}
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@Override
	public Boolean updateArticle(Article article) {
		String sql = "update article set title=?,catalogs=?,content=? where id=?";
		try {
			Connection con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, article.getTitle());
			ps.setString(2, article.getCatalogs());
			ps.setString(3, article.getContent());
			ps.setInt(4, article.getId());
			int result=ps.executeUpdate();
			if(result>0){
				ps.close();
				con.close();
			}
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Boolean deleteMyArticle(int id) {
		String sql = "delete from article where id=?";
		try {
			Connection con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			int result = ps.executeUpdate();
			if(result>0){
				ps.close();
				con.close();
			}
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		
	}

	@Override
	public Article searchByID(int id) {
		Article article = new Article();
		String sql = "select article.id,title,username,catalogs,publishTime,content from article,message where article.messageID=message.Id and article.id=?";
		try {
			Connection con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			rs.next();
			article.setId(rs.getInt("article.id"));
			article.setTitle(rs.getString("title"));
			article.setMessageUsername(rs.getString("username"));
			article.setCatalogs(rs.getString("catalogs"));
			article.setPublishTime(rs.getString("publishTime"));
			article.setContent(rs.getString("content"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return article;
	}

	@Override
	public List<Article> searchAllArticle(String method) {
		String sql1= "select article.id,title,username,catalogs,publishTime,content from article,message where article.messageId=message.Id order by publishTime desc";
		String sql2= "select article.id,title,username,catalogs,publishTime,content from article,message where article.messageId=message.Id order by publishTime desc limit 10";
		String sql="";
		List<Article> list = new ArrayList<>();
		try {
			Connection con = DbConnection.getConnection();
			if(method.equals("all")){
				sql=sql1;
			}
			else{
				sql=sql2;
			}
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				Article article = new Article();
				article.setId(rs.getInt("article.id"));
				article.setTitle(rs.getString("title"));
				article.setMessageUsername(rs.getString("username"));
				article.setCatalogs(rs.getString("catalogs"));
				article.setPublishTime(rs.getString("publishTime"));
				article.setContent(rs.getString("content"));
				list.add(article);
			}
			rs.close();
			ps.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Article> searchByLikeProperty(String property, String value) {
		String sql = "select article.id,title,username,catalogs,publishTime,content from article,message where article.messageID=message.Id and "+property+" like '%"+value+"%' order by publishTime desc";
		List<Article> list = new ArrayList<>();
		try {
			Connection con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				Article article = new Article();
				article.setId(rs.getInt("article.id"));
				article.setTitle(rs.getString("title"));
				article.setMessageUsername(rs.getString("username"));
				article.setCatalogs(rs.getString("catalogs"));
				article.setPublishTime(rs.getString("publishTime"));
				article.setContent(rs.getString("content"));
				list.add(article);
			}
			rs.close();
			ps.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Boolean sendComment(Comment comment) {
		String sql = "insert into comment(messageId,articleId,reply,commentTime) values(?,?,?,?)";
		try {
			Connection con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, comment.getMessageId());
			ps.setInt(2, comment.getArticleId());
			ps.setString(3, comment.getReply());
			ps.setString(4,comment.getCommentTime());
			int result = ps.executeUpdate();
			if(result>0){
				ps.close();
				con.close();
			}
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public List<Comment> searchAllComment(int id) {
		String sql = "select username,reply,commentTime from comment,article,message where comment.messageID=message.Id and comment.articleId=article.id and article.id=? order by publishTime";
		List<Comment> list = new ArrayList<>();
		try {
			Connection con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				Comment comment = new Comment();
				comment.setMessageUsername(rs.getString("username"));
				comment.setReply(rs.getString("reply"));
				comment.setCommentTime(rs.getString("commentTime"));
				list.add(comment);
			}
			rs.close();
			ps.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
