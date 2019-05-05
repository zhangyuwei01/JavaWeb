package com.zyw.dao;

import com.zyw.vo.Message;

public interface MessageDAO {
	//根据用户名判断用户是否重名
	public Boolean usernameRepeat(String username);
	
	//注册
	public Boolean register(Message message);
	
	//根据用户名查询用户信息
	public Message query(String username);
	
	//更新消息
	public Boolean update(Message message);
}
