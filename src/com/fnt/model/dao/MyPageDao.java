package com.fnt.model.dao;

import java.util.List;

import com.fnt.model.dto.AlertDto;

public interface MyPageDao {
	
	//종버튼을 클릭했을 때에 MypageController를 가서 실행해서 뿌려줄건데
	//Dao를 가서 처리를 해줘야한다.
	public List<AlertDto> Allalert(); 

}
