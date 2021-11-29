package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SaveNoteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		Transaction tx = null;
		Session s = null;
		try {
			// title,content fetch
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			// out.println(title);
			// out.println(content);
			Note note = new Note(title, content, new Date());
			// out.println(note.getId() + " : " + note.getTitle());

			// Hibernate Save
			s = FactoryProvider.getFactory().openSession();
			tx = s.beginTransaction();
			s.save(note);
			tx.commit();
			response.setContentType("text/html");
			out.println("<h1 style='text-align:center;'>Note is added successfully</h1>");
			out.println("<h1 style='text-align:center;'><a href='all_notes.jsp'>View all notes</a></h1>");

		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			s.close();
		}
	}

}
