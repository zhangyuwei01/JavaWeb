package com.zyw.vo;

public class Comment {
	private int id;
	private int articleId;
	private int messageId;
	private String messageUsername;
	private String reply;
	private String commentTime;
	
	public Comment(){
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getArticleId() {
		return articleId;
	}

	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}

	public int getMessageId() {
		return messageId;
	}

	public void setMessageId(int messageId) {
		this.messageId = messageId;
	}

	public String getMessageUsername() {
		return messageUsername;
	}

	public void setMessageUsername(String messageUsername) {
		this.messageUsername = messageUsername;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public String getCommentTime() {
		return commentTime;
	}

	public void setCommentTime(String commentTime) {
		this.commentTime = commentTime;
	}
	
}
