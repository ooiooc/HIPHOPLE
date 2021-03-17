package com.project.service;

import java.util.Date;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.domain.Token;

@Repository
public class TokenServiceImpl implements TokenService{

	
	private SqlSession session;
	
	
	public TokenServiceImpl() {
		
	}

	public TokenServiceImpl(SqlSession session) {
		this.session = session;
	}

	@Override
	public void createNewToken(Token token) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("username", token.getUsername());
		params.put("series", token.getSeries());
		params.put("token", token.getToken());
		System.out.println("createNewToken ");
		int ret= session.insert("com.oopsmap.mapper.insertToken", params);

		System.out.println("createNewToken ret="+ret);
		
	}

	@Override
	public void updateToken(String series, String token, Date lastUsed) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Token getTokenForSeries(String series) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void removeUserTokens(String username) {
		// TODO Auto-generated method stub
		
	}

	
	
}
