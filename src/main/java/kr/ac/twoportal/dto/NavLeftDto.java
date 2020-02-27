package kr.ac.twoportal.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;

import kr.ac.twoportal.vo.Urls;

@Alias("NavLeftDto")
public class NavLeftDto {

	private int mainNo;
	private String mainTitle;
	private List<Urls> url;
	
	public int getMainNo() {
		return mainNo;
	}
	public void setMainNo(int mainNo) {
		this.mainNo = mainNo;
	}

	public String getMainTitle() {
		return mainTitle;
	}
	public void setMainTitle(String mainTitle) {
		this.mainTitle = mainTitle;
	}
	public List<Urls> getUrl() {
		return url;
	}
	public void setUrl(List<Urls> url) {
		this.url = url;
	}
	@Override
	public String toString() {
		return "NavLeftDto [mainNo=" + mainNo + ", mainTitle=" + mainTitle + ", url=" + url + "]";
	}
	
	
	
}
