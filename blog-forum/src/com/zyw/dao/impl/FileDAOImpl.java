package com.zyw.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.zyw.dao.FileDAO;
import com.zyw.util.DbConnection;
import com.zyw.vo.MultimediaFile;

public class FileDAOImpl implements FileDAO {

	@Override
	public Boolean addFile(MultimediaFile file) {
		String sql = "insert into file(messageId,fileName,fileType,fileSize,uploadTime) values(?,?,?,?,?)";
		try {
			Connection con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, file.getMessageId());
			ps.setString(2, file.getFileName());
			ps.setString(3, file.getFileType());
			ps.setString(4, file.getFileSize());
			ps.setString(5, file.getUploadTime());
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
	public MultimediaFile searchByID(int id) {
		MultimediaFile multimediaFile = new MultimediaFile();
		String sql = "select file.id,username,fileName,fileType,fileSize,uploadTime from file,message where file.messageID=message.Id and file.id=?";
		try {
			Connection con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			rs.next();
			multimediaFile.setId(rs.getInt("file.id"));
			multimediaFile.setMessageUsername(rs.getString("username"));
			multimediaFile.setFileName(rs.getString("fileName"));
			multimediaFile.setFileType(rs.getString("fileType"));
			multimediaFile.setFileSize(rs.getString("fileSize"));
			multimediaFile.setUploadTime(rs.getString("uploadTime"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return multimediaFile;
	}
	
	@Override
	public List<MultimediaFile> searchFileByType(String type,String method) {
		String sql1= "select file.id,username,fileName,fileType,fileSize,uploadTime from file,message where file.messageID=message.Id and fileType in ('jpg','png','jpeg') order by uploadTime desc";
		String sql2= "select file.id,username,fileName,fileType,fileSize,uploadTime from file,message where file.messageID=message.Id and fileType in ('mp3') order by uploadTime desc";
		String sql3= "select file.id,username,fileName,fileType,fileSize,uploadTime from file,message where file.messageID=message.Id and fileType in ('mp4','mkv','avi') order by uploadTime desc";
		String sql4= "select file.id,username,fileName,fileType,fileSize,uploadTime from file,message where file.messageID=message.Id and fileType in ('jpg','png','jpeg') order by uploadTime desc limit 10";
		String sql5= "select file.id,username,fileName,fileType,fileSize,uploadTime from file,message where file.messageID=message.Id and fileType in ('mp3') order by uploadTime desc limit 10";
		String sql6= "select file.id,username,fileName,fileType,fileSize,uploadTime from file,message where file.messageID=message.Id and fileType in ('mp4','mkv','avi') order by uploadTime desc limit 10";
		String sql="";
		List<MultimediaFile> list = new ArrayList<>();
		try {
			Connection con = DbConnection.getConnection();
			if(type.equals("image")&&method.equals("all")){
				sql=sql1;
			}
			else if(type.equals("audio")&&method.equals("all")){
				sql=sql2;
			}
			else if(type.equals("video")&&method.equals("all")){
				sql=sql3;
			}
			else if(type.equals("image")&&method.equals("top10")){
				sql=sql4;
			}
			else if(type.equals("audio")&&method.equals("top10")){
				sql=sql5;
			}
			else{
				sql=sql6;
			}
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				MultimediaFile file = new MultimediaFile();
				file.setId(rs.getInt("file.id"));
				file.setMessageUsername(rs.getString("username"));
				file.setFileName(rs.getString("fileName"));
				file.setFileType(rs.getString("fileType"));
				file.setFileSize(rs.getString("fileSize"));
				file.setUploadTime(rs.getString("uploadTime"));
				list.add(file);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<MultimediaFile> searchFileByProperty(String user,String value) {
		String sql= "select file.id,username,fileName,fileType,fileSize,uploadTime from file,message where file.messageID=message.Id and username='"+user+"' and fileType in "+value+" order by uploadTime desc";
		List<MultimediaFile> list = new ArrayList<>();
		try {
			Connection con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				MultimediaFile multimediaFile = new MultimediaFile();
				multimediaFile.setId(rs.getInt("file.id"));
				multimediaFile.setMessageUsername(rs.getString("username"));
				multimediaFile.setFileName(rs.getString("fileName"));
				multimediaFile.setFileType(rs.getString("fileType"));
				multimediaFile.setFileSize(rs.getString("fileSize"));
				multimediaFile.setUploadTime(rs.getString("uploadTime"));
				list.add(multimediaFile);
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
	public Boolean deleteMyFile(int id) {
		String sql = "delete from file where id=?";
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
	
}
