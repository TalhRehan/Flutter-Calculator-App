import 'package:calculator/colors.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
void main(){
  runApp(MyApp(),);
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  double firstNum = 0.0;
  double Secound = 0.0;
  var input = '';
  var output = '';
  var operation = '';
  var hideinput = false;
  var outputsize = 34.0;
  onButtonClick(value){
   if (value=="AC"){
     input = "";
     output = "";
   }else if(value == "<"){
     if (input.isNotEmpty){
     input = input.substring(0, input.length-1);}
   }else if(value== "="){
     if(input.isNotEmpty){
     var userInput = input;
     userInput = input.replaceAll("X", "*");
     Parser p = Parser();
     Expression expression = p.parse(userInput);
     ContextModel cm = ContextModel();
     var finalValue = expression.evaluate(EvaluationType.REAL, cm);
     output = finalValue.toString();
     if (output.endsWith(".0")){
     output = output.substring(0, output.length-2);}
     input=output;
     hideinput= true;
     outputsize =52;
     }
   }else {
     input=input+value;
     hideinput= false;
     outputsize =34;
   }
   setState(() {
   });
  }

  Widget Button({text, tcolor = Colors.white,buttonBGcolor = ButtonColor}){
    return Expanded(child:Container(
        margin: EdgeInsets.all(8),
        child: ElevatedButton(onPressed: ()=>onButtonClick(text),
          child:Text(text,style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color:tcolor),),
          style:ElevatedButton.styleFrom(backgroundColor: buttonBGcolor,
            padding: EdgeInsets.all(22),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        )),);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              //color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                Text(
                  hideinput ? '' : input,style: TextStyle(
                  fontSize: 48,
                  color: Colors.white,
                ),),
                  SizedBox(height: 20,),
                  Text(output,style: TextStyle(
                    fontSize:outputsize,
                    color: Colors.white.withOpacity(0.7),
                  ),),
                  SizedBox(height: 30,),
              ],),
            )),


            //Button side
            Row(
                children: [
                  Button(text: "AC",tcolor:OrangeColor,buttonBGcolor:operatorColor),
                  Button(text: "<",tcolor:OrangeColor,buttonBGcolor:operatorColor),
                  Button(text: "",buttonBGcolor: Colors.transparent),
                  Button(text: "/",buttonBGcolor:operatorColor),
                  ],),
            Row(
              children: [
                Button(text: "7"),
                Button(text: "8"),
                Button(text: "9"),
                Button(text: "X",buttonBGcolor:operatorColor),




              ],),
            Row(
              children: [
                Button(text: "4"),
                Button(text: "5"),
                Button(text: "6"),
                Button(text: "-",buttonBGcolor:operatorColor),
              ],),
            Row(
              children: [
                Button(text: "1"),
                Button(text: "2"),
                Button(text: "3"),
                Button(text: "+",buttonBGcolor:operatorColor),




              ],),
            Row(
              children: [
                Button(text: "%"),
                Button(text: "0"),
                Button(text: "."),
                Button(text: "=",buttonBGcolor: OrangeColor)
              ],),
  ],),
      ),
    );
  }

}
