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

## 버튼 
```
class Button extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;

  const Button({
    super.key,
    required this.text,
    required this.bgColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(45),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 50,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
```

## 메인
```
void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF181818),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Hey, Selena',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Welcome back',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 120,
              ),
              Text(
                'Total Balance',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              const SizedBox(
                height: 8.5,
              ),
              const Text(
                '\$5 194 482',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Button(
                    text: 'Transfer',
                    bgColor: Color(0xFFF1b33b),
                    textColor: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Button(
                    text: 'Request',
                    bgColor: Color(0xFF1F2123),
                    textColor: Colors.white,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

```
