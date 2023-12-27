package com.medi.pubmed.board;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommunityServiceImpl implements CommunityService{

	@Autowired
	private CommunityDAO communityDao;
	
	@Override
	public List<HashMap<String, Object>> getCommunityList(HashMap<String, Object> param) {
		
		int page = 1;
		String page_ ="";
		
		if(param.containsKey("page") || param.get("page") != null) {
			page_ = (String) param.get("page");
			page = Integer.parseInt(page_);
		}
			
		int startPage = 1+(page-1)*10;
		int lastPage = page*10;
			
		param.put("startPage", startPage);
		param.put("lastPage", lastPage);
		
		List<HashMap<String, Object>> list = communityDao.getCommunityList(param);
		
		for(HashMap<String, Object> cl : list) {
			String title_ = (String) cl.get("title");
			String title = "";
			
			String jnlnm_ = (String) cl.get("jnlnm");
			String jnlnm = "";
			
			if(title_ == null || title_ == "") {
				title = "제목 없음";
			}else {
				title = title_;
			}
			
			if(jnlnm_ == null || jnlnm_ == "") {
				jnlnm = "관련 저널 없음";
			}else {
				jnlnm = jnlnm_;
			}
			
			cl.put("title", title);
			cl.put("jnlnm", jnlnm);
			
		}
		System.out.println("service_spage : " + param.get("startPage"));
		System.out.println("service_lpage : " + param.get("lastPage"));
		
		return list;
	}
	
	@Override
	public int getCommunityCount(HashMap<String, Object> param) {
		return communityDao.getCommunityCount(param);
	}
	
	@Override
	public void insertCommunity(HashMap<String, Object> param) {
		communityDao.insertCommunity(param);
		
	}
	
	@Override
	public HashMap<String, Object> detailCommunity(HashMap<String, Object> param) {
		return communityDao.detailCommunity(param);
	}
	
	@Override
	public int updateCommunity(HashMap<String, Object> param) {
		return communityDao.updateCommunity(param);
	}
	
	@Override
	public void insertReply(HashMap<String, Object> param) {
		 communityDao.insertReply(param);
	}
	
	@Override
	public void deleteReply(HashMap<String, Object> param) {
		communityDao.deleteReply(param);
	}
	
	@Override
	public void insertSubreply(HashMap<String, Object> param) {
		communityDao.insertSubreply(param);
	}

	@Override
	public int delCommunity(Integer id) {
		return communityDao.deleteCommunity(id);
	}

	@Override
	public List<HashMap<String, Object>> getReplyList(HashMap<String, Object> param) {
		return communityDao.getReplyList(param);
	}
	
	@Override
	public int getReplyCount(HashMap<String, Object> param) {
		return communityDao.getReplyCount(param);
	}
	
}
