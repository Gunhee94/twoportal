package kr.ac.twoportal.dao;

import java.util.List;
import java.util.Map;

import kr.ac.twoportal.form.BoardAddImageStringForm;
import kr.ac.twoportal.vo.Board;
import kr.ac.twoportal.vo.BoardImage;
import kr.ac.twoportal.vo.BoardReplie;

public interface BoardDao {
	 //List<Board> selectBoardList ();

	 List<Board> selectBoardList (Map<String, Object> map);

	//총 게시글 개수 구하기
	 int countBoardList(Map<String, Object> map);
	 
	 List<Board> selectBoardListNotParameter ();
	 
	 Board boardListDetail(int boardNo);
	 
	 // 이건희
	 List<Board> getFiveBoardByProNo(int proNo);
	 
	 //다시 서
	 List<BoardReplie> getBoardReplies (int boardNo);
		
	int getBoardRepliesCount ();
	
	void insertBoardReply (BoardReplie boardReplie);

	void updateBoardReply (BoardReplie boardReplie);
	
	void deleteBoardReply (BoardReplie boardReplie);
	
	void insertBoard (Board board);
	
	void insertImageBoard(BoardImage boardImage);
	
	BoardImage boardListImgDetail(int boardNo);
}
