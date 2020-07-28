package com.fnt.model.biz;

import java.util.List;

import com.fnt.model.dto.AlertDto;

public interface AlertBiz {
	public int insertAlert(AlertDto alertdto);
	public List<AlertDto> AlertList(String memberid);
	public int updateAlert(int dboardno);
}
