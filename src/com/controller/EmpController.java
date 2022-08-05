package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Emp;
import com.bean.EmpInfo;
import com.dao.EmpDao;

@WebServlet("/EmpController")
public class EmpController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		if(action.equalsIgnoreCase("insert"))
		{
			EmpInfo e=new EmpInfo();
			e.setFname(request.getParameter("fname"));
			e.setLname(request.getParameter("lname"));
			e.setEmail(request.getParameter("email"));
			
			EmpDao.insertEmpInfo(e);
			
			Emp e1=new Emp();
			e1.setJob(request.getParameter("job"));
			e1.setSalary(Double.parseDouble(request.getParameter("salary")));
			e1.setEinfo(e);
			
			EmpDao.insertEmp(e1);
			
			response.sendRedirect("show.jsp");
		}
		else if(action.equalsIgnoreCase("edit"))
		{	
			int eid=Integer.parseInt(request.getParameter("eid"));
			Emp e1=EmpDao.getEmpById(eid);
			request.setAttribute("e1", e1);
			request.getRequestDispatcher("update.jsp").forward(request, response);
		}
		else if(action.equalsIgnoreCase("update"))
		{
			EmpInfo e1=new EmpInfo();
			e1.setEinfo(Integer.parseInt(request.getParameter("einfo")));
			e1.setFname(request.getParameter("fname"));
			e1.setLname(request.getParameter("lname"));
			e1.setEmail(request.getParameter("email"));
			
			Emp e=new Emp();
			e.setEid(Integer.parseInt(request.getParameter("eid")));
			e.setJob(request.getParameter("job"));
			e.setSalary(Double.parseDouble(request.getParameter("salary")));
			e.setEinfo(e1);
			EmpDao.insertEmp(e);
			
			response.sendRedirect("show.jsp");
		}
		else if(action.equalsIgnoreCase("delete"))
		{
			int eid=Integer.parseInt(request.getParameter("eid"));
			EmpDao.deleteEmp(eid);
			response.sendRedirect("show.jsp");
		}
	}

}
