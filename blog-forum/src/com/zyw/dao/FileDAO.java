package com.zyw.dao;

import java.util.List;

import com.zyw.vo.MultimediaFile;

public interface FileDAO {
	//上传文件
	public Boolean addFile(MultimediaFile file);
	
	//通过ID查询文件内容
	public MultimediaFile searchByID(int id);
	
	//按照文件类型查询全部上传的文件
	public List<MultimediaFile> searchFileByType(String type,String method);
	
	//查看我的多媒体文件
	public List<MultimediaFile> searchFileByProperty(String user,String value);
	
	//删除文件
	public Boolean deleteMyFile(int id);
}
