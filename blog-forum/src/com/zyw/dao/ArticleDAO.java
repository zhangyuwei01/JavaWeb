package com.zyw.dao;

import java.util.List;

import com.zyw.vo.Article;
import com.zyw.vo.Comment;

public interface ArticleDAO {
	//发表文章
	public Boolean sendArticle(Article article);
	
	//修改文章
	public Boolean updateArticle(Article article);
	
	//删除文章
	public Boolean deleteMyArticle(int id);
	
	//根据ID查询文章内容
	public Article searchByID(int id);
	
	//查询全部文章(全部、首页top10)
	public List<Article> searchAllArticle(String method);
	
	//根据指定属性模糊查询
	public List<Article> searchByLikeProperty(String property,String value);
	
	//发表评论
	public Boolean sendComment(Comment comment);
	
	//根据文章ID查询全部评论内容
	public List<Comment> searchAllComment(int i);
}
