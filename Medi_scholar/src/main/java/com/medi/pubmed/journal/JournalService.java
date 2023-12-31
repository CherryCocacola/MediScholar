package com.medi.pubmed.journal;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

public interface JournalService {
	
	List<HashMap<String, Object>> getJournalList(HashMap<String, Object> param);

	int getJournalCount(HashMap<String, Object> param);

	HashMap<String, Object> getJournalDetail(HashMap<String, Object> param);

	HashMap<String, Object> getJournalImpact(HashMap<String, Object> param);

	List<HashMap<String, Object>> getChartData(HashMap<String, Object> param);

}
