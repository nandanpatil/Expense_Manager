package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entity.Expense;
import com.entity.User;

public class ExpenseDao {
	private SessionFactory factory = null;
	private Session session=null;
	private Transaction tx=null;
	
	public ExpenseDao(SessionFactory factory) {
		super();
		this.factory=factory;
	}
	
	public boolean saveExpense(Expense ex) {
		boolean saved=false;
		try {
			session=factory.openSession();
			tx=session.beginTransaction();
			
			session.save(ex);
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
	
	public List<Expense> getAllExpenses(User u){
		List<Expense>list = new ArrayList<Expense>();
		try {
			session = factory.openSession();
			Query q= session.createQuery("from Expense where user=:usr");
			q.setParameter("usr", u);
			list = q.list(); 
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	
	public Expense getExpenseById(int id) {
		Expense ex=null;
		try {
			session = factory.openSession();
			Query q=session.createQuery("from Expense where id=:idd");
			q.setParameter("idd",id);
			ex=(Expense)q.uniqueResult();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ex;
	}
	
	public boolean updateExpense(Expense ex) {
		boolean updated=false;
		try {
			session=factory.openSession();
			tx=session.beginTransaction();
			
			session.saveOrUpdate(ex);
			tx.commit();
			updated=true;
			
		} catch (Exception e) {
			// TODO: handle exception
			if(tx!=null) {
				updated=false;
				e.printStackTrace();
			}
		}
		return updated;
	}
	
	public boolean deleteExpense(int id) {
		boolean deleted = false;
		try {
			session = factory.openSession();
			tx=session.beginTransaction();
			Expense ex = session.get(Expense.class,id);
			session.delete(ex);
			tx.commit();
			deleted=true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return deleted;
	}
	
	
}
