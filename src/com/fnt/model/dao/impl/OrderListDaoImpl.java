package com.fnt.model.dao.impl;

import static com.fnt.model.dao.SqlMapConfig.getSqlSessionFactory;

import org.apache.ibatis.session.SqlSession;

import com.fnt.model.dao.OrderListDao;
import com.fnt.model.dto.OrderlistDto;

public class OrderListDaoImpl implements OrderListDao {
	private String namespace = "orderlistmapper.";
	@Override
	public int insert(OrderlistDto dto) {
		SqlSession session = null;
		int res = 0;

		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace + "insert", dto);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}


}
