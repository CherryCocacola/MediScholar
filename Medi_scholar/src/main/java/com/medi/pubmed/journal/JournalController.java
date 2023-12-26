package com.medi.pubmed.journal;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/journal/*")
@Controller
public class JournalController {

	@Autowired
	private JournalService journalSvc;

	@GetMapping("journallist")
	public String getJournalList(@RequestParam HashMap<String, Object> param, HttpServletRequest req, ModelMap modelmap) {
		
		List<HashMap<String, Object>> jList = journalSvc.getJournalList(param);
		int count = journalSvc.getJournalCount(param);
		
		modelmap.addAttribute("journal", jList);
		modelmap.addAttribute("count", count);
		
		return ("journal/journalSearch");
	}
	
	@GetMapping("journaldetail")
	public String getJournalDetail(@RequestParam HashMap<String, Object> param, @RequestParam String id, HttpServletRequest request, ModelMap modelmap) {
		
		//기본 연도값을 2022으로 둔다
		if (!param.containsKey("year") || param.get("year") == null) {
			param.put("year", "2022");
		}

		String syear = param.get("year").toString();
		
		HashMap<String, Object> dList = journalSvc.getJournalDetail(param);
		HashMap<String, Object> dImpact = journalSvc.getJournalImpact(param);

		modelmap.addAttribute("detail", dList);
		modelmap.addAttribute("year", syear);
		modelmap.addAttribute("impact", dImpact);

		//impact.js 참고
	    // AJAX 요청이면 impact 보여주는 표만 갱신한다
	    if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
	    	//jnldetaildiv을 journaldetailyear.jsp라는 이름으로 파일을 따로 만들고 보여줌
	        return "journal/journalImpact"; 
	    }
	    return "journal/journalDetail";
	}
	
}
