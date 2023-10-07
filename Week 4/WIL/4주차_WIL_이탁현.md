# 4주차 WIL 이탁현

## Chatper 4 Stateful Widget


`StatefulWidget` -> UI 의 상태나 내부로 오는 데이터가 변경될 때 마다 실시간적으로 변화를 보여줌

widgets의 데이터가 변경되면 UI도 따라서 바뀜

`statefulwidget` 에서 State의 데이터가 바뀔 때 위젯의 UI도 새로운 데이터와 함께 새로고침됨

setState를 사용하여  `Class`에 변경됨을 체크해줌

`StatelessWidget` -> ful과는 다르게 유동적이지 않고 고정된 형태로서 한 번 생성되면 변화하지 않음

`StatefulWidget build` -> UI 만드는 것 핵심


`theme` 는 테마, 즉 말 그대로 앱 스타일 데이터 저장용


`BuildContext` -> `build`에서 쓰고 현재를 포함 상위 위젯에 대해 정보를 갖고 있어서 위젯 간에 사용 가능

`Widget Lifecycle` -> 위젯에 라이프사이클? 이라고 할 수 있으나 `method`에 따른 호환을 보면 살아있다고 의미를 갖을 수 있음

`initState` -> 이름 그대로 초기화용도이며 State가 처음 생성될 때, 사용되고, `dispose` 는 State 가 더 이상 필요하지 않을 때 1번씩 사용함

*build 보다 먼저!*


# 소감

도입부를 지나서 이젠 만들어 간다고 느끼며 코드에 생동감이 생기는 것 같다

보기만 하기보다는 직접 짜봐야 하므로 직접 해보면서 차이점을 알고 배워나가보자!
