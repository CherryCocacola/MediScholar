package com.medi.pubmed.board;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/content/*")
@Controller
public class CommunityController {

	@Autowired
	private CommunityService communitySvc;
	//저널 목록 조회
	@GetMapping("list")
	public String getJournalList(@RequestParam HashMap<String, Object> param, HttpServletRequest req, ModelMap modelmap) {
		
		List<HashMap<String, Object>>jl = communitySvc.getCommunityList(param);
		
		return ("community/boardList");
	}
}
