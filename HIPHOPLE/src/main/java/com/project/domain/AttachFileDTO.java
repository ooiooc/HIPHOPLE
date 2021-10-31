package com.project.domain;

public class AttachFileDTO {
	
	//파일이름(문자열)
	private String fileName;
	//파일저장위치(문자열)
	private String uploadPath;
	//uuid(문자열)
	private String uuid;
	//Image여부(true/false: true면 이미지 파일, false면 이미지 아닌 파일)
	private boolean image;
	//파일 업로드일 
	private String regdate;
	

	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getUploadPath() {
		return uploadPath;
	}
	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public boolean isImage() {
		return image;
	}
	public void setImage(boolean image) {
		this.image = image;
	}
	
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "AttachFileDTO [fileName=" + fileName + ", uploadPath=" + uploadPath + ", uuid=" + uuid + ", image="
				+ image + ", regdate=" + regdate + "]";
	}
	
}
