# 3 UI Challenge

## 3.0 Header

import 'package:flutter/material.dart';
void main() {
  runApp(App());
}
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors(0xFF181818),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal:
          40),
           child: Column(
             children: [
                SizedBox(
                  height: 80, 
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.
                  end,
                  children:  [
                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Hey, Selena'),
                           style: TextStyle(
                            color: Colors.white,
                            fontsize: 34 
                            fontWeight: FontWeight.w800, 
                   ),
                  ),
                  Text('Welcome back',
                  style: TextStyle(
                    color: Colors.white.
                    with0pacity(0.8),
                    fontSize:
                    18)
                ],
            )
          ],
        )
      ],
    ),
   ),
  );
}
        appBar: AppBar(
          title: Text("flutter!!!"),
        ),
        body: Center(
          children: Text("hello!!"),
        ),
      ),
    );
  }
}

#3.1 Developer Tools

import 'package:flutter/material.dart';
void main() {
  runApp(App());
}
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors(0xFF181818),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 40,
            ),
           child: Column(
             children: [
                SizedBox(
                  height: 80, 
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.
                  end,
                  children:  [
                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Hey, Selena'),
                           style: TextStyle(
                            color: Colors.white,
                            fontsize: 28,
                            fontWeight:
                            FontWeight.w800, 
                   ),
                  ),
                  Text('Welcome back',
                  style: TextStyle(
                    color: Colors.fromRGB0(255,
                    255, 255, 0.8),
                    fontsize: 18,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
}
        appBar: AppBar(
          title: Text("flutter!!!"),
        ),
        body: Center(
          children: Text("hello!!"),
        ),
      ),
    );
  }
}

# 3.2 Buttons Section
import 'package:flutter/material.dart';
void main() {
  runApp(App());
}
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors(0xFF181818),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 40,
            ),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.
             start, 
             children: [
                SizedBox(
                Row(
                  mainAxisAlignment: MainAxisAlignment.
                  end,
                  children:  [
                    Column(
                     ],
                    ),
                   SizedBox(
                     height: 120, 
                     ),
                    Text(
                     'Total Balance',
                      style: TextStyle(
                       fontSize: 22,
                        color: Colors.white. with0pacity(0.8)),
                  ),
                ),
                SizedBox(
                  height: 30,
                 ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.
                        circular(45),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 20,
                           horizontal: 50,
                         ),
                        child: Text(
                          'Transfer',
                          style: TextStyle(
                            fontSize: 22, 
                            ),
                 )
              ],
            )
          ],
         ),
       ),
     ),
   );
}

# 3.3 VSCode Settings

import 'package:flutter/material.dart';


const taxAmount = 15;
const priceAmount = 30;

var finalPrice = 15 + 30;
void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Colors(0xFF181818),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 40,
            ),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.
             start, 
             children: [
                Column(
                   crossAxisAlignment: CrossAxisAlignment.end,
                   children: const [
                    Text(
                     'Hey, Selena',
                     color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      ),
                   ),
                 Text(
                   'Welcome back',
                    style: TextStyle(
                      color: Color.fromRGB0(255, 255, 255, 0.8),
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
                    color: Colors.white. with0pacity(0.8),
                  ),
               ),
            const SizedBox(
                height: 5,
              ),
            const Text(
              '\$5 194 182',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w600,
                color: Colors.white,
               ),
             ),
            const SizedBox(
               height: 30,
              ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.
                        circular(45),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 20,
                           horizontal: 50,
                         ),
                        child: Text(
                          'Transfer',
                          style: TextStyle(
                            fontSize: 22, 
                            ),
                 )
              ],
            )
          ],
         ),
       ),
     ),
   );
}


# 3.4 Code Actions

import 'package:flutter/material.dart';


const taxAmount = 15;
const priceAmount = 30;

var finalPrice = 15 + 30;
void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Colors(0xFF181818),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 40,
            ),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.
             start, 
             children: [
                Column(
                   crossAxisAlignment: CrossAxisAlignment.end,
                   children: const [
                    Text(
                     'Hey, Selena',
                     color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      ),
                   ),
                 Text(
                   'Welcome back',
                    style: TextStyle(
                      color: Color.fromRGB0(255, 255, 255, 0.8),
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
                    color: Colors.white. with0pacity(0.8),
                  ),
               ),
             ),
            const SizedBox(
                height: 5,
              ),
            const Text(
              '\$5 194 182',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w600,
                color: Colors.white,
               ),
             ),
            const SizedBox(
               height: 30,
              ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1B33B),
                        borderRadius: BorderRadius.
                        circular(45),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 20,
                           horizontal: 50,
                         ),
                        child: Text(
                          'Transfer',
                          style: TextStyle(
                            fontSize: 20, 
                            ),
                 )
              ],
            )
          ],
         ),
       ),
     ),
   );
}

