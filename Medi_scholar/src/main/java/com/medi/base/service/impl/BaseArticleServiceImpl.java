package com.medi.base.service.impl;

import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.medi.base.mapper.BaseArticleMapper;
import com.medi.base.service.BaseArticleService;
import com.medi.base.vo.ArticleVO;
import com.medi.base.vo.PmidVO;

@Service
public class BaseArticleServiceImpl implements BaseArticleService{

	@Autowired
	private BaseArticleMapper articleMapper;
	private final ObjectMapper objectMapper = new ObjectMapper();

	@Override
	public List<PmidVO> loadPMIDsFromJsonFile(String jsonFilePath) throws Exception {
		return objectMapper.readValue(Paths.get(jsonFilePath).toFile(), new TypeReference<List<PmidVO>>() {
		});
	}

	@Override
	public void insertAbbstoPMID(List<PmidVO> pvoList) throws Exception {
		for (PmidVO pvo : pvoList) {
			articleMapper.insertAbbstoPMID(pvo);
		}
	}

	@Override
	public List<HashMap<String, Object>> selectPMID() throws Exception {
		return articleMapper.selectPMID();
	}

	@Override
	public List<ArticleVO> loadAbstractFromJsonFile(String jsonFilePath) throws Exception {
		return objectMapper.readValue(Paths.get(jsonFilePath).toFile(), new TypeReference<List<ArticleVO>>() {
		});
	}

	@Override
	public void insertAbstract(List<ArticleVO> articleList) throws Exception {
		for (ArticleVO article : articleList) {
			articleMapper.insertArticles(article);
		}
	}
}
