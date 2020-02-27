package kr.ac.twoportal.vo;

import org.apache.ibatis.type.Alias;

@Alias("Urls")
public class Urls {

	private int no;
	private String url;
	private String requiredLogin;
	private String subCateTitle;
	private int	mainMenuNo;
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getRequiredLogin() {
		return requiredLogin;
	}
	public void setRequiredLogin(String requiredLogin) {
		this.requiredLogin = requiredLogin;
	}
	public String getSubCateTitle() {
		return subCateTitle;
	}
	public void setSubCateTitle(String subCateTitle) {
		this.subCateTitle = subCateTitle;
	}
	public int getMainMenuNo() {
		return mainMenuNo;
	}
	public void setMainMenuNo(int mainMenuNo) {
		this.mainMenuNo = mainMenuNo;
	}
	@Override
	public String toString() {
		return "Urls [no=" + no + ", url=" + url + ", requiredLogin=" + requiredLogin + ", subCateTitle=" + subCateTitle
				+ ", mainMenuNo=" + mainMenuNo + "]";
	}
	
	
	
}
