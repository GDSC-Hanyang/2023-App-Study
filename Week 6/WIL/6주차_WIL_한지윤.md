# 6.9 Detail Screen
- Gesture Detector : 유저의 클릭을 감지한다
- onTap: onTapUp + onTapDown
- 네비게이터를 쓰면 애니메이션 효과를 통해 유저가 다른 페이지로 왔다고 느끼게 해줄 수 있다.
- Fullscreendialog 옵션을 적용시켜서 표지가 바닥에서부터 올라오는 애니메이션을 만들었다.

# 6.10 Hero
- 히어로 위젯은 화면을 전환할 때 유용한 애니메이션을 제공해 준다.
- 히어로위젯을 두 개의 화면에 각각 적용하고 각각의 위젯에 같은 태그를 주기만 하면 된다.

# 6.12 ApiService
- 기준의 웹툰모델에서는 정보가 타이틀 썸네일 아이디밖에 없었기 때문에, Webtoon_detail_model 다트 파일을 만들었다.
- Static method가 webtoondetailmodel을 return할 수 있도록 해주었다.
- 긴 리스트를 반환해야 하기 때문에 에피소드들을 json으로 decode하는 과정이 필요했다.

# 6.13 Futures
- Statefulwidget을 쓸 때에는 Widget.thumb, widget.title 등으로 리팩토링해주어야 한다.
- initstate 메서드에서 define해줄 수 있도록 late modifier을 활용해 만들어서 future를 초기화할 수 있도록 해주었다.

# 6.14 Detail Info
- 디테일스크린의 UI를 만들기 위해 Futurebuilder을 활용했다.

# 6.15 Episodes
- Listview나 Column을 활용할 수 있다.
- chevron 아이콘은 '>' 기호를 의미한다.

# 6.16 Url Launcher
- launchUrl은 future을 가져다주는 Function이기 때문에, await과 async을 코드에 적어주었다.
- 사용자가 버튼을 눌렀을 때 해당 웹툰id와 해당 episode를 읽어오도록 한다.

# 6.17
- 여기서 widget.id를 사용하는 이유는 지금 이곳이 state이고,우리는 statefulwidget인 detailscreen의 id를 가져오기 위해서이다.
- onHeartTap을 onPressed 아이콘 버튼에 담아준다.
- favorite는 꽉 찬 하트, favorite_ouline은 하트 외곽선을 뜻한다.
- 앱을 다시 실행해도 정보가 기록되어 있게 만든다. (영속성)

[간단한 소감]
얼렁뚱땅 여차저차 웹툰 앱을 완성한 것이 뿌듯하다.
앞으로 다른 강의도 수강하면서 스스로 공부하고 싶다.


