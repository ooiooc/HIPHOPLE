package com.project.hiphople;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.project.domain.AttachFileDTO;
import com.project.service.S3Service;

@Controller
public class S3UploadController {

	private static final Logger logger = LoggerFactory.getLogger(S3UploadController.class);
	
	@Autowired
	private S3Service s3service;
	
	// url
	@Value("${awsS3.Url}")
	private String url;
	
	// input file upload
	@RequestMapping(value = "uploadS3", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachFileDTO>> awsS3write(MultipartFile awsfile, HttpServletRequest request) throws Exception {
		
		String foldername = "upload";
    	List<AttachFileDTO> dtolist = new ArrayList();
    	
	    try {
	    		dtolist = s3service.uploadS3(awsfile, foldername);	
			} catch (Exception e) {
				e.printStackTrace();
		} 
    	return new ResponseEntity<List<AttachFileDTO>>(dtolist, HttpStatus.OK); 
	}
}