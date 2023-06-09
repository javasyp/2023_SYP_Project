# DB 생성
DROP DATABASE IF EXISTS SYP_Project;
CREATE DATABASE SYP_Project;
USE SYP_Project;

# 버스스케줄 테이블 생성
CREATE TABLE busSchedule(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    busRoute CHAR(20) COMMENT '노선번호', 
    departure1 CHAR(20) COMMENT '출발지1',
    departure2 CHAR(20) COMMENT '출발지2',
    dayType CHAR(10) COMMENT '운행일',
    company CHAR(30) COMMENT '운행사',
    `interval` CHAR(10) COMMENT '평균배차간격',
    oneWay CHAR(10) COMMENT '편도',
    serviceDate CHAR(50) COMMENT '시행일',
    line CHAR(10) COMMENT '구분',
    startingPoint1_1 CHAR(20) COMMENT '기점1-1',
    startingPoint1_2 CHAR(20) COMMENT '기점1-2',
    startingPoint2_1 CHAR(20) COMMENT '기점2-1',
    startingPoint2_2 CHAR(20) COMMENT '기점2-2',
    startingPoint3_1 CHAR(20) COMMENT '기점3-1',
    startingPoint3_2 CHAR(20) COMMENT '기점3-2',
    startingPoint4_1 CHAR(20) COMMENT '기점4-1',
    startingPoint4_2 CHAR(20) COMMENT '기점4-2',
    startingPoint5_1 CHAR(20) COMMENT '기점5-1',
    startingPoint5_2 CHAR(20) COMMENT '기점5-2',
    startingPoint6_1 CHAR(20) COMMENT '기점6-1',
    startingPoint6_2 CHAR(20) COMMENT '기점6-2',
    startingPoint7_1 CHAR(20) COMMENT '기점7-1',
    startingPoint7_2 CHAR(20) COMMENT '기점7-2',
    startingPoint8_1 CHAR(20) COMMENT '기점8-1',
    startingPoint8_2 CHAR(20) COMMENT '기점8-2',
    startingPoint9_1 CHAR(20) COMMENT '기점9-1',
    startingPoint9_2 CHAR(20) COMMENT '기점9-2',
    startingPoint10_1 CHAR(20) COMMENT '기점10-1',
    startingPoint10_2 CHAR(20) COMMENT '기점10-2',
    note TEXT COMMENT '비고'
);

# 회원 테이블 생성
CREATE TABLE `member`(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    loginId CHAR(20) NOT NULL,
    loginPw CHAR(100) NOT NULL,
    `authLevel` SMALLINT(2) UNSIGNED DEFAULT 3 COMMENT '권한 레벨 (3=일반, 7=관리자)',
    nickname CHAR(20) NOT NULL,
    email CHAR(50) NOT NULL,
    delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '탈퇴 여부 (0=탈퇴 전, 1=탈퇴 후)',
    delDate DATETIME COMMENT '탈퇴 날짜'
);

#############################################################

SELECT * FROM busSchedule;

SELECT DISTINCT busRoute FROM busSchedule WHERE line = '';

SELECT DISTINCT busRoute, dayType FROM busSchedule WHERE line = '';

SELECT * FROM busSchedule WHERE line = '';