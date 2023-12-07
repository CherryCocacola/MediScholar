package com.medi.pubmed.journal;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface JournalDao {
	List<HashMap<String, Object>> getJournalList(HashMap<String, Object> param);
}
