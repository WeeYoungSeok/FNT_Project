package com.fnt.model.dao.impl;

import com.fnt.model.dao.LoginCrudDao;
import com.fnt.model.dto.MemberDto;

import static com.fnt.model.dao.SqlMapConfig.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.apache.ibatis.session.SqlSession;
public class LoginCrudDaoImpl implements LoginCrudDao {

	private String namespace = "logincrud.";
	
	public MemberDto login(String memberid, String memberpw) {
		SqlSession session = null;
		MemberDto dto = null;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("memberid", memberid);
		map.put("memberpw", memberpw);
		try {
			session = getSqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace+"selectmemberbyidandpw",map);
			if(dto != null) {
				session.commit();
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		
		return dto;
	}
	
	
	
	 
	//id 분실시 id찾기
	public MemberDto searchId(String membername, String memberemail) {
		SqlSession session = null;
		MemberDto dto = null;
		
		Map<String, String> map = new HashMap<String, String>();
   		map.put("membername", membername);
		map.put("memberemail", memberemail);
		
		
		try {
			session = getSqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace+"searchid",map);
			
			if(dto != null) {
				session.commit();
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return dto;
	}
	//pw 분실 시 pw 찾기
	public MemberDto searchPw(String memberid, String membername, String memberemail) {
		SqlSession session = null;
		MemberDto dto = null;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("memberid", memberid);
		map.put("membername", membername);
		map.put("memberemail", memberemail);
		
		
		try {
			session = getSqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace+"searchpw", map);
			
			if(dto != null) {
				session.commit();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		
		return dto;
	}
	
	//마이페이지에서 내정보 보기 누를 때 내 정보 리스트 출력하기
	public MemberDto selectOne(String memberid){
		SqlSession session = null;
		MemberDto dto = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace+"mypagelist",memberid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		
		return dto;
	}
	
	//마이페이지에서 개인정보 수정하기
	public int update(MemberDto dto) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace+"mypageupdate",dto);
			
			if(res > 0) {
				session.commit();
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res;
		
	}
	
	//탈퇴하기를 눌렀을 때, enabled를 update
	public int updateoutmember(MemberDto dto) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace+"updateoutmember",dto);
			
			if(res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res;
	}
	
	//email로 id 찾기
	public MemberDto findId(String memberemail, String membername) {
		SqlSession session = null;
		MemberDto dto = null;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("memberemail", memberemail);
		map.put("membername", membername);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace+"findid",map);
			if(dto != null) {
				session.commit();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		
		return dto;
	}
	//id와 email로 pw 찾기(pwchk도 같이...)
	public MemberDto findPw(String memberid, String memberemail) {
		SqlSession session = null;
		MemberDto dto = null;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("memberid", memberid);
		map.put("memberemail", memberemail);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace+"findpw", map);
			if(dto != null) {
				session.commit();
			}
					
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return dto;
	}
	
	public int updatepw(String memberpw, String memberpwchk, String memberid) {
		SqlSession session = null;
		int res = 0;
		Map<String, String> map = new HashMap<String, String>();
		map.put("memberpw", memberpw);
		map.put("memberpwchk", memberpwchk);
		map.put("memberid", memberid);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace+"updatepw", map);
			
			if(res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return res;
	}


	@Override
	public MemberDto receivenickname(String membernickname) {
		SqlSession session = null;
		MemberDto receivenickname = null;
		
		
		try {
			session = getSqlSessionFactory().openSession(false);
			receivenickname = session.selectOne(namespace+"receivenickname",membernickname);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return receivenickname;
	}




	@Override
	public int reportinsert(String membernickname, String reporttitle, String reportcontent, String receiveid,
		String sendid, String sendnickname) {
		SqlSession session = null;
		int res = 0;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("membernickname", membernickname);
		map.put("reporttitle", reporttitle);
		map.put("reportcontent", reportcontent);
		map.put("receiveid", receiveid);
		map.put("sendid", sendid);
		map.put("sendnickname", sendnickname);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace+"insertreport", map);
			
			if(res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
 		} finally {
 			session.close();
 		}
		return res;
	}




	@Override
	public String selectAccountNumberByNickname(String membernickname) {
		SqlSession session = null;
		String accountNumber = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			accountNumber = session.selectOne(namespace+"selectAccountNumberByNickname", membernickname);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.close();
		}
	
		return accountNumber;
	}
	
	public MemberDto kakaoLogin(String email) {
		SqlSession session = null;
		MemberDto memberdto = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			memberdto = session.selectOne(namespace + "kakao", email);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return memberdto;
	}




	
	
	

}
