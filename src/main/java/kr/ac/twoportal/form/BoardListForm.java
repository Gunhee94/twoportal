package kr.ac.twoportal.form;

public class BoardListForm {
	private int page;
	private String category;
	private String dateorview;
	private String searchOption;
	private String searchBox;
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getDateorview() {
		return dateorview;
	}
	public void setDateorview(String dateorview) {
		this.dateorview = dateorview;
	}
	public String getSearchOption() {
		return searchOption;
	}
	public void setSearchOption(String searchOption) {
		this.searchOption = searchOption;
	}
	public String getSearchBox() {
		return searchBox;
	}
	public void setSearchBox(String searchBox) {
		this.searchBox = searchBox;
	}
	@Override
	public String toString() {
		return "BoardListForm [page=" + page + ", category=" + category + ", dateorview=" + dateorview
				+ ", searchOption=" + searchOption + ", searchBox=" + searchBox + "]";
	}
	
	
}
