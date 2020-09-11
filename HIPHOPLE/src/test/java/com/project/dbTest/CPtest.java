package com.project.dbTest;

import static org.junit.Assert.fail;

import java.sql.Connection;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")

public class CPtest {
		
		private final Logger logger = LoggerFactory.getLogger(this.getClass());
		
		@Autowired
		private DataSource dataSource;
		
		@Test
		public void CPTest(){
			try(Connection con = dataSource.getConnection()) {
				logger.info(("커넥션풀 연결 테스트 ="+con));
				
			} catch (Exception e) {
				// TODO: handle exception
				fail(e.getMessage());
			}
		}
		
		//root-context.xml의 sqlSessionFactory부분 test
		@Autowired
		private SqlSessionFactory sqlSessionFactory;
			
		@Test
		public void mybatisTest(){
			try(SqlSession session = sqlSessionFactory.openSession();
					Connection con = dataSource.getConnection()	) {
				logger.info(("my batis 연결 ="+session));
				logger.info(("커넥션풀 연결 ="+con));
				
			} catch (Exception e) {
				// TODO: handle exception
				fail(e.getMessage());
			}
		}
}
