package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.ReviewDAO;
import com.lec.beans.ReviewDTO;
//1028 이호인 15:49
public class SelectCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ReviewDAO dao = new ReviewDAO();
		ReviewDTO [] arr = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		try {
			arr = dao.selectByNum(num); // 읽기
			request.setAttribute("list", arr);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
