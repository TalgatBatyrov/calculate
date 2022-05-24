import 'package:calculate/calculate/calculator_batton.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String titleApp = 'Калькулятор!';
  double numOne = 0;
  double numTwo = 0;
  dynamic text = '0';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
  dynamic result = '';

  void calculation(String btnText) {
    if (btnText == 'A') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && btnText == '=') {
      if (preOpr == '+') {
        finalResult = add();
      } else if (preOpr == '-') {
        finalResult = sub();
      } else if (preOpr == '*') {
        finalResult = mul();
      } else if (preOpr == '/') {
        finalResult = div();
      }
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == '*' ||
        btnText == '/' ||
        btnText == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }
      if (opr == '+') {
        finalResult = add();
      } else if (opr == '-') {
        finalResult = sub();
      } else if (opr == '*') {
        finalResult = mul();
      } else if (opr == '/') {
        finalResult = div();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = '$result.';
      }
      finalResult = result;
    } else {
      result = result + btnText;
      finalResult = result;
    }
    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0)) {
        return result = splitDecimal[0].toString();
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleApp),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              '$text',
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Colors.green,
                fontSize: 60,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorBatton(
                  btntxt: '1', btnColor: Colors.blue, onPressed: calculation),
              CalculatorBatton(
                  btntxt: '2', btnColor: Colors.blue, onPressed: calculation),
              CalculatorBatton(
                  btntxt: '3', btnColor: Colors.blue, onPressed: calculation),
              CalculatorBatton(
                  btntxt: '+', btnColor: Colors.teal, onPressed: calculation),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorBatton(
                  btntxt: '4', btnColor: Colors.blue, onPressed: calculation),
              CalculatorBatton(
                  btntxt: '5', btnColor: Colors.blue, onPressed: calculation),
              CalculatorBatton(
                  btntxt: '6', btnColor: Colors.blue, onPressed: calculation),
              CalculatorBatton(
                  btntxt: '-', btnColor: Colors.teal, onPressed: calculation),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorBatton(
                  btntxt: '7', btnColor: Colors.blue, onPressed: calculation),
              CalculatorBatton(
                  btntxt: '8', btnColor: Colors.blue, onPressed: calculation),
              CalculatorBatton(
                  btntxt: '9', btnColor: Colors.blue, onPressed: calculation),
              CalculatorBatton(
                  btntxt: '*', btnColor: Colors.teal, onPressed: calculation),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorBatton(
                  btntxt: 'A', btnColor: Colors.red, onPressed: calculation),
              CalculatorBatton(
                  btntxt: '0', btnColor: Colors.blue, onPressed: calculation),
              CalculatorBatton(
                  btntxt: '.', btnColor: Colors.red, onPressed: calculation),
              CalculatorBatton(
                  btntxt: '/', btnColor: Colors.teal, onPressed: calculation),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.amber,
                onPressed: () {
                  calculation('=');
                },
                child: const Text(
                  '=',
                  style: TextStyle(fontSize: 30),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
