package com.medi.base.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.medi.base.service.BaseJournalService;
import com.medi.base.service.XlsxService;

@RequestMapping("/base/*")

@Controller
public class BaseController {
	
	@Autowired
	private XlsxService service;

	@Autowired
	private BaseJournalService journalService;
	
	@GetMapping("/admin")
	public String main() {
		return "admin";
	}
	
	@PostMapping("/upload")
	public ResponseEntity<String> uploadXlsx(@RequestParam("file") MultipartFile file) {
		try {
			service.xlsxtoDB(file);
			return ResponseEntity.status(HttpStatus.FOUND).header(HttpHeaders.LOCATION, "/main").build();
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("실패");
		}
	}	
	
	@GetMapping("/journal")
	public String manageJournal(Model model) {
		int count = journalService.getCountMaster();
		model.addAttribute("count", count);
		return "journals";
	}
	
	@GetMapping("/article")
	public String manageArticle(Model model) {
		return "articles";
	}


}
