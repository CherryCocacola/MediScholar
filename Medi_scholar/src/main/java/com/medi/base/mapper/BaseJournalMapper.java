package com.medi.base.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.medi.base.vo.JournalVO;

@Mapper
public interface BaseJournalMapper {

	List<HashMap<String, Object>> selectISSNfromMaster();
	
	int getCountMaster();
	
	void insertJournals(JournalVO journalVO);
	
	List<HashMap<String, Object>> selectNlmTitleAbbreviations();

}
