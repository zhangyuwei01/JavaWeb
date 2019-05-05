package com.zyw.factory;

import com.zyw.dao.ArticleDAO;
import com.zyw.dao.FileDAO;
import com.zyw.dao.GameDAO;
import com.zyw.dao.MessageDAO;
import com.zyw.dao.NoteDAO;
import com.zyw.dao.impl.ArticleDAOImpl;
import com.zyw.dao.impl.FileDAOImpl;
import com.zyw.dao.impl.GameDAOImpl;
import com.zyw.dao.impl.MessageDAOImpl;
import com.zyw.dao.impl.NoteDAOImpl;

public class DAOFactory {
	public static MessageDAO getMessageDAOInstance(){
		return new MessageDAOImpl();
	}
	public static ArticleDAO getArticeDAOInstance(){
		return new ArticleDAOImpl();
	}
	public static NoteDAO getNoteDAOInstance(){
		return new NoteDAOImpl();
	}
	public static GameDAO getGameDAOInstance(){
		return new GameDAOImpl();
	}
	public static FileDAO getFileDAOInstance(){
		return new FileDAOImpl();
	}
}
