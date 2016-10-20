package com.neu.project;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.neu.project.dao.HibernateUtil;
import com.neu.project.model.Contacts;
import com.neu.project.model.EmailAccount;
import com.neu.project.model.Messages;
import com.neu.project.model.User;



public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();


		Transaction t = session.beginTransaction();


		Contacts c = new Contacts();
		

		

		session.persist(c);

		


		t.commit();


		session.close();


		System.out.println("Success");

	}

}
