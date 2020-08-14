package com.fnt.model.biz.impl;

import com.fnt.model.biz.DealBoardBiz;

public class DealBoardBizImpl implements DealBoardBiz {

	@Override
	public String Caldfilename(String[] dfilename) {
		String result = "";
		if(dfilename.length == 1) {
			result = dfilename[0];
		}else {
			for(int i=0; i<dfilename.length; i++) {
				result += dfilename[i]+=",";
			}
		}
		
		System.out.println("biz " +result);
		
		return result;
	}

	@Override
	public int removecomma(String dprice) {
		return Integer.parseInt(dprice.replaceAll(",",""));
	}

}
