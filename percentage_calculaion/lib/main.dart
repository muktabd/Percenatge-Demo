import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String displayResult = "";

  double numAmount, numPercentage;

  final numAmountController = TextEditingController();
  final numPercentageController = TextEditingController();

  bool validate = false;
  @override
  void dispose() {
    numAmountController.dispose();
    numPercentageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[300],
          title: Text(('Percentage Calculator')),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              Colors.blue[300],
              Colors.blue[200],
              Colors.blue[100],
              Colors.blue[50],
            ]),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        TextField(
                          controller: numAmountController,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'AMOUNT *',
                            errorText: validate ? 'Fill the field' : null,
                            errorStyle: TextStyle(
                              color: Colors.red,
                            ),
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                        TextField(
                          controller: numPercentageController,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Percantage*',
                            errorText: validate ? 'Fill the field' : null,
                            errorStyle: TextStyle(
                              color: Colors.red,
                            ),
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                        Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.orange[900]),
                          child: RaisedButton(
                            color: Colors.blueAccent,
                            child: Text(
                              "SEE THE RESULT",
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              //register navigation is here
                              calculateNow();
                            },
                          ),
                        ),
                        Text(
                          'From your amount of ${numAmountController.text} and given ${numPercentageController.text}, your total percentage is $displayResult',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        //Text('$inputtedAmount'),
                      ],
                    ))
              ],
            ),
          ),
        ));
  }

  void calculateNow() {
    var inputtedAmount, inputtedPercentage, displayResult;

    var amount = double.parse(numAmountController.text);
    inputtedAmount = amount;

    print('amount is ==> $amount');
    var percentage = double.parse(numPercentageController.text);
    print('percenatge is ==> $percentage');

    var result = (amount * percentage) / 100;
    print('multiple is ==> $result');

    var resultString = result.toString();
    print('convert result is ==> $resultString');

    displayResult = resultString;
  }
}
