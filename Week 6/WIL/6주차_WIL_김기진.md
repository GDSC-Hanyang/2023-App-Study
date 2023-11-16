#Chapter 6

GestureDetector : 동작 감지 widget
	onTap : onTapUp과 onTapDown 조합 (버튼 클릭 감지)
		onTapUp
		onTapDown

Navigator : screen을 바꾸는 역할
	Route : stateless widget을 애니메이션 효과로 감싸 스크린처럼 보이도록 함

MaterialPageRoute : stateless widget을 route로 감싸 다른 스크린처럼 보이게 하는 class

Hero : 애니메이션 효과 관련 위젯
	두 스크린에 Hero 위젯을 추가하고 각 위젯에 같은 태그를 주면 사용 가능


url_launcher : flutter에서 브라우저를 열 수 있게 하는 패키지
	await launchUrl(‘특정 Uri 데이터’) 
	await launchUrlString(‘url 절대주소’)  // 두 방식을 통해서 url을 열 수 있음

shared_preferences : 저장소에 하도록 하는 패키지
	await SharedPreferences.getInstance() // 기기 저장소의 엑세스를 얻음, 이 과정에서 통신 시간이 걸리므로 await를 사용함을 볼 수 있음
	~.getStringList(‘StringList이름’) // 저장소에서 StringList 형의 StringList이름 을 받아옴
	~.setStringList(‘StringList이름’, ‘저장할 data’) // 저장소에 StringList 형의 StringList이름에 data를 저장함 
 
url_launcher, shared_preferences 등 여러 flutter package >>> flutter pub에 있음
