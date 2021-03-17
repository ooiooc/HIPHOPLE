package com.project.domain;

import java.util.Date;

public class Token {

	private String username;
	private String series;
	private String token;
	private Date last_used;
	
	
	public Token() {
	}


	public Token(String username, String series, String token, Date last_used) {
		super();
		this.username = username;
		this.series = series;
		this.token = token;
		this.last_used = last_used;
	}
	
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getSeries() {
		return series;
	}
	public void setSeries(String series) {
		this.series = series;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public Date getLast_used() {
		return last_used;
	}
	public void setLast_used(Date last_used) {
		this.last_used = last_used;
	}
	@Override
	public String toString() {
		return "Token [username=" + username + ", series=" + series + ", token=" + token + ", last_used=" + last_used
				+ "]";
	}
	
	
	
	
	
	
}
