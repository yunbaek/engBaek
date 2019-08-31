<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>     
<%@ taglib prefix="sec" 
         uri="http://www.springframework.org/security/tags"%>      
<!DOCTYPE html>
<html lang="kor">
<head>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta charset="utf-8">
  <title>Baek 어학원</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Favicons -->
  <link href="../../../resources/img/favicon.png" rel="icon">
  <link href="../../../resources/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="../../../resources/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="../../../resources/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="../../../resources/lib/animate/animate.min.css" rel="stylesheet">
  <link href="../../../resources/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="../../../resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="../../../resources/css/style.css" rel="stylesheet">
  
  
  <!-- JavaScript Libraries -->
  <script src="../../../resources/lib/jquery/jquery.min.js"></script>
  <script src="../../../resources/lib/jquery/jquery-migrate.min.js"></script>
  <script src="../../../resources/lib/popper/popper.min.js"></script>
  <script src="../../../resources/lib/bootstrap/js/bootstrap.min.js"></script>
  <script src="../../../resources/lib/easing/easing.min.js"></script>
  <script src="../../../resources/lib/owlcarousel/owl.carousel.min.js"></script>
  <script src="../../../resources/lib/scrollreveal/scrollreveal.min.js"></script>
  <!-- Contact Form JavaScript File -->
  <script src="../../../resources/contactform/contactform.js"></script>

  <!-- Template Main Javascript File -->
  <script src="../../../resources/js/main.js"></script>
  

</head>

<body>

  <!--/ Nav Star /-->
  <nav class="navbar navbar-default navbar-trans navbar-expand-lg fixed-top">
    <div class="container">
      <a class="navbar-brand text-brand" href="/">English<span class="color-b">Baek</span></a>
      <button type="button" class="btn btn-link nav-search navbar-toggle-box-collapse d-md-none" data-toggle="collapse"
        data-target="#navbarTogglerDemo01" aria-expanded="false">
        <span class="fa fa-search" aria-hidden="true"></span>
      </button>
      <div class="navbar-collapse collapse justify-content-center" id="navbarDefault">
        <ul class="navbar-nav">
          <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="../#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">학원안내</a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="/about/about">학원소개</a>
              <a class="dropdown-item" href="/about/contact">오시는 길</a>
              <a class="dropdown-item" href="/about/history">학원연혁</a>
              <a class="dropdown-item" href="/about/facilities">편의시설</a>
            </div>
          </li>
          <li class="nav-item dropdown">
   <a class="nav-link dropdown-toggle" href="../#.html" id="navbarDropdown" role="button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">강의소개</a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="/profile/list">강사소개</a>
            <a class="dropdown-item" href="/course/list">강좌소개</a>
         </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/review/list">수강후기</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/blog-grid.html">레벨테스트</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="../#" id="navbarDropdown" role="button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">
              학습운영센터
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="/notice/list">공지사항</a>
              <a class="dropdown-item" href="/faq/list">FAQ</a>
              <a class="dropdown-item" href="/refundInfo/refundInfo">환불규정</a>
            </div>
          </li>
          <li>
          <span>　　</span>
          <small>
          <sec:authorize access="isAnonymous()">
          <a href="/member/customLogin">로그인</a>｜
          </sec:authorize>
          <sec:authorize access="isAuthenticated()">
          <a href="/member/customLogout">로그아웃</a>｜
          </sec:authorize>
          <a href="/join/join1">회원가입</a>｜
          <a href="/member/member">마이페이지</a>
          </small>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <!--/ Nav End /-->