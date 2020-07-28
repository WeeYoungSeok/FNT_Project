package com.fnt.model.dao;

import java.util.List;

import com.fnt.model.dto.AlertDto;

public interface AlertDao {
	public int insertAlert(AlertDto alertdto);
	public List<AlertDto> AlertList(String memberid);
	public int updateAlert(int dboardno);
}
