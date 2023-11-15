<섹션 0/ 넷플릭스 UI 개발하기>

1. 네비게이션 탭이 있는 앱 프로젝트 구조 설정하기
   - model / screen / widget 폴더
   - 바텀 내비게이션 바 구조 만들기
2. 홈 화면에 상단 바 추가하기
   - homescreen StatefulWidget
   - mainaxisalignment.spacebetween 간격 조정
3. 영화 모델 만들고 더미 데이터 생성하기
   - class movie final 형태로 클래스 생성
   - dummy data 생성 후 샘플 movie 확인
4. 홈 화면에 이미지 캐로셀 슬라이더 위젯 추가하기
   - 디테일 페이지까지 띄워야 하므로 stateful widget
   - 캐로셀 슬라이더 패키지 설치
   - 재생 버튼 목록 버튼 생성
   - 인디케이터 listWidgetResults
5. 홈 화면에 원형 이미지 / 사각형 이미지 슬라이더 위젯 추가하기
   - scroll direction horizontal 좌우 스크롤
   - listResetMakeCircleImages
   - resultAddInkway
   - 박스슬라이더 생성
6. 상세 보기 화면 만들기
    - detailscreen 클래스 stateful widget
    - 영화에 대한 설명을 적는 부분은 Container에
    - 각 영화 widget을 클릭하면 디테일 스크린 나타나도록 만든다
7. 프로필 화면 만들기
    - morescreen 클래스 stateless widget
    - url-launcher 활용
    - 바로 실행하지 않는 기능들은 async await 통해 비등기 처리 

< 섹션 1/ 파이어베이스와 넷플릭스 UI 연동하기 >
1. 플러터와 파이어베이스 연동하기 -1) 파이어베이스 콘솔 설정
   - 환경 설정 후 파이어베이스 프로젝트 추가
   - 터미널 통해 구성 파일 다운로드
2. 플러터와 파이어베이스 연동하기 -2) 플러터 코드 작성하기
   - 파이어베이스와 플러터 연동하는 과정
   - 클라우드 파이어스토어 패키지, 코어 패키지 설치
   - 도큐먼트 레퍼런스 해당 데이터 칼럼 참조 링크
   - renewer progress indicator
3. 검색 화면 / 기능 만들기
   - searchscreenstate
   - 포커스 노드는 텍스트 에딧 위젯에 현재 커서가 있는지 상태를 가지고 있는 위젯
   - 서픽스 아이콘 onPressed
   - 검색 결과 함수 stream-builder
   - 위젯빌드 하단부 빌드바디 호출
4. 찜한 콘텐츠 화면 / 기능 만들기
   -likedscreenstate
   -데이터가 있는 경우 빌드 리스트 호출 -> 빌드 리스트 함수
   -buildListItem 함수

< 섹션 2/ 넷플릭스 UI 클론 코딩 마무리하기 >
2. (TIP) 앱 아이콘 변경하기
  - 앱 아이콘 제너레이터 사이트를 이용한다.
  - 기존에 있던 폴더를 지우고 새로 다운 받은 것을 리소스 폴더에 집어넣으면 된다.

<간단한 소감>
확실히 이해한 건진 모르겠지만 열심히 따라해보았숩니다...
아는 게 부족해 미니프로젝트를 잘 수행할 수 있을지 걱정되네요 ㅜㅜ
