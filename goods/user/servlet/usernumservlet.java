package www.cmj.goods.user.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import www.cmj.jdbc.TxQueryRunner;

public class usernumservlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		QueryRunner qr = new TxQueryRunner();
		String sql = "select count(*) from t_user";
		Object query;
		try {
			query = qr.query(sql, new ScalarHandler());
			String num = query.toString();
			response.getWriter().print(num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		}

}
