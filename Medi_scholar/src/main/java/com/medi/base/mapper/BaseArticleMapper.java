package com.medi.base.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.medi.base.vo.ArticleVO;
import com.medi.base.vo.PmidVO;

@Mapper
public interface BaseArticleMapper {

	void insertAbbstoPMID(PmidVO pvo);

	List<HashMap<String, Object>> selectPMID();
	void insertArticles(ArticleVO articleVO);
	
}
