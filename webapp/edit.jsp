<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.entities.Note"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit here</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<h1>Edit Your Note</h1>
		<br>
		<%
			int noteId = Integer.parseInt(request.getParameter("note_id").trim());
			Session s = FactoryProvider.getFactory().openSession();
			// get the note object into session according to id
			Note note = (Note) s.get(Note.class, noteId);
		%>
		<form action="UpdateServlet" method="post">
		<input type="hidden" name="noteId" value="<%=note.getId() %>"/>
			<div class="form-group">
				<label for="title">Note title</label> <input required type="text"
					class="form-control" name="title" id="title"
					placeholder="Enter here" aria-describedby="titleHelp"
					value="<%=note.getTitle().trim() %>"/>
			</div>
			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea required id="content" name="content"
					placeholder='Enter your Content'
					class="form-control" 
					rows="10"
					cols="10"><%=note.getContent().trim()%></textarea>
			</div>
			
			<div class="container text-center">
				<button type="submit" class="btn btn-success">Save your note</button>
			</div>
		</form>
	</div>

</body>
</html>