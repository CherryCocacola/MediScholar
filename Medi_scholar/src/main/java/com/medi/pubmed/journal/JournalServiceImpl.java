package com.medi.pubmed.journal;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JournalServiceImpl implements JournalService {

	@Autowired
	private JournalDAO journalDao;

	public List<HashMap<String, Object>> getJournalList(HashMap<String, Object> param) {
		int page = 1;
		String page_ = "";

		if (param.containsKey("page") || param.get("page") != null) {
			page_ = (String) param.get("page");
			page = Integer.parseInt(page_); // 값이 없으면 형변환 중 에러남
		}

		int startPage = 1 + (page - 1) * 10;
		int lastPage = page * 10;

		param.put("startPage", startPage);
		param.put("lastPage", lastPage);

		List<HashMap<String, Object>> list = journalDao.getJournalList(param);

		for (HashMap<String, Object> jl : list) {

			// SCIE
			String scie_ = String.valueOf(jl.get("scie"));
			String scie = "";

			if (scie_ == "X" || scie_.equals("X")) {
				scie = "O";

			} else {
				scie = "X";
			}
			// SSCI
			String ssci_ = String.valueOf(jl.get("ssci"));
			String ssci = "";

			if (ssci_ == "X" || ssci_.equals("X")) {
				ssci = "O";

			} else {
				ssci = "X";
			}

			// esci
			String esci_ = String.valueOf(jl.get("esci"));
			String esci = "";

			if (esci_ == "X" || esci_.equals("X")) {
				esci = "O";

			} else {
				esci = "X";
			}

			// issn
			String issn_ = String.valueOf(jl.get("issn"));
			String issn = "";

			if (issn_ == null || issn_.equals("")) {
				issn = "N/A";
			} else {
				issn = issn_;
			}
			jl.put("scie", scie);
			jl.put("ssci", ssci);
			jl.put("esci", esci);
			jl.put("issn", issn);
			
		}
		return list;
	}

	public int getJournalCount(HashMap<String, Object> param) {
		return journalDao.getJournalCount(param);
	}

	public HashMap<String, Object> getJournalDetail(HashMap<String, Object> param) {
		return journalDao.getJournalDetail(param);
	}

	public HashMap<String, Object> getJournalImpact(HashMap<String, Object> param) {
		return journalDao.getJournalImpact(param);
	}

	@Override
	public List<HashMap<String, Object>> getChartData(HashMap<String, Object> param) {
		int selectedMonth = Integer.parseInt((String) param.get("month"));
		// 모든 데이터 정의
		List<HashMap<String, Object>> allData = new ArrayList<>();
		allData.addAll(createMonthlyData(10, new int[] { 1902, 2301, 2351, 6742, 231, 3245, 12031 }, new String[] {
				"cancer", "covid19", "skin disease", "smoke", "Upset stomach", "operation", "research" }));
		allData.addAll(createMonthlyData(11, new int[] { 2354, 1111, 3546, 123, 4567, 2154, 3215},
				new String[] { "cancer", "covid19", "critical", "smoke", "Upset stomach", "operation", "research" }));
		allData.addAll(createMonthlyData(12, new int[] { 2354, 1111, 3546, 123, 4567, 3215 },
				new String[] { "surgery", "flu", "critical", "smoke", "Upset stomach", "research" }));
		allData.addAll(createMonthlyData(9, new int[] { 500, 1000, 1500, 2000, 3000, 5000, 10000, 15000, 20000},
				new String[] { "surgery", "flu", "critical", "smoke", "Upset stomach", "research", "nursing", "critical care", "medicine"}));

		// 선택된 월에 해당하는 데이터 필터링
		List<HashMap<String, Object>> filteredData = new ArrayList<>();
		for (HashMap<String, Object> data : allData) {
			if ((int) data.get("month") == selectedMonth) {
				filteredData.add(data);
			}
		}
		return filteredData;
	}

	// 월별 데이터 생성을 위한 도우미 메서드
	private List<HashMap<String, Object>> createMonthlyData(int month, int[] counts, String[] keywords) {
		List<HashMap<String, Object>> monthlyData = new ArrayList<>();
		for (int i = 0; i < counts.length; i++) {
			HashMap<String, Object> dataItem = new HashMap<>();
			dataItem.put("keyword", keywords[i]);
			dataItem.put("count", counts[i]);
			dataItem.put("month", month);
			monthlyData.add(dataItem);
		}
		return monthlyData;
	}
}
