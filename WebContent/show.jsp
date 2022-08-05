<%@page import="com.bean.Emp"%>
<%@page import="com.dao.EmpDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	List<Emp> list=EmpDao.getAllEmp();
%>
<table border="2" width="100%" cellpadding="10px">
	<tr>
		<th>EINFO</th>
		<th>FIRST NAME</th>
		<th>LAST NAME</th>
		<th>EMAIL</th>
		<th>EID</th>
		<th>JOB</th>
		<th>SALARY</th>
		<th>EDIT</th>
		<th>DELETE</th>
	</tr>
	<%
		for(Emp e:list)
		{
		%>
			<tr>
				<td><%=e.getEinfo().getEinfo() %></td>
				<td><%=e.getEinfo().getFname() %></td>
				<td><%=e.getEinfo().getLname() %></td>
				<td><%=e.getEinfo().getEmail() %></td>
				<td><%=e.getEid() %></td>
				<td><%=e.getJob() %></td>
				<td><%=e.getSalary() %></td>
				<td>
					<form name="edit" method="post" action="EmpController">
						<input type="hidden" name="eid" value="<%=e.getEid() %>">
						<input type="submit" name="action" value="EDIT">
					</form>
				</td>
				<td>
					<form name="delete" method="post" action="EmpController">
						<input type="hidden" name="eid" value="<%=e.getEid() %>">
						<input type="submit" name="action" value="DELETE">
					</form>
				</td>				
			</tr>	
		<%	
		}
	%>
</table>
</body>
</html>