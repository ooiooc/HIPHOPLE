package com.project.hiphople;

import java.io.IOException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.project.service.S3Service;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AmazonS3ServiceTest {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private S3Service s3service;
	
	@Value("${s3.Url}")
	private String url;
	
	@Value("${s3.Bucket}")
	private String bucket;
	
	// 파일 삭제
	@Test 
	public void 파일삭제_테스트() throws IOException {
		String filePath = "";
		s3service.deleteFile(bucket, filePath);
		
		logger.info("bucket : " + bucket);
		logger.info("fileName : " + filePath);
	}
	
	
}
