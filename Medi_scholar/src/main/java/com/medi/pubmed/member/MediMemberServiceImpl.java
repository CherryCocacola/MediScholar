package com.medi.pubmed.member;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MediMemberServiceImpl implements MediMemberService{

	@Autowired
	private MediMemberDAO medimemberdao;
	
	@Override
	//사용자정보
	public HashMap<String, Object> getUserInfo(HashMap<String, Object> param) {
		return medimemberdao.getUserInfo(param);
	}

	@Override
	public void insertUserInfo(HashMap<String, Object> param) {
		medimemberdao.insertUserInfo(param);
	}

	@Override
	public int checkEmailExistsForToken(String email) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public HashMap<String, Object> googleUserInfo(HashMap<String, Object> param) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<HashMap<String, Object>> getpriList(HashMap<String, Object> param) {
		return medimemberdao.getpriList(param);
	}

	@Override
	public List<HashMap<String, Object>> getnation(HashMap<String, Object> param) {
		return null;
	}

	@Override
	public List<HashMap<String, Object>> getjob(HashMap<String, Object> param) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<HashMap<String, Object>> getsignList(String primary) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int isUserIdDuplicate(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}
}
