package com.kdh.exam.exam1.http.repository;

import java.util.List;

import com.kdh.exam.exam1.dto.Article;
import com.kdh.mysqlutil.MysqlUtil;
import com.kdh.mysqlutil.SecSql;

public class ArticleRepository {

	public int write(String title, String body) {
		SecSql sql = new SecSql();
		sql.append("INSERT INTO article SET");
		sql.append("regDate = NOW()");
		sql.append(", updateDate = NOW()");
		sql.append(", title = ?", title);
		sql.append(", body = ?", body);
		
		int id = MysqlUtil.insert(sql);
		
		return id;
	}

	public List<Article> getForPrintArticles() {
		SecSql sql = new SecSql();
		sql.append("SELECT A.* FROM article AS A ORDER BY A.id DESC");
		return MysqlUtil.selectRows(sql, Article.class);
	}

}
