package kr.ac.twoportal.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.twoportal.dao.BoardDao;
import kr.ac.twoportal.form.BoardAddImageStringForm;
import kr.ac.twoportal.vo.Board;
import kr.ac.twoportal.vo.BoardImage;
import kr.ac.twoportal.vo.BoardReplie;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDao boardDao;
	
	@Override
	public int countBoardListTotal(Map<String, Object> map) {
		return boardDao.countBoardList(map);
	}

	@Override
	public List<Board> selectBoardListNotParameter() {
		return boardDao.selectBoardListNotParameter();
	}

	@Override
	public List<Board> selectBoardList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return boardDao.selectBoardList(map);
	}

	@Override
	public Board boardListDetail(int boardNo) {
		return boardDao.boardListDetail(boardNo);
	}

	@Override
	public List<Board> getFiveBoardByProNo(int proNo) {
		return boardDao.getFiveBoardByProNo(proNo);
	}

	@Override
	public List<BoardReplie> getBoardReplies(int boardNo) {
		return boardDao.getBoardReplies(boardNo);
	}

	@Override
	public int getBoardRepliesCount() {
		
		return boardDao.getBoardRepliesCount();
	}

	@Override
	public void insertBoardReply(BoardReplie boardReplie) {
		boardDao.insertBoardReply(boardReplie);
		
	}

	@Override
	public void updateBoardReply(BoardReplie boardReplie) {
		boardDao.updateBoardReply(boardReplie);
	}

	@Override
	public void deleteBoardReply(BoardReplie boardReplie) {
		boardDao.deleteBoardReply(boardReplie);
	}

	@Override
	public void insertBoard(Board board) {
		boardDao.insertBoard(board);
		
	}
	@Override
	public void insertImageBoard(BoardImage boardImage) {
		boardDao.insertImageBoard(boardImage);
		
	}

	@Override
	public BoardImage boardListImgDetail(int boardNo) {
		return boardDao.boardListImgDetail(boardNo);
	}



		
}
