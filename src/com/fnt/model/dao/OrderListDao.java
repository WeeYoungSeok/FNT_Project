package com.fnt.model.dao;

import com.fnt.model.dto.OrderlistDto;

public interface OrderListDao {
	public int insert(OrderlistDto dto);
	
	public String selectInvoiceByBoardno(int boardno);
	
}
