
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="com.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All notes:NoteApp</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h1 class="text-uppercase">All Notes :</h1>
		<div class="row">
			<div class="col-12">

				<%
					Session s = FactoryProvider.getFactory().openSession();
					/* from Note is an entity name  */
					Query q = s.createQuery("from Note");//does the select query from the Note entity
					List<Note> list = q.list();//gets the data in the form of list
					for (Note note : list) {
				%>
				<div class="card mt-2" style="width: 100%;">
					<img src="img/notes.png" style="max-width: 100px"
						class="card-img-top m-4 mx-auto" alt="...">
					<div class="card-body px-5">
						<h5 class="card-title"><%=note.getTitle()%></h5>
						<p class="card-text"><%=note.getContent()%></p>
						<%
							SimpleDateFormat formatter = new SimpleDateFormat("E, dd MMM yyyy HH:mm:ss z");
								String strDate = formatter.format(note.getAddedDate());
						%>
						<p>
							<b class="text-primary"><%=strDate%></b>
						</p>
						<div class="container text-center mt-2">
							<a href="DeleteServlet?note_id=<%=note.getId()%>"
								class="btn btn-danger">Delete</a> <a
								href="edit.jsp?note_id=<%=note.getId()%>"
								class="btn btn-primary">Update</a>
						</div>

					</div>
				</div>
				<%
					}
					s.close();
				%>
			</div>
		</div>
	</div>
</body>
</html>
