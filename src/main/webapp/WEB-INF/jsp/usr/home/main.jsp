<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MAIN" />

<style>
/* -
-*-~*~-*-*-~*~-*-*-~*~* |
●▬▬▬▬▬▬▬๑۩۩๑▬▬▬▬▬▬▬●
Made by ~
Areal Alien ❥ 雷克斯
●▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬●
──────▄▀▄─────▄▀▄
─────▄█░░▀▀▀▀▀░░█▄
─▄▄──█░░░░░░░░░░░█──▄▄
█▄▄█─█░░▀░░┬░░▀░░█─█▄▄█
-*-~*~-*-*-~*~-*-*-~*~* |
- */
:root {
  --bc: #14121c;
  --bc-gray: #0e0d10;
  --white: #ffffff;
	--black: #000000;
	--dark-blue: #1f2029;
  --extra-dark-blue: #13141a;
	--dark-light: #424455;
	--red: #da2c4d;
  --dark-red: #6e1727;
	--yellow: #f8ab37;
	--grey: #ecedf3;
	--blue: #007bff;
	--indigo: #6610f2;
	--purple: #6f42c1;
	--pink: #e83e8c;
	--orange: #fd7e14;
	--green: #28a745;
  --light-green: #24e33a;
	--teal: #20c997;
	--cyan: #17a2b8;
	--gray: #6c757d;
	--gray-dark: #343a40;
	--primary: #f9c6cf;
	--secondary: #6c757d;
	--success: #28a745;
	--info: #17a2b8;
	--warning: #ffc107;
	--danger: #dc3545;
	--light: #f8f9fa;
  --light-gray: #ebecf2;
	--dark: #343a40;
	--font-family-sans-serif: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,"Noto Sans",sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";
	--font-family-monospace: SFMono-Regular,Menlo,Monaco,Consolas,"Liberation Mono","Courier New",monospace;
}
* {
	box-sizing: border-box;
}
html, body {
	margin: 0;
  width: 100%;
  min-height: 100vh;
	overflow-x: hidden;
	font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,"Noto Sans",sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";
  scroll-behavior: smooth;
	-webkit-font-smoothing: antialiased;
  background-color: #1e1e1e;
}
nav {
  top: 0;
  max-height: 15vh;
  position: absolute;
  z-index: 130;
}
header {
  position: relative;
  height: 100vh;
}
main {
  position: relative;
  min-height: 100vh;
  background-color: #1e1e1e;
  z-index: 10;
}
#navbar {
  heihgt: 15vh;
  display: flex;
  justify-content: center;
  align-items: center;
}
.navbar-left {
  width: 10vw;
  display: inline-block;
}
.navbar-button {
  position: fixed;
  top: 0;
  margin: 0;
  width: 10%;
  height: 15vh;
  border: none;
  color: var(--white);
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: var(--primary);
  border-bottom-right-radius: 25px;
  cursor: pointer;
  transition: all .3s cubic-bezier(.175,.885,.32,1.275);
}
.navbar-button:hover {
  border-bottom-right-radius: 50px;
}
.navbar-button:focus {
  outline: none;
}
.navbar-right {
  height: 15vh;
  width: calc(100% - 10vw);
  display: inline-block;
}
#nav-icon3 {
    width: 30px;
    height: 30px;
    position: relative;
    display: block;
    margin: 0;
    -webkit-transform: rotate(0deg);
    -moz-transform: rotate(0deg);
    -o-transform: rotate(0deg);
    transform: rotate(0deg);
    -webkit-transition: .5s ease-in-out;
    -moz-transition: .5s ease-in-out;
    -o-transition: .5s ease-in-out;
    transition: .5s ease-in-out;
    cursor: pointer;
    z-index: 135;
}
#nav-icon3 span {
    display: block;
    position: absolute;
    height: 4px;
    width: 100%;
    background: #ab858c;
    border-radius: 9px;
    opacity: 1;
    left: 0;
    -webkit-transform: rotate(0deg);
    -moz-transform: rotate(0deg);
    -o-transform: rotate(0deg);
    transform: rotate(0deg);
    -webkit-transition: .25s ease-in-out;
    -moz-transition: .25s ease-in-out;
    -o-transition: .25s ease-in-out;
    transition: .25s ease-in-out;
}
#nav-icon3 span:nth-child(1) {
    top: 0;
}
#nav-icon3 span:nth-child(2),#nav-icon3 span:nth-child(3) {
    top: 10px;
}
#nav-icon3 span:nth-child(4) {
    top: 20px;
}
#nav-icon3.open span:nth-child(1) {
    top: 18px;
    width: 0;
    left: 50%;
}
#nav-icon3.open span:nth-child(2) {
    -webkit-transform: rotate(45deg);
    -moz-transform: rotate(45deg);
    -o-transform: rotate(45deg);
    transform: rotate(45deg);
}
#nav-icon3.open span:nth-child(3) {
    -webkit-transform: rotate(-45deg);
    -moz-transform: rotate(-45deg);
    -o-transform: rotate(-45deg);
    transform: rotate(-45deg);
}
#nav-icon3.open span:nth-child(4) {
    top: 18px;
    width: 0;
    left: 50%;
}
/* Menu */
.menu {
  top: 0;
  display: none;
  position: fixed;
  overflow: hidden;
  width: 30%;
  height: 100%;
  z-index: 125;
}
.menu-bc {
  position: absolute;
  background-color: var(--primary);
  border-radius: 50%;
  width: 0;
  height: 0;
}
.menu-items {
  position: relative;
  list-style-type: none;
  margin: 18vh 3em 0 3em;
  padding: 0;
  opacity: 0;
  z-index: 275;
}
.menu-item-wrapper {
  padding: 0;
  margin: 1em;
  color: #ab858c;
  font-size: 150%;
  cursor: pointer;
  transition: color .2s ease-in-out;
}
.menu-item-wrapper:hover {
  color: #c99da5;
}
.menu-item-wrapper i {
  margin: 0 .75em 0 0;
}
.menu-item {
}
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
  color: var(--primary);
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
  background-image: url('https://images.unsplash.com/photo-1520350094754-f0fdcac35c1c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80');
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
  stroke: var(--primary);
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
	stroke: var(--primary);
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
/* Selection */
::selection {
  color: var(--white);
  background: var(--primary);
}
/* SCROLLBAR */
::-webkit-scrollbar-track {
      background-color: #F5F5F5;
}
::-webkit-scrollbar {
      width: 12px;
      background-color: #F5F5F5;
}
::-webkit-scrollbar-thumb {
      background-color: var(--primary);
}
@keyframes fade {
  0% {
    opacity: 0;
  }
  100% {
    opacity: 1;
  }
}
@keyframes fade2 {
  0% {
    opacity: 1;
  }
  100% {
    opacity: 0;
  }
}
@keyframes fadein {
  0% {
    background-color: rgba(0, 0, 0, 0);
  }
  100% {
    background-color: rgba(0, 0, 0, .5);
  }
}
@keyframes fadeout {
  0% {
    background-color: rgba(0, 0, 0, .5);
  }
  100% {
    background-color: rgba(0, 0, 0, 0);
  }
}
@keyframes menu {
  0% {
    width: 0;
    height: 0;
    top: 0;
    left: 0;
  }
  100% {
    width: 250%;
    height: 130%;
    top: -10%;
    left: -50%;
  }
}
@keyframes menu2 {
  0% {
    width: 250%;
    height: 130%;
    top: -10%;
    left: -50%;
  }
  100% {
    width: 0;
    height: 0;
    top: 0;
    left: 0;
  }
}
@keyframes menu-items {
  0% {
    opacity: 0;
  }
  100% {
    opacity: 1;
  }
}
@keyframes menu-items2 {
  0% {
    opacity: 1;
  }
  100% {
    opacity: 0;
  }
}
</style>
<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
var delayInShortMilliseconds = 350;
var delayInMilliseconds = 500;

