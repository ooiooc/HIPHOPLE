package com.project.hiphople;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
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
import jdk.nashorn.internal.ir.annotations.Reference;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
public class UploadController {
	
	//@javax.annotation.Resource(name="uploadPath")
	private String uploadPath;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	//파일 업로드 테스트 화면
	/*
	@RequestMapping(value="content/uploadForm", method=RequestMethod.GET)
	public void uploadForm() throws Exception{
		logger.info("파일 업로드 화면 get");
	}
	
	// 파일 업로드 ajax 화면 
	@RequestMapping(value = "content/uploadAjax", method = RequestMethod.GET)
	public void uploadAjax() {
		logger.info("파일 업로드 ajax 화면");
			
	}
	
	//파일 업로드
	@RequestMapping(value="content/uploadForm", method=RequestMethod.POST)
	public void uploadForm(MultipartFile[] file) throws Exception {
		String uploadPath = "C:\\Users\\shinv\\Upload";
		
		//다수의 첨부파일을 확인하기 위해 배열 타입으로 설정
		for(MultipartFile multipartFile : file) {
			logger.info("업로드폼 post.........");
			logger.info("파일명:" + multipartFile.getOriginalFilename());
			logger.info("파일크기:" + multipartFile.getSize());
			logger.info("파일종류:" + multipartFile.getContentType());
			logger.info("파일저장위치:" + uploadPath);
		
		
		File saveFile = new File(uploadPath, multipartFile.getOriginalFilename());
		//uploadPath 파일폴더 경로
		//multipartFile 파일에 대한 정보 => saveFile에 저장
		
		try {
			multipartFile.transferTo(saveFile); //transferTo 폴더에 파일을 저장
			
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
	}
}
	*/
	
		//날짜별 폴더 생성하는 getFolder() 메소드
		private String getFolder() {
			
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); //반드시 대문자 MM으로
		Date date = new Date(); //오늘 날짜를 date 변수에 저장
		String str = sdf.format(date);
		System.out.println("오늘 날짜 = " + str); //str:2020-08-25 => 20200825
				
