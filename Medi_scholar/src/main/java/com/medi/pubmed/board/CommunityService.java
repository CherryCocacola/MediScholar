package com.medi.pubmed.board;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

public interface CommunityService {
	
	List<HashMap<String, Object>> getCommunityList(HashMap<String, Object> param);

}
