import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'questionBank.dart';
QuestionBank qb = QuestionBank();
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical:10.0),
            child: Quizzme(),
          ),

        ),
      ),
      
    );
  }  
}

class Quizzme extends StatefulWidget {
  @override
  _QuizzmeState createState() => _QuizzmeState();
}

class _QuizzmeState extends State<Quizzme> {
  List <Icon> scoreKeeper=[];
  void checkAnswer(bool usrAns)
  {
    bool crct = qb.getAns();
    setState(() {
     if(qb.isfinish()==true) {
       Alert(

          context: context,

          title: 'Finished!',

          desc: 'You\'ve reached the end of the quiz.',

        ).show();
        qb.reset();
      scoreKeeper=[];
     }
     else{
       if(usrAns=crct)
       {
         scoreKeeper.add(Icon(
           Icons.check,
           color: Colors.green,
         ),);
       }
       else
       {
         scoreKeeper.add(Icon(
           Icons.check,
           color: Colors.red,
         ),);
       }
     }
     qb.nextQuestion();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
         flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(qb.getQuestion(),
              textAlign: TextAlign.center,
              style: TextStyle(
               
                fontSize: 20.0,
                color: Colors.white,
              ),),
            ),
          ),

        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FlatButton(
                color: Colors.green,
              onPressed: (){ checkAnswer(true);},
              child: Text(
                'True',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FlatButton(
              color: Colors.red,
              onPressed: (){
                checkAnswer(false);
              },
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color:Colors.white,
                ),
                
              ),
            ),
          ),
        ),
        Row(
          children:scoreKeeper,
        ),
      ],
      
    );
  }
}