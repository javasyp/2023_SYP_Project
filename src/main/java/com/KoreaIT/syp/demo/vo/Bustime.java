package com.KoreaIT.syp.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Bustime {
	private int id;
	private String busRoute;
	private String departure1;
	private String departure2;
	private String dayType;
	private String company;
	private int interval;
	private String serviceDate;
	private String line;
	private String oneWay;
	private String startingPoint1_1;
	private String startingPoint1_2;
	private String startingPoint2_1;
	private String startingPoint2_2;
	private String startingPoint3_1;
	private String startingPoint3_2;
	private String startingPoint4_1;
	private String startingPoint4_2;
	private String startingPoint5_1;
	private String startingPoint5_2;
	private String startingPoint6_1;
	private String startingPoint6_2;
	private String startingPoint7_1;
	private String startingPoint7_2;
	private String startingPoint8_1;
	private String startingPoint8_2;
	private String startingPoint9_1;
	private String startingPoint9_2;
	private String startingPoint10_1;
	private String startingPoint10_2;
	private String note;
}
