# 차량 렌탈 서비스 웹 애플리케이션

*인프런 소프트캠퍼스 JSP 강의를 수강하고 만든 개인 프로젝트입니다.*

이 프로젝트는 차량 렌탈 서비스를 위한 웹 애플리케이션입니다. 사용자는 차량 검색을 통해 여러 차량 정보를 조회할 수 있으며 원하는 차량을 해당 옵션에 맞게 렌트할 수 있습니다. 또한 사용자는 게시판을 통해 차량 렌탈 정보와 관련된 게시글을 작성하고, 조회할 수 있습니다. 게시글 작성자는 이름, 이메일, 비밀번호, 그리고 차량에 대한 내용을 입력하여 글을 올릴 수 있으며, 다른 사용자는 게시글을 조회할 수 있습니다.

## 주요 기능

- **예약 기능**: 사용자는 차량을 선택하고 대여기간, 대여일, 보험적용, 와이파이 적용 등의 옵션을 선택할 수 있습니다. 로그인된 회원만 렌트카 예약이 가능합니다.
- **예약 확인**: 사용자는 예약한 차량을 조회할 수 있으며 선택한 옵션을 확인할 수 있습니다. 단 이때 로그인이 되어 있지 않다면 조회할 수 없습니다.
- **회원 게시판 기능**: 사용자는 글을 작성하고, 글을 수정하거나 삭제할 수 있습니다.
- **디자인 및 사용자 인터페이스**: 직관적인 디자인으로 사용자 경험을 개선하고, 다양한 화면 크기에 적응하는 반응형 디자인을 채택했습니다.

## 기술 스택

- **JSP (Java Server Pages)**: 서버 측 템플릿 엔진으로 페이지를 동적으로 생성합니다.
- **Java**: 서버 로직과 데이터베이스 연동을 처리합니다.
- **MySQL**: 데이터베이스 시스템으로 게시글 데이터를 저장합니다.
- **CSS**: 웹 페이지의 디자인과 스타일을 담당합니다. 

<img width="572" alt="스크린샷 2024-11-18 오후 4 54 20" src="https://github.com/user-attachments/assets/5ecf1894-54e9-4df9-a476-536a01a22ee9">
<img width="699" alt="main" src="https://github.com/user-attachments/assets/c9b221af-285d-4c88-a359-95fec92edb4f" width="100">

<img width="697" alt="carreserveinfo" src="https://github.com/user-attachments/assets/c85b1fd1-4f2f-4ce1-b269-8767c8d654a0" width="100">
<p align="center"><i>사진 설명: 차량 예약 정보 화면</i></p>

<img width="553" alt="carreserveselect" src="https://github.com/user-attachments/assets/3bb54b7e-0585-40f5-97d3-683fe9d06318" width="100">
<img width="673" alt="reservelist" src="https://github.com/user-attachments/assets/d57bfd58-fa32-4880-a010-d165ede18811" width="100">
<img width="700" alt="boardlist" src="https://github.com/user-attachments/assets/8cdb9104-b6db-4187-9d11-8dbf3e0405c8" width="100">
<img width="640" alt="boardinfo" src="https://github.com/user-attachments/assets/f3d86461-0526-4abd-89ad-a192df736ad6" width="100">
<img width="677" alt="login" src="https://github.com/user-attachments/assets/1c767a8d-dfc9-4c90-ac3d-96e758ef1a42" width="100">
