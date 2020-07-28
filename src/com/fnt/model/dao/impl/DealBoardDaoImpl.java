package com.fnt.model.dao.impl;
import static com.fnt.model.dao.SqlMapConfig.getSqlSessionFactory;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.fnt.model.dao.DealBoardDao;
import com.fnt.model.dto.DealBoardDto;
import com.fnt.model.dto.QnaBoardDto;
import com.fnt.util.Paging;

import sun.security.ec.ECDHKeyAgreement;

public class DealBoardDaoImpl implements DealBoardDao{

	private String namespace = "dealboardmapper.";
	
	
	@Override
	public List<DealBoardDto> selectSaleList(Paging paging) {
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum();
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		SqlSession session = null;
		List<DealBoardDto> list = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"selectsalelist", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		
		return list;
	}
	
	@Override
	public List<DealBoardDto> selectBuylist(Paging paging) {
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum();
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		SqlSession session = null;
		List<DealBoardDto> list = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"selectbuylist", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		
		return list;
	}

	@Override
	public int insertBuyBoard(DealBoardDto dto) {
		SqlSession sqlsession = null;
		int res = 0;
		try {
			sqlsession = getSqlSessionFactory().openSession(false);
			res = sqlsession.insert(namespace+"insertbuyboard",dto);
			if(res > 0) {
				sqlsession.commit();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlsession.close();
		}
		
		return res;
	}

	@Override
	public int insertSaleBoard(DealBoardDto dto) {
		SqlSession sqlsession = null;
		
		int res = 0;
		try {
			sqlsession = getSqlSessionFactory().openSession(false);
			res = sqlsession.insert(namespace+"insertsaleboard",dto);
			
	
			if(res > 0) {
				sqlsession.commit();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlsession.close();
		}
		return res;
	}

	@Override
	public DealBoardDto selectDetail(int dboardno) {
		SqlSession sqlsession = null;
		DealBoardDto dto = null;
		
		try {
			sqlsession = getSqlSessionFactory().openSession(false);
			dto = sqlsession.selectOne(namespace+"selectdetail",dboardno);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlsession.close();
		}
		
		return dto;
	}

	@Override
	public int deleteDealBoard(int dboardno) {
		SqlSession sqlsession = null;
		int res = 0;
		try {
			sqlsession = getSqlSessionFactory().openSession(false);
			res = sqlsession.delete(namespace+"deletedealboard",dboardno);
			
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
	public int updateDealBoard(DealBoardDto dto) {
		SqlSession sqlsession = null;
		int res = 0;
		try {
			sqlsession = getSqlSessionFactory().openSession(false);
			res = sqlsession.update(namespace+"updatedealboard",dto);
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

	public int getAllCount() {
		SqlSession session = null;
		int count = 0;

		try {
			session = getSqlSessionFactory().openSession(false);
			count = session.selectOne(namespace + "count");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}

		return count;
	}
	
	public int getAllCountS() {
		SqlSession session = null;
		int count = 0;

		try {
			session = getSqlSessionFactory().openSession(false);
			count = session.selectOne(namespace + "counts");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}

		return count;
	}
	
	//통합검색 리스트로 출력
	@Override
	public List<DealBoardDto> searchList(String searchdeal,Paging paging){
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum();
		Map<String, Object> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("searchdeal", searchdeal);
		
		SqlSession session = null;
		List<DealBoardDto> list = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"searchdeal", map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public List<DealBoardDto> ascorder(String searchdeal) {
		SqlSession session = null;
		List<DealBoardDto> list = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"ascorder",searchdeal);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public List<DealBoardDto> desccate(String searchdeal, String categorylist) {
		SqlSession session = null;
		List<DealBoardDto> list = null;
		Map<String,Object> map = new HashMap<>();
		map.put("searchdeal",searchdeal );
		map.put("categorylist", categorylist );
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"desccategory", map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public List<DealBoardDto> asccate(String searchdeal, String categorylist) {
		SqlSession session = null;
		List<DealBoardDto> list = null;
		Map<String,Object> map = new HashMap<>();
		map.put("searchdeal",searchdeal );
		map.put("categorylist", categorylist );
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"asccategory", map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return list;
	
	}

	@Override
	public List<DealBoardDto> buysearchList(String categorylist, Paging paging) {
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum();
		Map<String, Object> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("categorylist", categorylist);
		System.out.println("startNum" + startNum);
		System.out.println("endNum" + endNum);
		
		SqlSession session = null;
		List<DealBoardDto> list = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"buycategorylist",map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public int buyGetAllCount(String categorylist) {
		SqlSession session = null;
		int count = 0;

		try {
			session = getSqlSessionFactory().openSession(false);
			count = session.selectOne(namespace + "buycount",categorylist);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}

		return count;
	}

	@Override
	public List<DealBoardDto> searchdealtitle(String search, Paging paging) {
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum();
		Map<String, Object> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("search", search);
		System.out.println("startNum" + startNum);
		System.out.println("endNum" + endNum);
		
		SqlSession session = null;
		List<DealBoardDto> list = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace + "searchdealtitle",map);
			System.out.println("여기까진 왓니?");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<DealBoardDto> searchdealwriter(String search) {
		SqlSession session = null;
		List<DealBoardDto> list = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace + "searchdealwriter",search);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<DealBoardDto> salesearchList(String categorylist, Paging paging) {
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum();
		Map<String, Object> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("categorylist", categorylist);
		System.out.println("startNum" + startNum);
		System.out.println("endNum" + endNum);
		
		SqlSession session = null;
		List<DealBoardDto> list = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"salecategorylist",map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public List<DealBoardDto> salesearchtitle(String salesearch) {
		SqlSession session = null;
		List<DealBoardDto> list = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"saletitle",salesearch);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<DealBoardDto> salesearchnick(String salesearch) {
		SqlSession session = null;
		List<DealBoardDto> list = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"salenick",salesearch);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}

	@Override

	public List<DealBoardDto> popNick(String dnickname) {
		SqlSession session = null;
		List<DealBoardDto> list = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"salepopnick",dnickname);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;

	public int getAllCountsearch(String searchdeal) {
		SqlSession session = null;
		int count = 0;

		try {
			session = getSqlSessionFactory().openSession(false);
			count = session.selectOne(namespace + "countsearch",searchdeal);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}

		return count;
	}

	@Override
	public int saleGetAllCount(String categorylist) {
		SqlSession session = null;
		int count = 0;

		try {
			session = getSqlSessionFactory().openSession(false);
			count = session.selectOne(namespace + "salecount",categorylist);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}

		return count;
	}

	@Override
	public int buysearchAllCount(String search) {
		SqlSession session = null;
		int count = 0;

		try {
			session = getSqlSessionFactory().openSession(false);
			count = session.selectOne(namespace + "buysearchcount",search);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}

		return count;
	}

	}
	
	
	

	

