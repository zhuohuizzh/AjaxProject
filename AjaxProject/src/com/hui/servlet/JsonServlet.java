package com.hui.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hui.entity.Student;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class JsonServlet
 */
public class JsonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// git项目修改
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		String mobile = request.getParameter("mobile");

		ArrayList<String> mobiles = (ArrayList<String>) request.getSession().getAttribute("mobiles");
		if(mobiles==null) {
			mobiles = new ArrayList<String>();
		}
		PrintWriter out = response.getWriter();
		//返回json对象
		Student s1 = new Student();
		s1.setName("张卓辉");
		s1.setAge(22);
		Student s2 = new Student();
		s2.setName("ssd");
		s2.setAge(25);
		Student s3 = new Student();
		s3.setName("张dgf");
		s3.setAge(28);
		JSONObject json = new JSONObject();
		json.put("s1", s1);
		json.put("s2", s2);
		json.put("s3", s3);
		out.print(json);
		request.getSession().setAttribute("mobiles", mobiles);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