		return str.replace("-", File.separator); //separator 원화표시로 바꿔줌
			
		}
			
		//이미지 파일 여부 확인
		//이미지이면 true, 아닐 경우 false
		private boolean checkImageType(File file) {
			try {
				String contentType = Files.probeContentType(file.toPath()); //probeContentType type을 불러오는 것
				return contentType.startsWith("image");
				
				} catch (Exception e) {
					e.printStackTrace();
				
				}
				
				return false;
			}
		

	
		// 파일 업로드
		@RequestMapping(value = "uploadAjax", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
		public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] file,  HttpServletRequest request) throws Exception {
			
			logger.info("파일 업로드 ajax 처리");
			logger.info("파일의 길이 : " + file.length);
			
			//배포 디렉토리
			String root_path = request.getSession().getServletContext().getRealPath("/").concat("resources");
			//String uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload/");
			//String uploadPath = root_path + File.separator + "upload"+ File.separator ;

			//String root_path = request.getSession().getServletContext().getRealPath("/"); 
			String uploadPath = "C:\\Users\\shinv\\git\\HipHop\\HIPHOPLE\\src\\main\\webapp\\resources\\upload";
			
			//AttachFileDto 클래스를 list 배열로 생성
			List<AttachFileDTO> list = new ArrayList();
			
			//File uploadFolder = new File(root_path + uploadPath, getFolder());
			File uploadFolder = new File(uploadPath, getFolder());
			logger.info("파일업로드 폴더 : " + uploadFolder);
			
			
			// 오늘 날짜(2020/00/00) 폴더 생성
			//exist()메소드를 통해 생성하고자 하는 폴더가 존재하지 않으면 폴더 생성
			if(uploadFolder.exists()==false) { 
				uploadFolder.mkdirs();
			}
			
			for(MultipartFile multipartFile : file) {
				logger.info("파일명 : " + multipartFile.getOriginalFilename());
				logger.info("파일크기 : " + multipartFile.getSize());
				logger.info("파일종류 : " + multipartFile.getContentType());
				logger.info("파일저장위치 : " + uploadPath);
				
				AttachFileDTO attach = new AttachFileDTO();

				String fileName = multipartFile.getOriginalFilename(); //fileName

				attach.setFileName(fileName);
				
				//uuid 적용
				String uploadFileName=multipartFile.getOriginalFilename();
				
				UUID uuid = UUID.randomUUID();
				
				uploadFileName = uuid.toString() + "_" + uploadFileName;				
				//uploadFileName = uploadFileName;				
				
				try {
					//File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
					//원본 파일 저장
					File saveFile = new File(uploadFolder, uploadFileName);
					//uploadPath 파일폴더 경로
					//multipartFile 파일에 대한 정보 => saveFile에 저장
					
					multipartFile.transferTo(saveFile); //transferTo 폴더에 파일을 저장
					System.out.println("getFolder = "+getFolder());
					//AttachFileDTO 클래스에 uploadPath 변수에 날짜저장
					attach.setUploadPath(getFolder());
					//AttachFileDTO 클래스에 uuid 변수에 uuid 저장
					attach.setUuid(uuid.toString());
					
					//파일 저장할 때 이미지 파일이면 썸네일 생성 후 저장
					if(checkImageType(saveFile)) {
						
						//업로드된 파일이 이미지
						attach.setImage(true);
						
						//썸네일 이미지 생성
						FileOutputStream thumbnail = new FileOutputStream(new File(uploadFolder, "s_" + uploadFileName));
						Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
						thumbnail.close();
					}
					
					list.add(attach);
					
				} catch (Exception e) {
					logger.info(e.getMessage());
				}
			}
			
			return new ResponseEntity<>(list, HttpStatus.OK);
			//return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}
		
		// 이미지 업로드 파일 보여주는 화면 display
		@RequestMapping(value = "display", method = RequestMethod.GET)
		public ResponseEntity<byte[]> getFile(String fileName,HttpServletRequest request) {
			logger.info("fileName = " + fileName);
			
			String root_path = request.getSession().getServletContext().getRealPath("/").concat("resources");
			//String uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload/");
			//String uploadPath = root_path + File.separator + "upload"+File.separator ;

			String uploadPath = "C:\\Users\\shinv\\git\\HipHop\\HIPHOPLE\\src\\main\\webapp\\resources\\upload\\";
			
			File file = new File(uploadPath + fileName);
			//File file = new File("resources/upload/" + fileName);
			
			logger.info("file = " + file);
			
			ResponseEntity<byte[]> result = null;
					
					try {
						HttpHeaders header = new HttpHeaders();
						header.add("Content-Type", Files.probeContentType(file.toPath()));
						result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
					} catch (IOException e) {
						e.printStackTrace();
					}
					return result;
				}
				
		// 첨부파일 다운로드
		@RequestMapping(value="download", method=RequestMethod.GET, produces=MediaType.APPLICATION_OCTET_STREAM_VALUE)
		public ResponseEntity<Resource> downloadFile(String fileName){
			logger.info("download file : " + fileName);
					
			Resource resource = new FileSystemResource("C:\\Users\\shinv\\Upload\\" + fileName);
					
			logger.info("resource : "+ resource);
					
			String resourceName = resource.getFilename();
					
			HttpHeaders header = new HttpHeaders();
					
					try {
						header.add("Content-Disposition","attachment; fileName=" + new String(resourceName.getBytes("UTF-8"), "ISO-8859-1"));
					} catch (Exception e) {
						e.printStackTrace();
					}
					return new ResponseEntity<Resource>(resource, header, HttpStatus.OK);
				
				}
			
		
		// 첨부파일 삭제
		@RequestMapping(value="deleteFile", method = RequestMethod.POST)
			public ResponseEntity<String> deleteFile(String fileName, String type){ // public void가 아닌 이상 return 타입이 있어야 하는데, return타입이 없으면 deleteFile에 빨간 줄 뜸(기억)
					
			//test
			//logger.info("fileName = " + fileName);
			//logger.info("type = " + type);
								
				File file;
					
				try {
						
					file = new File("C:\\Users\\shinv\\Upload\\" + URLDecoder.decode(fileName,"UTF-8"));
						
					file.delete();
						
					if(type.equals("image")){
						String originalFile = file.getAbsolutePath().replace("s_",""); //replace 치환함수 s_ 붙은것을 빈 문자열로 바꿔주기
						file = new File(originalFile);
							
						//원본 이미지 파일 삭제
						file.delete();
							
						}
						
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
				}
					
			return new ResponseEntity<>("이미지가 삭제되었습니다", HttpStatus.OK);
					
		}
}
