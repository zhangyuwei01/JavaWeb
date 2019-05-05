package com.zyw.dao;

import java.util.List;

import com.zyw.vo.Note;

public interface NoteDAO {
	//发表留言
	public Boolean addNote(Note note);
	//查询全部留言
	public List<Note> searchAllNote();
}
