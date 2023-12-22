package com.medi.pubmed.board;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommunityServiceImpl implements CommunityService{

	@Autowired
	private CommunityDAO communityDao;

	public List<HashMap<String, Object>> getCommunityList(HashMap<String, Object> param) {
		return communityDao.getCommunityList(param);
	}
}
