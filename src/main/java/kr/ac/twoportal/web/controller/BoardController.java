package kr.ac.twoportal.web.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import kr.ac.twoportal.form.BoardAddImageForm;
import kr.ac.twoportal.form.BoardAddImageStringForm;
import kr.ac.twoportal.form.BoardListForm;
import kr.ac.twoportal.service.BoardService;
import kr.ac.twoportal.service.MyPageService;
import kr.ac.twoportal.vo.Board;
import kr.ac.twoportal.vo.BoardImage;
import kr.ac.twoportal.vo.BoardReplie;
import kr.ac.twoportal.vo.Criteria;
import kr.ac.twoportal.vo.PageMaker;


@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private MyPageService mypageService;
	
	@Value("${board.photo.save}")
	private String photoSaveBoard;
	
	@GetMapping("/staff/boardList.hta")
    public String openBoardList() throws Exception {
        return "/staff/board/boardList";	
	}
	
	
	@GetMapping("/staff/boardLists.hta")
	@ResponseBody
	public Map<String, Object> openBoardList(BoardListForm boardListform) throws Exception{
		
		System.out.println(boardListform);
		
		Criteria criteria = new Criteria();
		criteria.setPage(boardListform.getPage());
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("category",boardListform.getCategory()); 	
		map.put("dateorview",boardListform.getDateorview()); 	
		map.put("searchBox",boardListform.getSearchBox()); 	
		map.put("searchOption",boardListform.getSearchOption()); 
		map.put("pageStart",(boardListform.getPage()-1)*5);						
		map.put("perPageNum",criteria.getPerPageNum());
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);
		pageMaker.setTotalCount(boardService.countBoardListTotal(map));
		

		Map<String, Object> result = new HashMap<String, Object>();
		List<Board> list = boardService.selectBoardList(map);
		result.put("list", list);
		result.put("page",pageMaker);
		System.out.println(result);
		return result;
	}
	
	@RequestMapping(value="/staff/boardDetail.hta")
	public ModelAndView boardDetail(@RequestParam("detail") int boardNo) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/staff/board/boardDetail");
		
		Board detail = boardService.boardListDetail(boardNo);
		BoardImage detailImage = boardService.boardListImgDetail(boardNo);
		mav.addObject("detail",detail);
		mav.addObject("detailImage",detailImage);
		System.out.println(detail);
		return mav;
	}
	
	
	@GetMapping("/staff/selectBoardListReply.hta")
	@ResponseBody
	public List<BoardReplie> getBoardRelpy(@RequestParam("boardNo") int boardNo)throws Exception {
		List<BoardReplie> replies = boardService.getBoardReplies(boardNo);
		return replies;
	}
	
	@PostMapping("/staff/addBoardListReply.hta")
	@ResponseBody
	public List<BoardReplie> addBoardRelpy (BoardReplie boardReplie)throws Exception {
		//System.out.println(boardReplie);
		boardService.insertBoardReply(boardReplie);
		
		List<BoardReplie> replies = boardService.getBoardReplies(boardReplie.getBoardNo());
		return replies;
	}
	
	@PostMapping("/staff/updateBoardListReply.hta")
	@ResponseBody
	public List<BoardReplie> updateBoardRelpy(BoardReplie boardReplie)throws Exception {
		//System.out.println(boardReplie);
		boardService.updateBoardReply(boardReplie);
		
		List<BoardReplie> replies = boardService.getBoardReplies(boardReplie.getBoardNo());
		return replies;
	}
	
	@PostMapping("/staff/deleteBoardListReply.hta")
	@ResponseBody
	public List<BoardReplie> deleteBoardRelpy(BoardReplie boardReplie)throws Exception {
		boardService.deleteBoardReply(boardReplie);
		
		List<BoardReplie> replies = boardService.getBoardReplies(boardReplie.getBoardNo());
		return replies;

	}
	
	@GetMapping("/staff/boardInsert.hta")
	public String getinsertBoard()throws Exception {
		
		return "/staff/board/boardInsert";
	}
	
	@PostMapping("/staff/boardInsert.hta")
	public String multipartImageBoard (BoardAddImageForm boardAddImageForm) throws Exception{
		String fileName="";
		Board board = new Board();
		//System.out.println(boardAddImageForm);
		if(boardAddImageForm.getProNo() != 0) {
			board.setProNo(boardAddImageForm.getProNo());			
		}
		if(boardAddImageForm.getStuNo() != 0) {
			board.setStuNo(boardAddImageForm.getStuNo());			
		}
		if(boardAddImageForm.getStaffNo() != 0) {
			board.setStaffNo(boardAddImageForm.getStaffNo());
		}
		board.setGuestNickname(boardAddImageForm.getNickname());
		board.setTitle(boardAddImageForm.getTitle());
		board.setContent(boardAddImageForm.getContent());
		board.setCategory(boardAddImageForm.getCategory());
		board.setPwd(boardAddImageForm.getPwd());

		boardService.insertBoard(board);
		

		BoardImage boardImage = new BoardImage();
		boardImage.setBoardNo(board.getNo());
		System.out.println(board.getNo());
		
		List<MultipartFile> result = boardAddImageForm.getBoardImageName();
		for(MultipartFile image:result) {
			String regImg = mypageService.regCheckAndUploadImg(image);
			if("uploaded".equals(regImg)) {
				String filename = image.getOriginalFilename();
				FileCopyUtils.copy(image.getBytes(), new File(photoSaveBoard, filename));				
				boardImage.setName(filename);
			}
		}
		System.out.println(board.getNo());
		
		boardService.insertImageBoard(boardImage);
		
		return "/staff/board/boardList";
	}
	
	@GetMapping("/staff/boardUpdate.hta")
	public ModelAndView DetailupdateBoard (@RequestParam("update") int updateNo) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/staff/board/boardUpdate");
		
		Board update = boardService.boardListDetail(updateNo);
		mav.addObject("update",update);
		
		return mav;
	}
	
}
