package com.medi.pubmed.member;

import java.util.HashMap;
import java.util.List;

public interface MediMemberService {
	//사용자 정보 조회
	HashMap<String, Object> getUserInfo(HashMap<String, Object> param); 
	//사용자 정보 입력
	void insertUserInfo(HashMap<String, Object> param) ;
	//구글을 통한 로그인 시 회원 가입 여부
	int checkEmailExistsForToken(String email);
	//구글을 통한 로그인 시 회원 가입한 사용자의 사용자 정보 조회
	HashMap<String, Object> googleUserInfo(HashMap<String, Object> param);
	//관심 주분야 목록 조회
	List<HashMap<String, Object>> getpriList(HashMap<String, Object> param);

	List<HashMap<String, Object>> getnation(HashMap<String, Object> param);

	List<HashMap<String, Object>> getjob(HashMap<String, Object> param);

	List<HashMap<String, Object>> getsignList(String primary);

	int isUserIdDuplicate(String userId);
}
