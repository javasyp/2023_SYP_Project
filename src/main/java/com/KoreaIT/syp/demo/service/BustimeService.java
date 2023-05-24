package com.KoreaIT.syp.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KoreaIT.syp.demo.repository.BustimeRepository;
import com.KoreaIT.syp.demo.vo.Article;
import com.KoreaIT.syp.demo.vo.Bustime;
import com.KoreaIT.syp.demo.vo.Rq;

@Service
public class BustimeService {
	
	@Autowired
	private BustimeRepository bustimeRepository;
	@Autowired
	private Rq rq;

	public BustimeService(BustimeRepository bustimeRepository) {
		this.bustimeRepository = bustimeRepository;
	}
	
	// 버스 시간표 목록
	public List<Bustime> getForPrintBustimes(int itemsInAPage, int page, String busRoute, String dayType) {
		int limitFrom = (page - 1) * itemsInAPage;
		int limitTake = itemsInAPage;
		
		return bustimeRepository.getForPrintBustimes(limitFrom, limitTake, busRoute, dayType);
	}
	
	// 버스 시간표 개수
	public int getBustimesCount(String searchType, String searchKeyword) {
		return bustimeRepository.getBustimesCount(searchType, searchKeyword);
	}
	
	// 버스 시간표 상세보기 (시간표만) (권한 체크)
	public List<Bustime> getForPrintBustime(String busRoute, String dayType) {
		List<Bustime> bustime = bustimeRepository.getForPrintBustime(busRoute, dayType);

//		controlForPrintData(actorId, article);

		return bustime;
	}
	
	// 버스 시간표 상세보기 (노선 정보만)
	public Bustime getForPrintBus(String busRoute, String dayType) {
		Bustime bus = bustimeRepository.getForPrintBus(busRoute, dayType);
		
		return bus;
	}
	
	// 검색
	public List<Bustime> searchBusRoutes(String busRoute) {
		List<Bustime> searchBus = bustimeRepository.searchBusRoutes(busRoute);
		
		return searchBus;
	}
	
//	// 게시물 조회수 증가시키기
//	public ResultData increaseHitCount(int id) {
//		int affectedRow = bustimeRepository.increaseHitCount(id);
//
//		if (affectedRow == 0) {
//			return ResultData.from("F-1", "해당 게시물은 없습니다.", "affectedRow", affectedRow);
//		}
//
//		return ResultData.from("S-1", "조회수 증가", "affectedRowRd", affectedRow);
//	}
//	
//	// 조회수 값 가져오기
//	public int getArticleHitCount(int id) {
//		return bustimeRepository.getBustimeHitCount(id);
//	}

	
}
