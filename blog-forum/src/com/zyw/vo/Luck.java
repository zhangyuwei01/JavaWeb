package com.zyw.vo;

public class Luck {
	private int id;
	private int messageId;
	private String messageUsername;
	private String mode;
	private String content;
	private String luckTime;
	
	public Luck(){
		
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public String getLuckTime() {
		return luckTime;
	}

	public void setLuckTime(String luckTime) {
		this.luckTime = luckTime;
	}
	
}
