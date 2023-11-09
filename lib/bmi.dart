import 'package:flutter/material.dart';

class BMICalculatorPage extends StatelessWidget {
  const BMICalculatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(fontFamily: 'ChakraPetch', fontSize: 28),
        ),
        backgroundColor: Colors.black,
      ),
      body: BMICalculator(),
    );
  }
}

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

enum Gender { male, female }

class _BMICalculatorState extends State<BMICalculator> {
  double height = 160.0;
  double weight = 60.0;
  double bmi = 0.0;
  String result = "";
  Gender selectedGender = Gender.male;

  void calculateBMI() {
    double heightInMeters = height / 100;
    double bmiValue;

    if (selectedGender == Gender.male) {
      bmiValue = weight / (heightInMeters * heightInMeters);
    } else {
      bmiValue = (weight / (heightInMeters * heightInMeters)) * 0.9;
    }

    setState(() {
      bmi = bmiValue;
      result = _interpretBMI(bmiValue);
    });
  }

  String _interpretBMI(double bmi) {
    if (bmi < 18.5) {
      return "Underweight";
    } else if (bmi < 24.9) {
      return "Normal";
    } else if (bmi < 29.9) {
      return "Overweight";
    } else {
      return "Obese";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Select your height (cm):",
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'ChakraPetch',
                  fontWeight: FontWeight.bold),
            ),
            Slider(
              value: height,
              onChanged: (value) {
                setState(() {
                  height = value;
                });
              },
              min: 100.0,
              max: 220.0,
              activeColor: Colors.black,
            ),
            Text(
              "Height: ${height.toStringAsFixed(1)} cm",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'ChakraPetch',
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Select your weight (kg):",
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'ChakraPetch',
                  fontWeight: FontWeight.bold),
            ),
            Slider(
              value: weight,
              onChanged: (value) {
                setState(() {
                  weight = value;
                });
              },
              min: 30.0,
              max: 150.0,
              activeColor: Colors.black,
            ),
            Text(
              "Weight: ${weight.toStringAsFixed(1)} kg",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'ChakraPetch',
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Radio(
                  value: Gender.male,
                  groupValue: selectedGender,
                  onChanged: (Gender? value) {
                    setState(() {
                      selectedGender = value!;
                    });
                  },
                  activeColor: Colors.black,
                ),
                Text(
                  "Male",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'ChakraPetch',
                      fontWeight: FontWeight.bold),
                ),
                Radio(
                  value: Gender.female,
                  groupValue: selectedGender,
                  onChanged: (Gender? value) {
                    setState(() {
                      selectedGender = value!;
                    });
                  },
                  activeColor: Colors.black,
                ),
                Text(
                  "Female",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'ChakraPetch',
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: calculateBMI,
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minimumSize: Size(250, 50),
              ),
              child: Text(
                "Calculate BMI",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'ChakraPetch',
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Your BMI: ${bmi.toStringAsFixed(1)}",
              style: TextStyle(fontSize: 24, fontFamily: 'ChakraPetch'),
            ),
            Text(
              "Result: $result",
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'ChakraPetch',
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
