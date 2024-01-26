package com.medi.base.mapper;

import java.util.List;

import com.medi.base.vo.XlsxData;

public interface XlsxMapper {
	
	public void xlsxtoDB(XlsxData data) throws Exception;
	
	public List<XlsxData> getData() throws Exception;

}
