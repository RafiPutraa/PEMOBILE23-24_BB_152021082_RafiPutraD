import 'package:flutter/material.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculator",
          style: TextStyle(fontFamily: 'ChakraPetch', fontSize: 28),
        ),
        backgroundColor: Colors.black,
      ),
      body: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController input1 = TextEditingController();
  TextEditingController input2 = TextEditingController();
  TextEditingController hasil = TextEditingController();
  double result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(children: [
          TextField(
            controller: input1,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "First Number",
            ),
            style: TextStyle(fontFamily: 'ChakraPetch', fontSize: 24),
          ),
          TextField(
            controller: input2,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Second Number",
            ),
            style: TextStyle(fontFamily: 'ChakraPetch', fontSize: 24),
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  rumus('tambah');
                },
                child: Text(
                  '+',
                  style: TextStyle(fontFamily: 'ChakraPetch', fontSize: 28),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  rumus('kurang');
                },
                child: Text(
                  '-',
                  style: TextStyle(fontFamily: 'ChakraPetch', fontSize: 28),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  rumus('kali');
                },
                child: Text(
                  'x',
                  style: TextStyle(fontFamily: 'ChakraPetch', fontSize: 24),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  rumus('bagi');
                },
                child: Text(
                  '/',
                  style: TextStyle(fontFamily: 'ChakraPetch', fontSize: 24),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  input1.clear();
                  input2.clear();
                  hasil.clear();
                },
                child: Text(
                  'C',
                  style: TextStyle(fontFamily: 'ChakraPetch', fontSize: 24),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          TextField(
            controller: hasil,
            readOnly: true,
            decoration: InputDecoration(labelText: 'Result'),
            style: TextStyle(fontFamily: 'ChakraPetch', fontSize: 24),
          ),
        ]),
      ),
    );
  }

  void rumus(String operasi) {
    double angka1 = double.parse(input1.text);
    double angka2 = double.parse(input2.text);
    double result = 0.0;

    if (operasi == 'tambah') {
      result = angka1 + angka2;
    } else if (operasi == 'kurang') {
      result = angka1 - angka2;
    } else if (operasi == 'kali') {
      result = angka1 * angka2;
    } else if (operasi == 'bagi') {
      if (angka2 != 0) {
        result = angka1 / angka2;
      } else {
        result = 0;
      }
    }

    setState(() {
      hasil.text = result.toString();
    });
  }
}
