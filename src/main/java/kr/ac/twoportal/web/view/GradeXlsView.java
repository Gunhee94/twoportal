package kr.ac.twoportal.web.view;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.web.servlet.view.document.AbstractXlsxView;

import kr.ac.twoportal.dto.GradeLectureDto;

public class GradeXlsView extends AbstractXlsxView {
	
	@SuppressWarnings("unchecked")
	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		// 컨트롤러가 전달한 데이터를 모델에서 획득하기
		List<GradeLectureDto> grades = (List<GradeLectureDto>) model.get("gradeLectures");
		
		// 엑셀시트 생성하기 
		Sheet sheet = workbook.createSheet("Grades");
		
		// 제목행 생성하기
		Row titleRow = sheet.createRow(0);
		titleRow.createCell(0).setCellValue("학생 성적 목록");
		
		// 제목행 셀 병합하기
		sheet.addMergedRegion(new CellRangeAddress(
				0,	// first-row
				1,	// last-row
				0,	// first-column
				9	// last-column
		));
		
		Row headerRow = sheet.createRow(2);
		headerRow.createCell(0).setCellValue("개설년도");
		headerRow.createCell(1).setCellValue("학기");
		headerRow.createCell(2).setCellValue("학과");
		headerRow.createCell(3).setCellValue("학년");
		headerRow.createCell(4).setCellValue("과목");
		headerRow.createCell(5).setCellValue("학번");
		headerRow.createCell(6).setCellValue("이름");
		headerRow.createCell(7).setCellValue("점수");
		headerRow.createCell(8).setCellValue("석차");
		headerRow.createCell(9).setCellValue("등급");
		
		int dataRowIndex = 3;
		for (GradeLectureDto grade : grades) {
			Row dataRow = sheet.createRow(dataRowIndex++);
			
			dataRow.createCell(0).setCellValue(grade.getYear());
			dataRow.createCell(1).setCellValue(grade.getLectSemester());
			dataRow.createCell(2).setCellValue(grade.getDeptName());
			dataRow.createCell(3).setCellValue(grade.getStuGrade());
			dataRow.createCell(4).setCellValue(grade.getSubName());
			dataRow.createCell(5).setCellValue(grade.getStuId());
			dataRow.createCell(6).setCellValue(grade.getStuName());
			dataRow.createCell(7).setCellValue(grade.getGradeScore());
			dataRow.createCell(8).setCellValue(grade.getGradeRank());
			dataRow.createCell(9).setCellValue(grade.getGradeRating());
			Cell dateCell = dataRow.createCell(10);
			dateCell.setCellStyle(this.getDateCellStyle(workbook));
			//dateCell.setCellValue(book.getCreateDate());
		}
		// 셀 가로길이 지정
		sheet.setColumnWidth(7, 256*12);
		
		// 바이너리데이터(사진, 영상, 압축파일, 각종 워드, 한글, 파워포인트, 엑셀 문서들)를
		// 응답컨텐츠로 제공할 때 설정하는 응답컨텐츠 타입 //  8비트의 010100010 같은거 
		setContentType("application/octet-stream");
		
		// attachement : 다운로드 창 뜸  이거빼면 브라우저에 뜸 응용프로그램없으면  (첨부된파일)
		// 
		response.setHeader("Content-Disposition", "attachement; filename=grades.xlsx");
	}
	
	private CellStyle getDateCellStyle(Workbook workbook) {
		CreationHelper creationHelper = workbook.getCreationHelper();
		CellStyle cellStyle = workbook.createCellStyle();
		cellStyle.setDataFormat(creationHelper.createDataFormat().getFormat("yyyy-MM-dd"));
		
		return cellStyle;
	}
	
}
