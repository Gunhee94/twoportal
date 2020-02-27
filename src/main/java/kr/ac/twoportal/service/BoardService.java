package kr.ac.twoportal.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import kr.ac.twoportal.form.BoardAddImageStringForm;
import kr.ac.twoportal.vo.Board;
import kr.ac.twoportal.vo.BoardImage;
import kr.ac.twoportal.vo.BoardReplie;
@Transactional
public interface BoardService {
	  //게시글 총 개수 파악
	  int countBoardListTotal(Map<String, Object> map);
	  //게시글 조회
	  List<Board> selectBoardList(Map<String, Object> map);
	  //게시글 조회
	  List<Board> selectBoardListNotParameter();

	  Board boardListDetail (int boardNo);
	 
	  // 이건희
	  List<Board> getFiveBoardByProNo(int proNo);
	  
	  List<BoardReplie> getBoardReplies (int boardNo);
		
	int getBoardRepliesCount ();
	
	void insertBoardReply (BoardReplie boardReplie);

	void updateBoardReply (BoardReplie boardReplie);
	
	void deleteBoardReply (BoardReplie boardReplie);
	
	void insertBoard (Board board);
	
	void insertImageBoard(BoardImage boardImage);
	
	BoardImage boardListImgDetail(int boardNo);
	  
}
