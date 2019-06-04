package com.hui.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MobileServlet
 */
public class MobileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		String mobile = request.getParameter("mobile");
		//假设 此时数据库中的号码为
		//"15626146373".equals(mobile) 此种写法可防止空指针异常
		//mobile.equals("15626146373")
		ArrayList<String> mobiles = (ArrayList<String>) request.getSession().getAttribute("mobiles");
		if(mobiles==null) {
			mobiles = new ArrayList<String>();
		}
		PrintWriter out = response.getWriter();
		//System.out.println(mobile+"  想要注册");
		System.out.println(mobiles);
		System.out.println("=================");
		if(mobile != null && mobiles.contains(mobile)) {
			//成功
			//Servlet 以输出流的方式将 信息返回给客户端
			System.out.println(mobile + " -- 号码已注册 注册失败");
			out.write("{\"msg\":\"true\"}");
		}else {
			mobiles.add(mobile);
			System.out.println(mobile + " --  注册成功");
			out.write("{\"msg\":\"false\"}");
		}
		request.getSession().setAttribute("mobiles", mobiles);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
