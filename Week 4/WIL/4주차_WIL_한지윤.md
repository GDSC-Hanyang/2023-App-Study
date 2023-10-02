#3.6 Cards
  - 이 장은 Euro Card(Container)를 만들기 위한 챕터였다.
  - Main 가로축 (-> MainAxis) / cross 세로축 (->CrossAxis)

#3.7 Icons and Transforms
  - 이 장은 카드에 아이콘을 추가하기 위한 챕터였다.
  - 아이콘을 overflow 시키기 위해서는 TransformationWidget을 사용해야 한다.
    - 아이콘의 크기를 변경하려면 Transform.scale을 사용한다.
    - 아이콘의 위치를 변경하려면 Transform.translate을 사용한다.
  - clipBehavior은 어떤 아이템이 overflow 되었을 때 어떻게 동작하게끔 알려주는 장치이다.

#3.8 Reusable Cards
  - CurrencyCard 위젯을 만들어 재사용해보는 챕터였다.
  - Transformation.translate 기능을 통해 항목들을 겹치게 만들 수 있다.
  - SingleChildScrollView로 스크롤 기능을 만들어 overflow 현상을 해결해줄 수 있다.

#4.0 State
  - 실시간으로 데이터의 변화를 보고 싶으면 Stateful Widget
    - Stateful Widget은 두 가지 부분이 있다.
	    - 하나는 Widget이고 이 위젯들은 모두 상태를 가지고 있다.
      - State는 데이터를 가지고 있는 부분으로 UI도 가지고 있다.
  - 데이터를 가지지 않고 오직 UI를 보여주는 Stateless Widget

#4.1 setState
  - setState는 build 메서드를 한 번 더 호출하여 State클래스에게 데이터가 변경되었다고 알리는 함수이다.
  - 반드시 setState에 데이터의 변화를 적을 필요는 없다.

#4.3 BuildContext
  - context는 text 이전에 있는 모든 상위 요소들에 대한 정보이다.
  - BuildContext 위젯을 사용해 누가 우리의 부모요소인지 알 수 있고 맨 위의 부모 요소에도 접근할 수 있다.

#4.4 Widget Lifecycle
  - StatefulWidget은 (의미적으로) 살아있다.
  - StatefulWidget은 build 메서드 외에도 initState 메서드를 가지고 있다.
  - InitState는 상태를 초기화하기 위한 메서드이다.
    항상 build 메서드보다 먼저 호출되어야 하며 오직 한 번만 가능하다.

< 간단한 소감 >
차근차근히 따라가보니 어렵지만 재밌는 것 같아요!
전보다 기능들이 눈에 익어가는 것 같아서 기쁩니다
