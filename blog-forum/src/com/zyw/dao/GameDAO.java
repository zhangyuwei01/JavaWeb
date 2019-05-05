package com.zyw.dao;


import java.util.List;

import com.zyw.vo.Luck;

public interface GameDAO {
	//插入抽奖记录
	public Boolean choujiang(Luck luck);
	//查询抽奖记录
	public List<Luck> selectChouJiang();

}
