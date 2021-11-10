package com.project.hiphople;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.project.domain.AttachFileDTO;
import com.project.service.S3Service;

@Controller
@PropertySource("classpath:/properties/s3.properties")
public class S3UploadController {

	private static final Logger logger = LoggerFactory.getLogger(S3UploadController.class);
	
	@Value("${s3.Url}")
	private String url;
	
	@Value("${s3.Bucket}")
	private String bucket;
	
	@Resource(name="s3uploadPath")
    private String folderName;

	@Autowired
	private S3Service s3service;
		
	// input file upload
	// S3 파일 업로드 (Multipart를 통해 전송)
	@RequestMapping(value = "uploadS3", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachFileDTO>> awsS3write(MultipartFile awsfile, HttpServletRequest request) throws Exception {
		
    	List<AttachFileDTO> dtolist = new ArrayList();

	    try {
	    	if(!awsfile.isEmpty())
	    		dtolist = s3service.uploadS3(awsfile, folderName);	
			} catch (Exception e) {
				e.printStackTrace();
			} 
    	return new ResponseEntity<List<AttachFileDTO>>(dtolist, HttpStatus.OK); 
	}
	
	// S3 업로드 이미지 출력
	@RequestMapping(value = "viewS3", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getFile(String fileName, HttpServletRequest request) {
		
		File file = new File(url + folderName+ "/" + fileName);
		
		logger.info("fileName = " + fileName);
		logger.info("file = " + file);
				
		ResponseEntity<byte[]> result = null;
						
			try {
				HttpHeaders header = new HttpHeaders();
				header.add("Content-Type", Files.probeContentType(file.toPath()));
				result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
				logger.info("result1 : "+ result);
				} catch (IOException e) {
					e.printStackTrace();
				}
				logger.info("result2 : "+ result);
				return result;
			}
	
	// 파일 삭제
	@RequestMapping(value="deleteS3", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public ResponseEntity<String> deleteS3(String fileName, String type, String uuid){ // public void가 아닌 이상 return 타입이 있어야 하는데, return타입이 없으면 deleteFile에 빨간 줄 뜸(기억)
		
		logger.info("fileName: " + fileName); 
		
		try {
			if(type.equals("image")){
				String Key = folderName + "/" + uuid + "_" + fileName;
				s3service.deleteFile(bucket, Key);
				logger.info("버킷: " + bucket);
				logger.info("삭제된 파일: " + Key);
			}
							
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>("삭제 실패", HttpStatus.INTERNAL_SERVER_ERROR);
			
		}
		logger.info("삭제완료");
		return new ResponseEntity<String>("이미지가 삭제되었습니다", HttpStatus.OK);
	}	
	
	// get file
	
}