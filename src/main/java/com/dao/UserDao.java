package com.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entity.User;

public class UserDao {
	private SessionFactory factory = null;
	private Session session=null;
	private Transaction tx=null;
	
	public UserDao(SessionFactory factory) {
		super();
		this.factory=factory;
	}
	
	public boolean saveuser(User user) {
		boolean saved=false;
		try {
			session=factory.openSession();
			tx=session.beginTransaction();
			
			session.save(user);
			tx.commit();
			saved=true;
			
		} catch (Exception e) {
			// TODO: handle exception
			if(tx!=null) {
				saved=false;
				e.printStackTrace();
			}
		}
		return saved;
	}
	
	public User login(String email,String password) {
		User u=null;
		session=factory.openSession();
		Query q =session.createQuery("from User where email=:em and password=:ps");
		q.setParameter("em", email);
		q.setParameter("ps", password);
		u = (User)q.uniqueResult();
		
		return u;
	
	}
	
}
