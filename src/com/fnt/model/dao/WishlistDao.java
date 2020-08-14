package com.fnt.model.dao;

import com.fnt.model.dto.WishlistDto;

public interface WishlistDao {
	public int insertWishlist(WishlistDto wishlistdto);
	
	public int deleteWishlist(int wlno);
	
	public WishlistDto selectOneWishlist(String memberid, String wlsellnickname, int wlboardno);

	public int selectOneWishlistBymemberid(String memberid, String wlsellnickname, int wlboardno);
}
