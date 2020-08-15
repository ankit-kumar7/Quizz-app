import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(Quiz());
}

class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Test Your_self'),
        ),
        body: MainPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int i = 0;

  bool ans;

  List<Icon> icon = [];

  List<String> question = ['2+5 = 7', '3*4 = -12','1-4 = -3','7*1 = 5'];

  List<bool> answer = [true, false, true,false];

  int score = 0;

  void alert()
  {
    Alert(
      context: context,
      title: "Quiz",
      desc: "You got $score/4.",
    ).show();
  }

 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    '${question[i]}',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: FlatButton(
                  color: Colors.green,
                  child: Text(
                    "True",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                        ans = true;
                        if (ans == answer[i]) {
                          icon.add(
                            Icon(
                              Icons.check,
                              color: Colors.green,
                            ),
                          );
                          score++;
                        } else {
                          icon.add(
                            Icon(
                              Icons.close,
                              color: Colors.red,
                            ),
                          );
                        }
                         i = i + 1;
                      if(i==question.length)
                        {
                            alert();
                            i=0;
                            icon.clear();
                            score = 0;
                        }
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: FlatButton(
                  color: Colors.red,
                  child: Text(
                    "False",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  onPressed: () {
                    setState((){
                      ans = false;
                      if (ans == answer[i]) {
                        icon.add(
                          Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                        );
                        score++;
                      } else {
                        icon.add(
                          Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                        );
                      }
                        i = i + 1;
                    if(i==question.length)
                    {
                      alert();
                      i=0;
                      icon.clear();
                      score =0;
                    }
                  });
                  },
                ),
              ),
            ),
            Row(
              children: icon,
            ),
          ],
        ),
      ),
    );
  }
}
