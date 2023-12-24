package com.medi.pubmed.journal;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JournalServiceImpl implements JournalService{

	@Autowired
	private JournalDAO journalDao;

	public List<HashMap<String, Object>> getJournalList(HashMap<String, Object> param) {
		int page = 1;
		String page_ ="";
		
		if(param.containsKey("page") || param.get("page") != null) {
			page_ =(String) param.get("page");
			page = Integer.parseInt(page_); //값이 없으면 형변환 중 에러남 
		}
			
		int startPage = 1+(page-1)*10;
		int lastPage = page*10;
			
		param.put("startPage", startPage);
		param.put("lastPage", lastPage);
			
		List<HashMap<String, Object>> list = journalDao.getJournalList(param);
		
		for(HashMap<String, Object> jl : list) {
			
			//SCIE
			String scie_ = String.valueOf(jl.get("scie"));
			String scie = "";
			
			if(scie_ == "X" || scie_.equals("X")) {
				scie = "O";
				
			}else {
				scie = "X";
			}
			//SSCI
			String ssci_ = String.valueOf(jl.get("ssci"));
			String ssci = "";
			
			if(ssci_ == "X" || ssci_.equals("X")) {
				ssci = "O";
				
			}else {
				ssci = "X";
			}
			
			//esci
			String esci_ = String.valueOf(jl.get("esci"));
			String esci = "";
			
			if(esci_ == "X" || esci_.equals("X")) {
				esci = "O";
				
			}else {
				esci = "X";
			}

			
			//issn
			String issn_ = String.valueOf(jl.get("issn"));
			String issn = "";
			
			if(issn_==null || issn_.equals("")) {
				issn = "N/A";
			}else {
				issn = issn_;
			}
			
			jl.put("scie", scie);
			jl.put("ssci", ssci);
			jl.put("issn", issn);
			
		}
		
		//출력 확인
		System.out.println("service_field : " + param.get("field"));
		System.out.println("service_spage : " + param.get("startPage"));
		System.out.println("service_lpage : " + param.get("lastPage"));
		
		return list;
	}
	
	public int getJournalCount(HashMap<String, Object> param) {
		return journalDao.getJournalCount(param);
	}
	
	
}
