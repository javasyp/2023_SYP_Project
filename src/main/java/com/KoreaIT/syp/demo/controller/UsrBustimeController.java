package com.KoreaIT.syp.demo.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.KoreaIT.syp.demo.service.BustimeService;
import com.KoreaIT.syp.demo.util.Ut;
import com.KoreaIT.syp.demo.vo.Bustime;
import com.KoreaIT.syp.demo.vo.Rq;

@Controller
public class UsrBustimeController {
	@Autowired
	private BustimeService bustimeService;
	@Autowired
	private Rq rq;
	
	@RequestMapping("/usr/bus/map")
	public String showMap(Locale locale, Model model) throws IOException {
//		StringBuilder urlBuilder = new StringBuilder("http://ws.bus.go.kr/api/rest/buspos/getLowBusPosByRtid");
//
//		urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=API키");
//
//		urlBuilder.append("&" + URLEncoder.encode("busRouteId","UTF-8") + "=" + URLEncoder.encode("100100118", "UTF-8")); 
//
//		URL url = new URL(urlBuilder.toString());
//
//		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//
//		conn.setRequestMethod("GET");
//
//		conn.setRequestProperty("Content-type", "application/xml;charset=UTF-8");
//		BufferedReader rd;
//
//		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
//
//			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//
//		} else {
//
//			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
//
//		}
//
//		StringBuilder sb = new StringBuilder();
//
//		String line;
//
//		while ((line = rd.readLine()) != null) {
//
//			sb.append(line);
//
//		}
//
//		rd.close();
//
//		conn.disconnect();
//		sb.toString();
//		
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
	
	@GetMapping("/getData")
	  public @ResponseBody List<Bustime> getData(String busRoute) {
	    // 데이터베이스에서 필요한 값 조회
		// 노선 검색 (출력용)
		List<Bustime> searchRoute = bustimeService.searchBusRoutes(busRoute);
	    return searchRoute;
	}
	
	
	// 버스 시간표 목록
	@RequestMapping("/usr/bus/list")
	public String showBusList(Model model, @RequestParam(defaultValue="1") int page,
			@RequestParam(defaultValue="") String busRoute,
			@RequestParam(defaultValue="") String dayType) {
		
		// 시간표 총 개수
		int bustimesCount = bustimeService.getBustimesCount(busRoute, dayType);
		
		// 페이징
		int itemsInAPage = 15;		// 한 페이지에 나오는 글 개수
		// 글 40개 -> 2
		// 글 44개 -> 3
		
		// 전체 페이지수
		int pagesCount = (int) Math.ceil( bustimesCount / (double) itemsInAPage);
		
		// 노선 검색 (출력용)
		List<Bustime> searchRoute = bustimeService.searchBusRoutes(busRoute);
		
		// 리스트로 저장
		List<Bustime> bustimes = bustimeService.getForPrintBustimes(itemsInAPage, page, busRoute, dayType);
		
		// 현재 페이지가 범위를 벗어나지 않도록 처리
	    if (page < 1) {
	    	return rq.jsHistoryBackOnView(Ut.f("%d번 페이지는 존재하지 않습니다.", page));
	    } else if (page > pagesCount) {
	        page = pagesCount;
	    }
		
		// usr/bus/list.jsp로 값 전달
	    model.addAttribute("searchRoute", searchRoute);
		model.addAttribute("busRoute", busRoute);
		model.addAttribute("dayType", dayType);
		model.addAttribute("page", page);
		model.addAttribute("pagesCount", pagesCount);
		model.addAttribute("bustimesCount", bustimesCount);
		model.addAttribute("bustimes", bustimes);
		
		return "usr/bus/list";
	}
		
	// 버스 시간표 상세보기
	@RequestMapping("/usr/bus/detail")
	public String showBusDetail(Model model, String busRoute, String dayType) {
		
		// 해당 버스의 시간표 값 가져오기 (결과가 여러개이기 때문에 list로 받아옴)
		List<Bustime> bustime = bustimeService.getForPrintBustime(busRoute, dayType);
		
		// 해당 버스의 시간표를 제외한 값 가져오기
		Bustime bus = bustimeService.getForPrintBus(busRoute, dayType);
		
		// 추천 여부 확인
//		ResultData actorCanMakeReactionRd = reactionPointService.actorCanMakeReaction(rq.getLoginedMemberId(), "article",
//				id);
		
		// usr/bus/detail.jsp로 값 전달
		model.addAttribute("bustime", bustime);
		model.addAttribute("bus", bus);
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