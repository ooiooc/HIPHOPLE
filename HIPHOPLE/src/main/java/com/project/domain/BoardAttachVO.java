package com.project.domain;

public class BoardAttachVO {

	//upload 테이블에 들어갈 값을 배열처리 해주기
	//uuid
	//uploadPath
	//fileName
	//fileType
	//bno 
	//regdate
	
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	private int bno;
	private String regdate;

	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getUploadPath() {
		return uploadPath;
	}
	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public boolean isFileType() {
		return fileType;
	}
	public void setFileType(boolean fileType) {
		this.fileType = fileType;
	}
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "BoardAttachVO [uuid=" + uuid + ", uploadPath=" + uploadPath + ", fileName=" + fileName + ", fileType="
				+ fileType + ", bno=" + bno + ", regdate=" + regdate + "]";
	}
}