# 3.4 Code Actions

import 'package:flutter/material.dart';


const taxAmount = 15;
const priceAmount = 30;

var finalPrice = 15 + 30;
void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Colors(0xFF181818),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 40,
            ),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.
             start, 
             children: [
                Column(
                   crossAxisAlignment: CrossAxisAlignment.end,
                   children: const [
                    Text(
                     'Hey, Selena',
                     color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      ),
                   ),
                 Text(
                   'Welcome back',
                    style: TextStyle(
                      color: Color.fromRGB0(255, 255, 255, 0.8),
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
                    color: Colors.white. with0pacity(0.8),
                  ),
               ),
             ),
            const SizedBox(
                height: 5,
              ),
            const Text(
              '\$5 194 182',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w600,
                color: Colors.white,
               ),
             ),
            const SizedBox(
               height: 30,
              ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1B33B),
                        borderRadius: BorderRadius.
                        circular(45),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 20,
                           horizontal: 50,
                         ),
                        child: Text(
                          'Transfer',
                          style: TextStyle(
                            fontSize: 20, 
                            ),
                 )
              ],
            )
          ],
         ),
       ),
     ),
   );
}


# 3.4 Code Actions

import 'package:flutter/material.dart';


const taxAmount = 15;
const priceAmount = 30;

var finalPrice = 15 + 30;
void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Colors(0xFF181818),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 40,
            ),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.
             start, 
             children: [
                Column(
                   crossAxisAlignment: CrossAxisAlignment.end,
                   children: const [
                    Text(
                     'Hey, Selena',
                     color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      ),
                   ),
                 Text(
                   'Welcome back',
                    style: TextStyle(
                      color: Color.fromRGB0(255, 255, 255, 0.8),
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
                    color: Colors.white. with0pacity(0.8),
                  ),
               ),
             ),
            const SizedBox(
                height: 5,
              ),
            const Text(
              '\$5 194 182',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w600,
                color: Colors.white,
               ),
             ),
            const SizedBox(
               height: 30,
              ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1B33B),
                        borderRadius: BorderRadius.
                        circular(45),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 20,
                           horizontal: 50,
                         ),
                        child: Text(
                          'Transfer',
                          style: TextStyle(
                            fontSize: 20, 
                            ),
                 )
              ],
            )
          ],
         ),
       ),
     ),
   );
}


# 3.4 Code Actions

import 'package:flutter/material.dart';


const taxAmount = 15;
const priceAmount = 30;

var finalPrice = 15 + 30;
void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Colors(0xFF181818),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 40,
            ),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.
             start, 
             children: [
                Column(
                   crossAxisAlignment: CrossAxisAlignment.end,
                   children: const [
                    Text(
                     'Hey, Selena',
                     color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      ),
                   ),
                 Text(
                   'Welcome back',
                    style: TextStyle(
                      color: Color.fromRGB0(255, 255, 255, 0.8),
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
                    color: Colors.white. with0pacity(0.8),
                  ),
               ),
             ),
            const SizedBox(
                height: 5,
              ),
            const Text(
              '\$5 194 182',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w600,
                color: Colors.white,
               ),
             ),
            const SizedBox(
               height: 30,
              ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1B33B),
                        borderRadius: BorderRadius.
                        circular(45),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 20,
                           horizontal: 50,
                         ),
                        child: Text(
                          'Transfer',
                          style: TextStyle(
                            fontSize: 20, 
                            ),
                 )
              ],
            )
          ],
         ),
       ),
     ),
   );
}


# 3.5 Reusable Widgets

import 'package:flutter/material.dart';


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
            color: textColor, 
            fontSize: 20,
           ),
          ),
        ),
       );
     }
      Row(
        mainAxisAlignment: MainAxisAlignment.
        spaceBetween,
        children: const [
          Button(
          text: 'Transfer',
          bgColor: Color(0xFFF1B33B),
          textColor: Colors.black,
        ), 
         Button(
           text: 'Request',
           bgColor: Color(0xFF1F2123),
           textColor: Colors.white,
          ),
        ],
       ),
      ],
     ),


# 소감 : 강의를 몇 번이고 돌려보면서 하느라 정말 오래 걸렸다. 꽤 어려웠지만 진짜 앱 구성을 해보는 시간이라 재밌었다.
