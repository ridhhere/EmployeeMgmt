package com.takeo.client;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import com.github.javafaker.Faker;
import com.takeo.pojo.EmployeeEntity;

import java.util.List;

public class EmployeeClient {

	private static final SessionFactory factory;
	static Faker faker = new Faker();
	EmployeeClient client = new EmployeeClient();
	static Session session = null;

	static {
		// Create Configuration Object
		Configuration cfg = new Configuration();
		cfg.configure("com/takeo/config/hibernate.cfg.xml");
		// Build SessionFactory
		factory = cfg.buildSessionFactory();
	}

	public static List<EmployeeEntity> getAllEmployees() {
		session = factory.openSession();
		Query getQuery = session.createQuery("from EmployeeEntity");
		List<EmployeeEntity> addEmployees = getQuery.getResultList();
		return addEmployees;
	}

	public static void addEmployee(String firstName,String lastName,String email) {
		EmployeeEntity newEmployee = new EmployeeEntity();
		newEmployee.setFirstName(firstName);
		newEmployee.setLastName(lastName);
		newEmployee.setEmail(email);
		session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(newEmployee);
		tx.commit();
	}

	public static EmployeeEntity getEmployeeById(int id) {
		session = factory.openSession();
		Query getQueryById = session.createQuery("from EmployeeEntity where eno = :id");
		getQueryById.setParameter("id", id);
		EmployeeEntity emp = (EmployeeEntity) getQueryById.uniqueResult();
		return emp;
	}

	public static void updateEmployee(int id,String firstName,String lastName,String email) {
		String hql = "update EmployeeEntity set firstName = :newFirstName, lastName = :newLastName, email =:newEmail where eno = :id";
		try (Session session = factory.openSession()) {
			Query updateQuery = session.createQuery(hql);
			Transaction tx = session.beginTransaction();
			updateQuery.setParameter("newFirstName", firstName);
			updateQuery.setParameter("newLastName", lastName);
			updateQuery.setParameter("newEmail", email);
			updateQuery.setParameter("id", id);
			int result1 = updateQuery.executeUpdate();
			session.getTransaction().commit();
		}
	}
}
