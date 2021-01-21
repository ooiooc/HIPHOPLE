package com.project.service;

import java.util.Date;

import com.project.domain.Token;

public interface TokenService {

	public void createNewToken(Token token) ;

    public void updateToken(String series, String token, Date lastUsed);

    public Token getTokenForSeries(String series);
    
    public void removeUserTokens(final String username);

}
