package com.KoreaIT.syp.demo.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.KoreaIT.syp.demo.service.BustimeService;
import com.KoreaIT.syp.demo.vo.Bustime;
import com.KoreaIT.syp.demo.vo.Rq;

@Controller
public class UsrBustimeController {
	@Autowired
	private BustimeService bustimeService;
	@Autowired
	private Rq rq;
	
	@RequestMapping("/usr/bus/map")
	public String showMap() {
		return "usr/bus/map";
	}
	
	@RequestMapping("/usr/bus/bustime")
	public String showBusTime(Model model) throws IOException, InterruptedException {
//		ProcessBuilder processBuilder = new ProcessBuilder("python", "bustime.py");
//		Process process = processBuilder.start();
//
//		int exitCode = process.waitFor();
//		
//		if (exitCode == 0) {
//		    System.out.println("Python script executed successfully.");
//		} else {
//		    System.out.println("Python script failed with exit code: " + exitCode);
//		}
		
		// 엑셀 파일을 읽어옴
        Workbook workbook = WorkbookFactory.create(new File("BUSTIMETABLE.xls"));
        
        // 엑셀 셀의 값을 지정된 형식으로 변환
        DataFormatter dataFormatter = new DataFormatter();
        
        HSSFSheet sheet = null;
        HSSFRow row = null;
        HSSFCell cell = null;
        
        // 시트명
        List<String> sheetName = new ArrayList<>();
        
        //시트 개수
      	int sheetNum = workbook.getNumberOfSheets();
      	
      	// 엑셀 파일 담을 데이터
      	List<List<String>> data = new ArrayList<>();
        
        for (int i=0; i < sheetNum; i++) {
        	sheet = (HSSFSheet) workbook.getSheetAt(i);
        	
        	// 행 개수
        	int rowCount = sheet.getPhysicalNumberOfRows();
        	
        	for (int x = 0 ; x < rowCount ; x++) {
    			row = sheet.getRow(x);
    			List<String> rowValues = new ArrayList<>();
    			
    			// 셀 개수
    			int cellCount = row.getPhysicalNumberOfCells();
    			
    			for (int y = 0 ; y < cellCount; y++) {
    				cell = row.getCell(y);
    				String cellValue = dataFormatter.formatCellValue(cell);
    				rowValues.add(cellValue);
    			}
    			data.add(rowValues);
    			
          	}
        	
        	sheetName.add(i, sheet.getSheetName());
//        	System.out.println(sheet.getSheetName());
        }
        
//        for (Row row : sheet) {
//            List<String> rowValues = new ArrayList<>();
//            
//            for (Cell cell : row) {
//                String cellValue = dataFormatter.formatCellValue(cell);
//                rowValues.add(cellValue);
//            }
//            data.add(rowValues);
//        }
        workbook.close();
        
        // 모델에 데이터 전달
        model.addAttribute("sheetNum", sheetNum);
        model.addAttribute("sheetName", sheetName);
        model.addAttribute("sheet", sheet);
        model.addAttribute("data", data);
        model.addAttribute("dataSize", data.size());
        
        // index.html 뷰 렌더링
        return "usr/bus/bustime";
	}
	
	// 목록
	@RequestMapping("/usr/bus/list")
	public String showBusList(Model model, @RequestParam(defaultValue="1") int page,
			@RequestParam(defaultValue="busRoute,dayType") String searchType,
			@RequestParam(defaultValue="") String searchKeyword) {
		
		int bustimesCount = bustimeService.getBustimesCount(searchType, searchKeyword);
		
		// 페이징
		
		int itemsInAPage = 10;		// 한 페이지에 나오는 글 개수
		// 글 20개 -> 2
		// 글 24개 -> 3

		int pagesCount = (int) Math.ceil(bustimesCount / (double) itemsInAPage);

		List<Bustime> bustimes = bustimeService.getForPrintBustimes(itemsInAPage, page, searchType, searchKeyword);
		
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("page", page);
		model.addAttribute("pagesCount", pagesCount);
		model.addAttribute("bustimesCount", bustimesCount);
		model.addAttribute("bustimes", bustimes);
		
		return "usr/bus/list";
	}
		
	// 상세보기
	@RequestMapping("/usr/bus/detail")
	public String showBusDetail(Model model, String busRoute, String dayType) {
		
		List<Bustime> bustime = bustimeService.getForPrintBustime(busRoute, dayType);
		
		// 추천 여부 확인
//		ResultData actorCanMakeReactionRd = reactionPointService.actorCanMakeReaction(rq.getLoginedMemberId(), "article",
//				id);
		
		model.addAttribute("bustime", bustime);
//		model.addAttribute("actorCanMakeReaction", actorCanMakeReactionRd.isSuccess());
//		model.addAttribute("actorCanMakeReactionRd", actorCanMakeReactionRd);
		
		// 추천 불가 시
//		if (actorCanMakeReactionRd.getResultCode().equals("F-2")) {
//			// 로그인 된 회원 번호의 추천 point 가져옴
//			int sumReactionPointByMemberId = (int) actorCanMakeReactionRd.getData1();
//			
//			if (sumReactionPointByMemberId > 0) {
//				// 로그인 한 회원이 "좋아요"를 이미 누른 상태라면 "좋아요 취소" 보여주기
//				model.addAttribute("actorCanCancelGoodReaction", true);
//			} else {
//				// 로그인 한 회원이 "싫어요"를 이미 누른 상태라면 "싫어요 취소" 보여주기
//				model.addAttribute("actorCanCancelBadReaction", true);
//			}
//		}
		
		return "usr/bus/detail";
	}
}