package com.zyw.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.zyw.dao.GameDAO;
import com.zyw.util.DbConnection;
import com.zyw.vo.Luck;

public class GameDAOImpl implements GameDAO {

	@Override
	public Boolean choujiang(Luck luck) {
		String sql = "insert into luck(messageId,mode,content,luckTime) values(?,?,?,?)";
		try {
			Connection con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, luck.getMessageId());
			ps.setString(2, luck.getMode());
			ps.setString(3, luck.getContent());
			ps.setString(4, luck.getLuckTime());
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
	public List<Luck> selectChouJiang() {
		String sql= "select username,mode,content,luckTime from luck,message where luck.messageId=message.Id order by luckTime desc limit 50";
		List<Luck> list = new ArrayList<>();
		try {
			Connection con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				Luck luck = new Luck();
				luck.setMessageUsername(rs.getString("username"));
				luck.setMode(rs.getString("mode"));
				luck.setContent(rs.getString("content"));
				luck.setLuckTime(rs.getString("luckTime"));
				list.add(luck);
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
