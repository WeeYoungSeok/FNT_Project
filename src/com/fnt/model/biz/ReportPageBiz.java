package com.fnt.model.biz;

import java.util.List;

import com.fnt.model.dto.ReportDto;

public interface ReportPageBiz {
	public List<ReportDto> selectList();
	public ReportDto selectOne(int reportno);
}
