<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MAIN" />
<%@ include file="../common/head.jspf"%>
<header>
  <div class="header-left">
    <div class="header-row">
      <div class=header-row-center>
        <h3 class="header-row-title">This is sideways</h3>
      </div>
      <div class="header-row-bottom">
        <button class="button-down">
          <i class="fas fa-arrow-down"></i>
        </button>
      </div>
    </div>
  </div>

  <div class="header-right">
    <div class="header-img-wrapper">
      <div class="header-title-wrapper">
        <h1>BUS SCHEDULE</h1>
      </div>
      <!-- <div class="header-img-overlay"></div> -->
      <div class="player-button-wrapper">
        <a href='#' class='play-but'>
          <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
          	xmlns:a="http://ns.adobe.com/AdobeSVGViewerExtensions/3.0/" x="0px" y="0px" width="213.7px" height="213.7px"
          	viewBox="0 0 213.7 213.7" enable-background="new 0 0 213.7 213.7" xml:space="preserve">
          <polygon class='triangle' id="XMLID_18_" fill="none" stroke-width="7" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" points="
	73.5,62.5 148.5,105.8 73.5,149.1 "/>
          <circle class='circle' id="XMLID_17_" fill="none"  stroke-width="7" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" cx="106.8" cy="106.8" r="103.3"/>
          </svg>
        </a>
      </div>
    </div>
  </div>
</header>