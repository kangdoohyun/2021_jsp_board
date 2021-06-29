package com.kdh.exam.exam1.repository;

import com.kdh.exam.exam1.dto.Member;
import com.kdh.mysqlutil.MysqlUtil;
import com.kdh.mysqlutil.SecSql;

public class MemberRepository {

	public Member getMemberByLoginId(String loginId) {
		SecSql sql = new SecSql();
		sql.append("SELECT * FROM `member` WHERE loginId = ?", loginId);
		return MysqlUtil.selectRow(sql, Member.class);
	}


}
