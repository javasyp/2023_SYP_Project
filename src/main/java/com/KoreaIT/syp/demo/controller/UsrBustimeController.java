package com.KoreaIT.syp.demo.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.jcp.xml.dsig.internal.dom.Utils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UsrBustimeController {
	
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
    			
    			System.out.print("|	" + x + " |");
    			
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
        model.addAttribute("data", data);
        model.addAttribute("dataSize", data.size());
        
        // index.html 뷰 렌더링
        return "usr/bus/bustime";
	}
	
	@RequestMapping("/usr/bus/bustime2")
	public String showBusTime2()  {
		return "";
	}
}