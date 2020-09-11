package com.project.mapper;

import java.util.List;

import com.project.domain.BoardAttachVO;
import com.project.domain.BoardVO;

public interface BoardAttachMapper {

	//파일 업로드를 attach 테이블에 insert 
	public void insert (BoardAttachVO vo);
		
	//파일 업로드를 attach 테이블에서 delete 
	public void delete (BoardVO vo);
		
	//파일 업로드를 attach 테이블에서 select
	public List<BoardAttachVO> select (int bno);

}
