## 2.3 Hello World

```

void main(){
  runApp(App());
}

class App extends StatelessWidget{
  
  @override
  Widget build(BuildContext context){
    return MaterialApp(
    home: Scaffold(
    appBar: AppBar(
    title: Text('Hello flutter!'),
    ),
      body: Center(
        child: Text('Hello world!'),
      ),
      ),
    );
  }
  
}

```

## 3.0 Header
##### 앱 UI 따라하기, 위젯 활용, .와 , 주의하기, 괄호 주의
```
void main(){
  runApp(App());
}

class App extends StatelessWidget{
  
  @override
  Widget build(BuildContext context){
    return MaterialApp(
    home: Scaffold(
      backgroundColor: Color(0xFF181818),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.
            end,
            children:[
            Column(
              crossAxisAlignment:
              CrossAxisAlignment.end,
              children:[
              Text('Hey, Selena',
                  style:TextStyle(
                  color: Colors.white,
                  fontSize: 38,
                  fontWeight: FontWeight.w600,
                  ),),
              Text('Welcome back',
                  style:TextStyle(
                  color:Colors.white.withOpacity(0.8),fontSize:18
                  ),),
            ],
            )
          ],
          )
        ],
      ),
      ),
    )
  );
  
}

}
```
