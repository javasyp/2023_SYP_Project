package com.KoreaIT.syp.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Bustime {
	private int id;
	private String busRoute;				// 노선번호
	private String departure1;				// 출발지1
	private String departure2;				// 출발지2
	private String dayType;					// 운행일
	private String company;					// 운행사
	private String interval;				// 평균배차간격
	private String serviceDate;				// 편도
	private String line;					// 시행일
	private String oneWay;					// 구분
	private String startingPoint1_1;		// 기점1-1
	private String startingPoint1_2;		// 기점1-2
	private String startingPoint2_1;		// 기점2-1
	private String startingPoint2_2;		// 기점2-2
	private String startingPoint3_1;		// 기점3-1
	private String startingPoint3_2;		// 기점3-2
	private String startingPoint4_1;		// 기점4-1
	private String startingPoint4_2;		// 기점4-2
	private String startingPoint5_1;		// 기점5-1
	private String startingPoint5_2;		// 기점5-2
	private String startingPoint6_1;		// 기점6-1
	private String startingPoint6_2;		// 기점6-2
	private String startingPoint7_1;		// 기점7-1
	private String startingPoint7_2;		// 기점7-2
	private String startingPoint8_1;		// 기점8-1
	private String startingPoint8_2;		// 기점8-2
	private String startingPoint9_1;		// 기점9-1
	private String startingPoint9_2;		// 기점9-2
	private String startingPoint10_1;		// 기점10-1
	private String startingPoint10_2;		// 기점10-2
	private String note;					// 비고
}
