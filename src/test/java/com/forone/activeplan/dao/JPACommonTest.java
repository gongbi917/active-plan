package com.forone.activeplan.dao;

import static org.junit.Assert.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import com.forone.activeplan.entity.User;

public class JPACommonTest {
	private static EntityManagerFactory emf;
	private static EntityManager em;
	private static EntityTransaction tx;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("activeplan");
		em = emf.createEntityManager();
	}
	
	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		em.close();
		emf.close();
	}
	
	@Before
	public void setUp() throws Exception {
		tx = em.getTransaction();
	}
	
	@After
	public void tearDown() throws Exception {
		// nothing
	}
	
	@Test
	public void test() {
		User user = new User();
		user.setUsername("Michael");
		user.setPassword("Password2");
		user.setEmail("michael.gong@outlook.com");
		tx.begin();
		em.persist(user);
		tx.commit();
		
		assertNotNull("ID should not be null", user.getId());
	}
	
}
