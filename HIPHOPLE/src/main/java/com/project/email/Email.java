package com.project.email;

public class Email {
	
	//발송할 email 정보를 저장할 DTO 생성
	private String subject; //제목
	private String content; //내용
	private String receiveMail; //수신이메일

	
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReceiveMail() {
		return receiveMail;
	}
	public void setReceiveMail(String receiveMail) {
		this.receiveMail = receiveMail;
	}

	@Override
	public String toString() {
		return "Email [subject=" + subject + ", content=" + content + ", receiveMail=" + receiveMail + "]";
	}

	
}