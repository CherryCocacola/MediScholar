package com.medi.pubmed.board;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CommunityDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<HashMap<String, Object>> getCommunityList(HashMap<String, Object> param){
		return sqlSession.selectList("getCommunityList", param); 
	}
	
	
	public List<HashMap<String, Object>> getReplyList(HashMap<String, Object> param){
		return sqlSession.selectList("getReplyList", param); 
	}
	
	public Integer getCommunityCount(HashMap<String, Object> param){
		return sqlSession.selectOne("getCommunityCount", param); 
	}

	public void insertCommunity(HashMap<String, Object> param) {
		sqlSession.insert("insertCommunity",param);
		
	}

	public HashMap<String, Object> detailCommunity(HashMap<String, Object> param) {
		
		return sqlSession.selectOne("detailCommunity",param);
	}

	public int updateCommunity(HashMap<String, Object> param) {
		
		return sqlSession.update("updateCommunity",param);
	}

	public void insertReply(HashMap<String, Object> param) {
		
		sqlSession.selectOne("insertReply",param);
	}

	public void deleteReply(HashMap<String, Object> param) {
		sqlSession.selectOne("deleteReply",param);
		
	}

	public void insertSubreply(HashMap<String, Object> param) {
		
		sqlSession.selectOne("insertSubreply",param);
	}

	public int deleteCommunity(Integer id) {
		return sqlSession.delete("deleteCommunity",id);
	}

	public int getReplyCount(HashMap<String, Object> param) {
		return sqlSession.selectOne("getReplyCount", param);
	}


}