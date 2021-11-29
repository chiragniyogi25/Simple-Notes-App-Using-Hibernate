package com.servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Transaction tx = null;
		Session s = null;
		try {

			String title = request.getParameter("title");
			String content = request.getParameter("content");
			// int id = Integer.parseInt(request.getParameter("noteId"));

			int id = Integer.parseInt(request.getParameter("noteId"));
			s = FactoryProvider.getFactory().openSession();
			tx = s.beginTransaction();
			Note note = (Note) s.get(Note.class, id);
			note.setTitle(title);// its updates the data
			note.setContent(content);
			note.setAddedDate(new Date());
			// note.setId(id);
			tx.commit();
		} catch (Exception e) {
			// TODO: handle exception
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			s.close();
			response.sendRedirect("all_notes.jsp");
		}
	}

}
