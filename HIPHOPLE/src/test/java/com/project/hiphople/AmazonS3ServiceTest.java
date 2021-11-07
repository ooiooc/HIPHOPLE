package com.project.hiphople;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.project.service.S3Service;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")

public class AmazonS3ServiceTest {
	private static final Logger logger = LoggerFactory.getLogger(S3UploadController.class);

	@Autowired
	private S3Service s3service;
	
	// 파일 삭제
	@Test 
	public void deleteTest() {
		String filePath = "https://hiphoplebucket.s3.ap-northeast-2.amazonaws.com/upload/9a1f21ea-5186-436a-b1bc-249cbfa26d28_clairocp.jpg";
		s3service.deleteFile(filePath);
		logger.info("삭제 완료 : " + filePath);
	}
	
	
}
