package com.medi.pubmed.member;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MediMemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//사용자 정보
		public HashMap<String, Object> getUserInfo(HashMap<String, Object> param) {
			return sqlSession.selectOne("getUserInfo", param);
		}
		
		//관심분야 주
		public List<HashMap<String, Object>> getpriList(HashMap<String, Object> param) {
			return sqlSession.selectList("getpriList", param);
		}
		//회원가입
		public int insertUserInfo(HashMap<String, Object> param) {
			return sqlSession.insert("insertUserInfo",param);
			
		}
		//디비에 이메일 유무확인
		public int checkEmailExistsForToken(String email) {
			return sqlSession.selectOne("checkEmailExistsForToken",email);
			
		}
		//나라
		public List<HashMap<String, Object>> getnation(HashMap<String, Object> param) {
			return sqlSession.selectList("getnation",param);
		}
		//직업
		public List<HashMap<String, Object>> getjob(HashMap<String, Object> param) {
			return sqlSession.selectList("getjob",param);
		}
		//세부분야
		public List<HashMap<String, Object>> getsignList(String primary) {
			return sqlSession.selectList("getsignList",primary);
		}
		//아이디check
		public int isUserIdDuplicate(String userId) {
			return sqlSession.selectOne("isUserIdDuplicate",userId);
		}
	}
