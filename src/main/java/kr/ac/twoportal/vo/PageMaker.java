package kr.ac.twoportal.vo;

public class PageMaker {
	
	private Criteria cri;
	// 총 게시글 수
	private int totalCount;
	// 화면에 보여질 첫번째 페이지 번호, 시작 페이지 번호
    private int startPage;
    //화면에 보여질 마지막 페이지 번호, 끝 페이지 번호
    private int endPage;
    // 이전 버튼 생성 여부
    private boolean prev;
    // 다음 버튼 생성 여부
    private boolean next;
    // 화면 하단에 보여지는 페이지 버튼의 수
    private int displayPageNum = 5;
	    
	    public Criteria getCri() {
	        return cri;
	    }
	    public void setCri(Criteria cri) {
	        this.cri = cri;
	    }
	    public int getTotalCount() {
	        return totalCount;
	    }
	    public void setTotalCount(int totalCount) {
	        this.totalCount = totalCount;
	        calcData();
	    }
	    
	    private void calcData() {
	        
	        endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
	 
	        startPage = (endPage - displayPageNum) + 1;
	        if(startPage <= 0) startPage = 1;
	        
	        int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));
	        if (endPage > tempEndPage) {
	            endPage = tempEndPage;
	        }
	 
	        prev = startPage == 1 ? false : true;
	        next = endPage * cri.getPerPageNum() < totalCount ? true : false;
	        
	    }
	    
	    public int getStartPage() {
	        return startPage;
	    }
	    public void setStartPage(int startPage) {
	        this.startPage = startPage;
	    }
	    public int getEndPage() {
	        return endPage;
	    }
	    public void setEndPage(int endPage) {
	        this.endPage = endPage;
	    }
	    public boolean isPrev() {
	        return prev;
	    }
	    public void setPrev(boolean prev) {
	        this.prev = prev;
	    }
	    public boolean isNext() {
	        return next;
	    }
	    public void setNext(boolean next) {
	        this.next = next;
	    }
	    public int getDisplayPageNum() {
	        return displayPageNum;
	    }
	    public void setDisplayPageNum(int displayPageNum) {
	        this.displayPageNum = displayPageNum;
	    }

}
