2주차 WIL
==========

Class
-------
Class 생성할 때는 타입 명시 필수

class Player{
String name = 'nico';
int xp = 1500;
}

void main(){
var player = Player();
print(player.name); 
player.name = 'lalala';
print(player.name);
}


이름 안 바꾸려면 final 추가

class에서는 this 자제. 

constructors.
Player(String name, int xp){
this.name = name;
this.xp=xp;
}
late 추가 . 나중에 변수 받아옴

player(this.name, this.xp)

positional argument
named constructor parameter
