package com.zyw.vo;

public class Note {
	private int id;
	private int messageId;
	private String messageUsername;
	private String word;
	private String noteTime;
	
	public Note(){
		
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

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

	public String getNoteTime() {
		return noteTime;
	}

	public void setNoteTime(String noteTime) {
		this.noteTime = noteTime;
	}
	
}
