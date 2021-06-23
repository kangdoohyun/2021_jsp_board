package com.kdh.exam.exam1.dto;

import java.util.Map;

import com.kdh.exam.exam1.util.Ut;

import lombok.Data;
@Data
public class ResultData {
	private String msg;
	private String resultCode;
	private Map<String, Object> body;
	
	private ResultData() {
		
	}
	
	public static ResultData from(String resultCode, String msg, Object... args) {
		ResultData rd = new ResultData();
		
		rd.msg = msg;
		rd.resultCode = resultCode;
		rd.body = Ut.mapOf(args);
		
		return rd;
	}

}
