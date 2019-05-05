package com.zyw.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.zyw.dao.NoteDAO;
import com.zyw.util.DbConnection;
import com.zyw.vo.Note;

public class NoteDAOImpl implements NoteDAO {

	@Override
	public Boolean addNote(Note note) {
		String sql = "INSERT INTO note(messageId,word,noteTime) VALUES(?,?,?)";
		try {
			Connection con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, note.getMessageId());
			ps.setString(2, note.getWord());
			ps.setString(3, note.getNoteTime());
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
	public List<Note> searchAllNote() {
		String sql= "select note.id,username,word,noteTime from note,message where note.messageID=message.Id order by noteTime desc";
		List<Note> list = new ArrayList<>();
		try {
			Connection con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				Note note = new Note();
				note.setId(rs.getInt("id"));
				note.setMessageUsername(rs.getString("username"));
				note.setWord(rs.getString("word"));
				note.setNoteTime(rs.getString("noteTime"));
				list.add(note);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

}
