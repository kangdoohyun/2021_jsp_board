package com.kdh.exam.exam1.app;

import com.kdh.exam.exam1.container.Container;
import com.kdh.mysqlutil.MysqlUtil;

public class App {

	public static boolean isDevMode() {
//		이부분을 false로 바꾸면 production 모드이다.
		return true;
	}
	
	public static void init() {
//		DB세팅
		MysqlUtil.setDBInfo("localhost", "sbsst", "sbs123414", "2021_jsp_board");
		MysqlUtil.setDevMode(isDevMode());
		
//		공용 객체 세팅
		Container.init();
	}

}
