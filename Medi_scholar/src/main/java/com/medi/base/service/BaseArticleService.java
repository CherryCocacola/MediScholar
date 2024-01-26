package com.medi.base.service;

import java.util.HashMap;
import java.util.List;

import com.medi.base.vo.ArticleVO;
import com.medi.base.vo.PmidVO;

public interface BaseArticleService {
	
	List<PmidVO> loadPMIDsFromJsonFile(String jsonFilePath) throws Exception;
	void insertAbbstoPMID(List<PmidVO> pvoList) throws Exception;
	
	List<HashMap<String, Object>> selectPMID() throws Exception;
	
	List<ArticleVO> loadAbstractFromJsonFile(String jsonFilePath) throws Exception;
    void insertAbstract(List<ArticleVO> articleList) throws Exception;

}
