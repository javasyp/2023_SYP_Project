<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MAIN" />
<%@ include file="../common/head.jspf"%>
<style>
/* HEADER */
.header-left {
  position: absolute;
  display: flex;
  justify-content: center;
  align-items: center;
  width: 10%;
  height: 100%;
  z-index: 50;
}
.header-row {
  width: 10vw;
  height: 100%;
  display: inline-block;
}
.header-row-center {
  height: 70%;
  display: flex;
  justify-content: center;
  align-items: center;
}
.header-row-title {
  margin: 10vh 0 0 0;
  color: var(--white);
  font-size: 95%;
  writing-mode: vertical-rl;
  text-orientation: mixed;
  letter-spacing: .5em;
  font-weight: 300;
  text-transform: uppercase;
}
.header-row-bottom {
  height: 30%;
}

.button-down {
  width: 100%;
  height: 100%;
  color: var(--white);
  background-image: linear-gradient(to top, #1e1e1e, transparent);
  background-color: transparent;
  border: none;
  cursor: pointer;
  transition: all .2s ease-in-out;
}
.button-down:hover {
  color: var(--light-gray);
}
.button-down:focus {
  outline: none;
}
.header-right {
  position: relative;
  height: 100%;
  width: 100%;
}
.header-img-wrapper {
  position: relative;
  width: 100%;
  height: 100%;
  overflow: hidden;
  background-size: cover;
  background-position: center;
  background-image: url('/resource/bus.jpg');
}
.header-img-overlay {
  top: 0;
  width: 100%;
  height: 100%;
  position: absolute;
  background-color: rgba(0, 0, 0, .4);
}
.header-title-wrapper {
  position: absolute;
  width: 100%;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
}
.header-title-wrapper h1 {
  font-size: 750%;
  color: var(--white);
  text-transform: uppercase;
  z-index: 10;
}
/* Player Button */
.player-button-wrapper {
  position: absolute;
  bottom: 0;
  right: 0;
  margin: 0;
}
.circle {
  stroke: var(--light-gray);
  stroke-dasharray: 650;
  stroke-dashoffset: 650;
  -webkit-transition: all .5s ease-in-out;
  opacity: 0.3;
}
.play-but {
  transform: scale(.5, .5);
  display: inline-block;
  -webkit-transition: all .5s ease;
}
.play-but .triangle {
  -webkit-transition: all .7s ease-in-out;
  stroke-dasharray: 240;
  stroke-dashoffset: 480;
  stroke: var(--white);
  transform: translateY(0) 
}
.play-but:hover .triangle {
  stroke-dashoffset: 0;
	opacity: 1;
	stroke: var(--gray);
	animation: nudge .7s ease-in-out;
}
.play-but:hover .circle {
	stroke-dashoffset: 0;
	opacity: 1;
}
/* Video Modal */
.video-modal-wrapper {
  top: 0;
  width: 100%;
  height: 100%;
  position: fixed;
  display: none;
  justify-content: center;
  align-items: center;
  z-index: 150;
  background-color: rgba(0, 0, 0, .75);
}
.video-modal {
  width: 75%;
  height: 75%;
}
</style>
<script>
$('.play-but').click(function(){
  
  $('.video-modal-wrapper').css("display", "flex");
  $(".video-modal-wrapper").css("animation", "fadein .3s ease-in-out forwards");
  $(".video-modal").css("animation", "fade .3s ease-in-out forwards");
  
  setTimeout(function() {
      $(".video-modal-wrapper").css("", "");
    }, delayInMilliseconds);
});

$('.video-modal-wrapper').click(function(){
  $('.video-modal-wrapper').css("animation", "fadeout .3s ease-in-out forwards");
  $('.video-modal').css("animation", "fade2 .3s ease-in-out forwards");
  
  setTimeout(function() {
      $('.video-modal-wrapper').css("display", "none");
    }, delayInMilliseconds);
});
</script>
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
        <h1>DAEJEON<br>BUS SCHEDULE</h1>
      </div>
      <!-- <div class="header-img-overlay"></div> -->
      <div class="player-button-wrapper">
        <a href='/usr/bus/list' class='play-but'>
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