#Chapter 2. Flutter

vscode에서 작업하면 class 마다 , 을 찍으면 보기 좋음
vscode에서 class에 커서를 올리면 그 class가 나오는데 variable중 ?가 있으면 required가 아님
?가 없으면 required이므로 필수로 넘겨야 하는 인자


1. Widget
- flutter의 기본 단위 // 프로그래밍에선 그냥 class라고 생각

- StatelessWidget // class임, 버튼 없이 단순하게 화면만 띄우는 역할
	build // class의 method, Widget의 UI를 만듦

- runApp(~~~) // 이걸로 실행하는 widget은 앱의 root임 (root Widget) 
	여기서 return 값은 1. MaterialApp(구글)  2. CupertinoApp(iOS) // 앱이 어떤 family인지 확인하는 것
		MaterialApp 에 home이라는 widget을 argument로 넘김
			home 에 Scaffold라는 widget assign
				Scaffold에 appBar, body 를 argument로 넘김
					appBar에는 AppBar 를 assign
					body에는 Center 를 assign

- App은 화면이 scaffold(철근)을 가져야 함 // 화면의 각종 구성요서 (버튼, 텍스트, 탑바,,,,,)
	Scaffold(~~)

- Constant : 값을 수정할 수 없고 컴파일 전 value를 이미 알고 있어 메모리를 따로 만들지 않음 
>>> 최적화에 큰 도움

 

Column // 수직방향으로 배치할 때 사용
Row // 수평방향으로 배치할 때 사용
	MainAxis : row에선 수평 column에선 수직으로 이동
	CrossAxis MainAxis와 반대로 이동

SizedBox – 간격을 주기 위해 사용

Colors.~~ - 선택 가능
Color(0xFF~~~) // 0xFF 는 16진법

Container // child가 있는 box


 

	vscode – debug tool에서 가장 오른쪽 돋보기 – 화면 가이드라인 제공
가이드라인 화면 우측 상단에 마우스 모양 – 시뮬레이터랑 연계 가능 (클릭 앤 드래그로 하면 바로 보임)
|<->| 이 버튼은 widget 위치를 다 보여줌


	화면 좌측 하단에 톱니 >> command palette >> ‘open user settings’ 
>> “editor.codeActionsOnSave” : {
	“source.fixAll”: true
}, // 자동으로 constant값을 const로 변경
>>”dart.previewFlutterUiGuides”: true, // Tree형식으로 class의 관계를 알려줌


	widget 클릭 >> 좌측에 전구모양 >> 그 위젯을 다른 위젯으로 wrap up 가능 ! 제거도 가능
widget에 커서 >> ctrl + . >> 같은 동작 가능
extract로 하면 따로 객체를 만들어주는 기능도 있음

오류에 커서 >> quick fix 사용도 유용함


# 소감

vscode를 활용한 단축키, 환경 설정등 세세하게 나와서 정말 좋다

생각보다 위젯 배치하는게 재밌당