$('.navbar-button').on('click', '', function() {
  
  if($("#nav-icon3").hasClass('open')) {
    $('#nav-icon3').toggleClass('open');
    $('.menu-bc').css('animation', 'menu2 .35s ease-in-out forwards');
    $('.menu-items').css('animation', 'menu-items2 .25s ease-in-out forwards');
    setTimeout(function() {
      $('.menu').css('display', 'none');
    }, delayInShortMilliseconds);
  } else {
    $('#nav-icon3').toggleClass('open');
    $('.menu-bc').css('animation', 'menu .35s ease-in-out forwards');
    $('.menu').css('display', 'block');
    $('.menu-items').css('animation', 'menu-items .25s .2s ease-in-out forwards');
  }
  
});

$(document).ready(function() {
$(".button-down").click(function() {
     $('html, body').animate({
         scrollTop: $(".scroll1").offset().top + (0)
     }, 750);
 });
});

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
<nav id="navbar">
  <div class="navbar-left">
    <button id="navbar-btn" class="navbar-button">
        <div id="nav-icon3">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
        </div>
    </button>
  </div>
  <div class="navbar-right">
  </div>
</nav>
<div class="menu">
  <ul class="menu-items">
    <li class="menu-item-wrapper"><i class="fas fa-asterisk"></i><a class="menu-item">Item 1</a></li>
    <li class="menu-item-wrapper"><i class="fas fa-asterisk"></i><a class="menu-item">Item 2</a></li>
    <li class="menu-item-wrapper"><i class="fas fa-asterisk"></i><a class="menu-item">Item 3</a></li>
  </ul>
  <div class="menu-bc"></div>
</div>
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
        <h1>Title</h1>
      </div>
      <div class="header-img-overlay"></div>
      <div class="player-button-wrapper">
        <a href='#'class='play-but'>
          <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:a="http://ns.adobe.com/AdobeSVGViewerExtensions/3.0/" x="0px" y="0px" width="213.7px" height="213.7px" viewBox="0 0 213.7 213.7" enable-background="new 0 0 213.7 213.7" xml:space="preserve">
          <polygon class='triangle' id="XMLID_18_" fill="none" stroke-width="7" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" points="
	73.5,62.5 148.5,105.8 73.5,149.1 "/>
          <circle class='circle' id="XMLID_17_" fill="none"  stroke-width="7" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" cx="106.8" cy="106.8" r="103.3"/>
          </svg>
        </a>
      </div>
    </div>
  </div>
</header>
<div class="video-modal-wrapper">
  <iframe class="video-modal" src="#" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>
<main class="scroll1">

</main>