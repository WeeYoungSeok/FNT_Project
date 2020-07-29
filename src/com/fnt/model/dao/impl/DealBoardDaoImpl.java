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
			System.out.println("dto잘 들어옴? "+dto);
			System.out.println("mapper 잘 진행했지? res는? "+res);
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
			e.printStackTrace();
		} finally {
			session.close();
		}

		return count;
	}
	
	//통합검색 리스트로 출력 (페이징 출력)
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

	//통합검색 asc 출력 (오래된 순)
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

	//통합검색 desc 출력 + 카테고리 (최근순)
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

	//통합검생 asc 출려 + 카테고리 (오래된 순)
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

	//구매 게시판 카테고리 리스트 페이징 적용
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

	//구매 게시판 카테고리 페이징 카운트 수
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

	// 구매글 타이틀 검색(페이징)
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

	// 구매글 작성자 검색(페이징 적용)
	public List<DealBoardDto> searchdealwriter(String search,Paging paging) {
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
			list = session.selectList(namespace + "searchdealwriter",map);
			System.out.println("다오에서의 list 사이즈"+list.size());
			System.out.println("여기까진 왓니? 작성자");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	// 판매글 카테고리 검색 (페이징 적용)
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

	// 판매글 타이틀 검색 (페이징 적용)
	public List<DealBoardDto> salesearchtitle(String salesearch,Paging paging) {
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum();
		Map<String, Object> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("salesearch", salesearch);
		System.out.println("startNum" + startNum);
		System.out.println("endNum" + endNum);
		
		SqlSession session = null;
		List<DealBoardDto> list = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"saletitle",map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}

	// 판매글 작성자 검색 (페이징 적용)
	public List<DealBoardDto> salesearchnick(String salesearch, Paging paging) {
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum();
		Map<String, Object> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("salesearch", salesearch);
		System.out.println("startNum" + startNum);
		System.out.println("endNum" + endNum);
		SqlSession session = null;
		List<DealBoardDto> list = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"salenick",map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}

	//팝업 띄우서 D닉네임 가져가기 (판매글)
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
	}

	//통합검색 페이징 카운트 수
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

	//판매 게시판 카테고리 페이징 카운트 수
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

	// 구매 게시판 타이틀 검색 카운트 수
	public int buysearchTitleCount(String search) {
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

	// 구매 게시판 작성자 검색 카운트 수
	public int buysearchNicknameCount(String search) {
		SqlSession session = null;
		int count = 0;

		try {
			session = getSqlSessionFactory().openSession(false);
			count = session.selectOne(namespace + "buynicksearchcount",search);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}

		return count;
	}


	// 판매 게시판 타이틀 검색 카운트 수 
	public int salesearchTitleCount(String salesearch) {
		SqlSession session = null;
		int count = 0;

		try {
			session = getSqlSessionFactory().openSession(false);
			count = session.selectOne(namespace + "salesearchcount",salesearch);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}

		return count;

	}

	// 판매 게시판 작성자 검색 카운트 수
	public int salesearchNicknameCount(String salesearch) {
		SqlSession session = null;
		int count = 0;

		try {
			session = getSqlSessionFactory().openSession(false);
			count = session.selectOne(namespace + "salenicksearchcount",salesearch);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}

		return count;
	}

	}
	
	
	

	

