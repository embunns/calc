import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CalcApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = "0";
  String _currentInput = "0";
  String _operator = "";
  double _firstOperand = 0.0;

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _output = "0";
        _currentInput = "0";
        _operator = "";
        _firstOperand = 0.0;
      } else if (buttonText == "+" || buttonText == "-" || buttonText == "×" || buttonText == "÷") {
        _firstOperand = double.parse(_currentInput);
        _operator = buttonText;
        _currentInput = "0";
      } else if (buttonText == "=") {
        double secondOperand = double.parse(_currentInput);
        double result = 0.0;

        if (_operator == "+") {
          result = _firstOperand + secondOperand;
        } else if (_operator == "-") {
          result = _firstOperand - secondOperand;
        } else if (_operator == "×") {
          result = _firstOperand * secondOperand;
        } else if (_operator == "÷") {
          result = _firstOperand / secondOperand;
        }

        _output = result.toString();
        _currentInput = _output;
        _operator = "";
      } else {
        if (_currentInput == "0") {
          _currentInput = buttonText;
        } else {
          _currentInput += buttonText;
        }
        _output = _currentInput;
      }
    });
  }

  Widget _buildButton(String buttonText, {Color color = Colors.blue}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => _buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 24.0, color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: EdgeInsets.all(20.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            shadowColor: Colors.black54,
            elevation: 10,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CalcApp'),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [Colors.blueGrey[900]!, Colors.black87],
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
              alignment: Alignment.centerRight,
              child: Text(
                _output,
                style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.greenAccent,
                ),
              ),
            ),
            Expanded(child: Divider()),
            Column(
              children: [
                Row(
                  children: <Widget>[
                    _buildButton("7", color: Colors.blueAccent),
                    _buildButton("8", color: Colors.blueAccent),
                    _buildButton("9", color: Colors.blueAccent),
                    _buildButton("÷", color: Colors.orangeAccent),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _buildButton("4", color: Colors.blueAccent),
                    _buildButton("5", color: Colors.blueAccent),
                    _buildButton("6", color: Colors.blueAccent),
                    _buildButton("×", color: Colors.orangeAccent),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _buildButton("1", color: Colors.blueAccent),
                    _buildButton("2", color: Colors.blueAccent),
                    _buildButton("3", color: Colors.blueAccent),
                    _buildButton("-", color: Colors.orangeAccent),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _buildButton("C", color: Colors.redAccent),
                    _buildButton("0", color: Colors.blueAccent),
                    _buildButton("=", color: Colors.greenAccent),
                    _buildButton("+", color: Colors.orangeAccent),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
