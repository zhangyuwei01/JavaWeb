package com.zyw.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.zyw.dao.MessageDAO;
import com.zyw.util.DbConnection;
import com.zyw.vo.Message;

public class MessageDAOImpl implements MessageDAO {
	@Override
	public Boolean usernameRepeat(String username) {
		Connection con=null;
		String sql = "select username from message where username=?";
		try {
			con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				return true;
			}
			return false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@Override
	public Boolean register(Message message) {
		Connection con = null;
		String sql = "INSERT INTO message(username,password,question,answer,registerTime) VALUES(?,?,?,?,?)";
		try {
			con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, message.getUsername());
			ps.setString(2, message.getPassword());
			ps.setString(3, message.getQuestion());
			ps.setString(4, message.getAnswer());
			ps.setString(5, message.getRegisterTime());
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
	public Message query(String username) {
		Message message = new Message();
		Connection con=null;
		String sql = "select * from message where username=?";
		try {
			con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			rs.next();
			message.setId(rs.getInt("id"));
			message.setUsername(rs.getString("username"));
			message.setPassword(rs.getString("password"));
			message.setQuestion(rs.getString("question"));
			message.setAnswer(rs.getString("answer"));
			message.setRegisterTime(rs.getString("registerTime"));
			message.setSex(rs.getString("sex"));
			message.setBirthday(rs.getString("birthday"));
			message.setHobby(rs.getString("hobby"));
			message.setSignature(rs.getString("signature"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return message;
	}

	@Override
	public Boolean update(Message message) {
		String sql = "update message set password=?,question=?,answer=?,registerTime=?,sex=?,birthday=?,hobby=?,signature=? where username=?";
		try {
			Connection con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, message.getPassword());
			ps.setString(2, message.getQuestion());
			ps.setString(3, message.getAnswer());
			ps.setString(4, message.getRegisterTime());
			ps.setString(5, message.getSex());
			ps.setString(6, message.getBirthday());
			ps.setString(7, message.getHobby());
			ps.setString(8, message.getSignature());
			ps.setString(9, message.getUsername());
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

}
