package com.fnt.model.dao.impl;

import com.fnt.model.dao.InvoiceDao;
import static com.fnt.model.dao.SqlMapConfig.getSqlSessionFactory;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public class InvoiceDaoImpl implements InvoiceDao {
	
	private String namespace = "orderlistmapper.";

	@Override
	public int updateinvoice(String invoice, String memberid,int olboardno) {
		SqlSession session = null;
		int updateinvoice = 0;
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("invoice", invoice);
		map.put("memberid", memberid);
		map.put("olboardno", olboardno);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			updateinvoice = session.update(namespace + "updateinvoice", map);
			
			if(updateinvoice > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return updateinvoice;
	}

}
