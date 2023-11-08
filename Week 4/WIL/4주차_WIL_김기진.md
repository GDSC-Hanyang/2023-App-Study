Chapter 3.

Opacity, radius와 같은 몇몇 값은 complie에서 값을 알기 어렵기 때문에 const로 놓으면 오류가 발생한다.

SingleChildScrollView – 스크롤 가능해서 overflow를 방지할 수 있음
Container – clipBehavior – 어떤 object가 overflow(넘어감)되면 이를 잘라냄


Icon – 여러 아이콘 사용 가능
Transform.scale – container에 상관없이 크기를 키움
Transform.translate - offset으로 container에 상관없이 움직일 수 있음

 
Chapter 4.

StatelessWidget – bulid를 통해 UI 출력 (단순 화면 출력, 데이터 변화 x)

StatefulWidget – 상태 변화에 따라 다른 것을 출력 (데이터에 따라 다른 화면, 데이터 변화 o)
	상태가 없는 위젯
	위젯의 state - 데이터와 UI를 넣는 곳
	
	setState – state에 데이터 갱신을 알리는 함수 >>> build를 실시간으로 다시 실행시킴 


theme – 데이터 저장용
	ThemeData() – textTheme >> 모든 text가 그 text style을 갖도록 함


Widget bulid(BuildContext context) 
>>BuildContext : 위젯 트리에서 위젯의 위치 제공
>> context : Text 이전에 있는 모든 상위 요소들에 대한 정보 (상위 위젯 트리의 정보를 가지고 있음)


Widget Lifecycle 
- StatefulWidget
	build – UI를 만듦

	initState – 상태 초기화 함수 (특히 부모요소에 연결된 데이터를 초기화하기 위해 사용)
		build보다 먼저 호출됨
1번만 호출
	
	dispose – 위젯이 위젯트리에서 제거될 때 호출되는 함수 // 취소하는 기능
