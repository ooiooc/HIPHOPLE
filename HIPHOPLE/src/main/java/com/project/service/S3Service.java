package com.project.service;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.SDKGlobalConfiguration;
import com.amazonaws.SdkClientException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.auth.profile.ProfileCredentialsProvider;
import com.amazonaws.regions.Regions;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.internal.Mimetypes;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.GetObjectRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.S3Object;
import com.amazonaws.services.s3.model.S3ObjectInputStream;
import com.amazonaws.util.IOUtils;
import com.project.domain.AttachFileDTO;

@Service
//@PropertySource("classpath:/properties/s3.properties")
//@Component
public class S3Service {
	
	private static final Logger logger = LoggerFactory.getLogger(S3Service.class);
	
	@Value("${s3.Bucket}")
	private String bucket;
	
	@Value("${s3.Url}")
	private String url;
	    
	// Amazon-S3-SDK
	private AmazonS3 s3Client;
	
	// S3 Client 생성
	private S3Service() {
		try{
            s3Client = AmazonS3ClientBuilder.standard()
            		.withCredentials(new ProfileCredentialsProvider())
            		.withRegion(Regions.AP_NORTHEAST_2)
                    .build();
            logger.info("s3Client : " + s3Client);

        }catch(AmazonServiceException e){
            System.out.println(e);
            e.printStackTrace();
        }
	}
	
	
    // 폴더 생성 (폴더는 파일명 뒤에 "/"를 붙여주기)
    public void createFolder(String folderName) {
    	s3Client.putObject(bucket, folderName + "/", new ByteArrayInputStream(new byte[0]), new ObjectMetadata());
    }
  
    
    // 폴더 여부 체크
    public boolean folderExistCheck(String foldername) {
    	boolean doesItExists = s3Client.doesObjectExist(bucket, foldername);
    	return doesItExists;
    }

 	// 파일 URL
 	public String getFileURL(String bucketName, String fileName) {
 		return s3Client.getUrl(bucketName, fileName).toString(); 
 		//업로드된 파일의 경로를 String으로 받기
 	}
    
 	
 	// S3 파일 업로드 
 	public List<AttachFileDTO> uploadS3(MultipartFile file, String foldername) throws IOException {
 		List<AttachFileDTO> dtolist = new ArrayList();
 		
        String fileName = file.getOriginalFilename();
        UUID uuid = UUID.randomUUID(); // UUID 클래스 randomUUID() 메서드 사용하여 유일한 식별자 생성
        fileName = uuid.toString() + "_" + fileName; //uuid 객체에서 문자열 표현을 얻기 위해 toString() 출력
        
        // Content Type - 파일명에 따라 ContentType 설정
        // 데이터의 흐름 Stream
        // file 객체 : byte 단위(I/O), 문자단위(Reader, Writer)
        ObjectMetadata objectMetadata = new ObjectMetadata();
        objectMetadata.setContentType(Mimetypes.getInstance().getMimetype(fileName));
        
        // Content length - byte length 추가
        // HTTP Request 중 message-body로 넘어온 parameter 확인을 위해서는 getInputStream() 이나 getReader()를 사용
        byte[] bytes = IOUtils.toByteArray(file.getInputStream());  //IOUtils의 toByteArray() 메소드에 의해 파일을 만들고 내용을 쓰는 과정
        objectMetadata.setContentLength(bytes.length);
        // ByteArrayInputStream - Byte 단위 데이터 전송 스트림 / 읽기 기능
        ByteArrayInputStream byteArrayIs = new ByteArrayInputStream(bytes);
        
        
        //폴더가 존재하는지 확인 -> 없을 경우 폴더 생성 
        //if(!folderExistCheck(foldername)) {
        //	createFolder(foldername);
        //}
        
        //AttachFileDTO에 저장
		AttachFileDTO dto = new AttachFileDTO();
			dto.setFileName(file.getOriginalFilename());
			dto.setUploadPath(url.toString()+foldername);
			dto.setUuid(uuid.toString());
        
		//이미지 파일인지 체크
		String filetype = file.getContentType();
			if(filetype.contains("image")) {
				dto.setImage(true);
			}
        
        try {
        	s3Client.putObject(new PutObjectRequest(bucket,  foldername + "/" + fileName, byteArrayIs, objectMetadata)
                    .withCannedAcl(CannedAccessControlList.PublicRead)); // public read 권한 주기
        	dtolist.add(dto); //db에 저장될 값		
		} catch (AmazonServiceException e) {
			e.printStackTrace();
		}
        return dtolist;	 
        //return url + foldername + File.separator + fileName;
    }
 	
    
    // 파일 삭제
    // 삭제할 대상의 폴더(버킷명 + 하위 디렉토리)와 파일명 필요
    public void deleteFile(String bucketName, String fileName) throws AmazonServiceException {
        try {
            // deleting multiple objects 
        	// deleteObjectRequest : Delete 객체 생성 
            //DeleteObjectRequest deleteObjectRequest = new DeleteObjectRequest(bucket, folderName+"/"+ fileName);
            logger.info("bucket : " + bucket + " / fileName : " + fileName);
       
            boolean isExistObject = s3Client.doesObjectExist(bucketName, fileName);
            
            //파일이 존재할 경우
            if(isExistObject == true) {
            	// Delete
            	logger.info("존재하는 파일");
                
            	// deleting a single object
            	this.s3Client.deleteObject(bucket, fileName);
            	//s3Client.deleteObject(new DeleteObjectRequest(bucket, fileName));
            }
            
        } catch (AmazonServiceException e) {
            e.printStackTrace();
        } catch (SdkClientException e) {
        	logger.error("Error while deleting File.");
            e.printStackTrace();
        }
    } 	
    
    // src 파일 read - 파일 다운로드
    public S3ObjectInputStream getSrcFile(String bucketName, String fileName) throws IOException{
        System.out.println("넘어오는 파일명 : "+fileName);
        fileName = (fileName).replace(File.separatorChar, '/');
        S3Object s3object = s3Client.getObject(new GetObjectRequest(bucketName, fileName)); //해당 파일 s3객체에 담기
        S3ObjectInputStream objectInputStream = s3object.getObjectContent(); // s3객체를 스트림으로 변환

        return objectInputStream;
    }
 
} // 끝
