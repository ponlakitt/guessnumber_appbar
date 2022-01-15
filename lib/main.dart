import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GUESS THE NUMBER',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GUESS THE NUMBER')),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.orange.shade100,
            border: Border.all(width: 5.0, color: Colors.orange.shade100),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.5),
                offset: const Offset(2.0, 5.0),
                blurRadius: 5.0,
                spreadRadius: 2.0,
              ),
            ]),
        //alignment: Alignment.center,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/guess_logo.png', width: 100.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(' GUESS',style:TextStyle(fontSize: 40,color: Colors.black),),
                      Text(' THE NUMBER',style:TextStyle(fontSize: 20,color: Colors.black),),
                    ],)
                ],
              ),
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: TextField(),
              ),
              ElevatedButton(
                child: Text('GUESS'),
                onPressed: () {
                  // โค้ดที่จะทำงานเมื่อกดปุ่ม
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
