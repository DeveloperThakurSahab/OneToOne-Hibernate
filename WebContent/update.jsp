<%@page import="com.bean.EmpInfo"%>
<%@page import="com.bean.Emp"%>
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
	Emp e1=(Emp)request.getAttribute("e1");
%>
<form name="update" method="post" action="EmpController">
	<table>
		<tr>
			<td><input type="hidden" name="eid" value="<%=e1.getEid() %>"></td>
		</tr>
		<tr>
			<td><input type="hidden" name="einfo" value="<%=e1.getEinfo().getEinfo() %>"></td>
		</tr>
		<tr>
			<td>First Name</td>
			<td><input type="text" name="fname" value="<%=e1.getEinfo().getFname() %>"></td>
		</tr>
		<tr>
			<td>Last Name</td>
			<td><input type="text" name="lname" value="<%=e1.getEinfo().getLname() %>"></td>
		</tr>
		<tr>
			<td>Email</td>
			<td><input type="text" name="email" value="<%=e1.getEinfo().getEmail() %>"></td>
		</tr>
		<tr>
			<td>Job</td>
			<td><input type="text" name="job" value="<%=e1.getJob()%>"></td>
		</tr>
		<tr>
			<td>Salary</td>
			<td><input type="text" name="salary" value="<%=e1.getSalary() %>"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" name="action" value="UPDATE">
			</td>
		</tr>
	</table>
</form>
</body>
</html>