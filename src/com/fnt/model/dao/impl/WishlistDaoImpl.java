package com.fnt.model.dao.impl;

import static com.fnt.model.dao.SqlMapConfig.getSqlSessionFactory;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.fnt.model.dao.WishlistDao;
import com.fnt.model.dto.WishlistDto;

public class WishlistDaoImpl implements WishlistDao {
	private String namespace = "wishlistmapper.";
	
	
	@Override
	public int insertWishlist(WishlistDto wishlistdto) {
		SqlSession sqlsession = null;
		int res = 0;
		
		try {
			sqlsession = getSqlSessionFactory().openSession(false);
			res = sqlsession.insert(namespace+"insertwishlist",wishlistdto);
			
			if(res > 0) {
				sqlsession.commit();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlsession.close();
		}
		
		return res;
	}


	@Override
	public int deleteWishlist(int wlno) {
		SqlSession sqlsession = null;
		int res = 0;
			
			try {
				sqlsession = getSqlSessionFactory().openSession(false);
				res = sqlsession.insert(namespace+"deletewishlist",wlno);
				
				if(res > 0) {
					sqlsession.commit();			
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlsession.close();
		}
		return res;
	}


	@Override
	public WishlistDto selectOneWishlist(String memberid, String wlsellnickname, int wlboardno) {
		SqlSession sqlsession = null;
		WishlistDto wishlistdto = null;
		
			try {
				sqlsession = getSqlSessionFactory().openSession(false);
				Map<String,Object> map = new HashMap<>();
				map.put("wlid",memberid);
				map.put("wlsellnickname",wlsellnickname);
				map.put("wlboardno",wlboardno);
				
				wishlistdto = sqlsession.selectOne(namespace+"selectOnewishlist",map);
				
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				sqlsession.close();
			}
		
		return wishlistdto;
	}


	@Override
	public int selectOneWishlistBymemberid(String memberid, String wlsellnickname, int wlboardno) {
		SqlSession sqlsession = null;
		int res = 0;
			try {
				sqlsession = getSqlSessionFactory().openSession(false);
				Map<String,Object> map = new HashMap<>();
				map.put("wlid",memberid);
				map.put("wlsellnickname",wlsellnickname);
				map.put("wlboardno",wlboardno);
				
				res = sqlsession.selectOne(namespace+"selectOneWishlistBymemberid",map);
				
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				sqlsession.close();
			}
				
		
		return res;
	}
	
}
