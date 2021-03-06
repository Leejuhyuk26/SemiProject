package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.beans.CustomerDAO;
import com.lec.beans.CustomerDTO;
import com.lec.beans.PetDAO;
import com.lec.beans.PetDTO;
import com.lec.beans.ReviewDAO;
import com.lec.beans.ReviewDTO;

public class PetCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		PetDAO dao = new PetDAO(); // DAO
		int cnt = 0;
		HttpSession session = request.getSession(); 

		
		int cus_num = Integer.parseInt((String)(session.getAttribute("c_num")));
		String pet_name = request.getParameter("pet_name");
		int pet_age = Integer.parseInt(request.getParameter("pet_age"));
		int pet_weight = Integer.parseInt(request.getParameter("pet_weight"));
		int pet_image = Integer.parseInt(request.getParameter("pet_image"));

			try {
				cnt = dao.insert(cus_num, pet_name, pet_age, pet_weight, pet_image);
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			}

		request.setAttribute("result", cnt);
	}

}
