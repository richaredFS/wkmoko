package com.chenzi.home.dao;

import java.util.List;
import com.chenzi.admin.vo.User;

public interface IUserDAO {
	public List getLimitUser();
	
	public int userInsert(User user);
	
	public User validateUser(String username,String password);

	public User getUserByuserid(int userid);
	
	public int userUpdate(User user);
	
	public int getTotalUser();
	public List getUserPaging(Integer currentPage, int pageSize);	
	
	public int userUpdateImg(User user);
	
	public String getUserheadimgByuserid(Integer userid);
}
