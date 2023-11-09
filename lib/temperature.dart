import 'package:flutter/material.dart';

class TemperatureConverterPage extends StatelessWidget {
  const TemperatureConverterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Temperature Converter",
          style: TextStyle(fontFamily: 'ChakraPetch', fontSize: 24),
        ),
        backgroundColor: Colors.black,
      ),
      body: TemperatureConverter(),
    );
  }
}

class TemperatureConverter extends StatefulWidget {
  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  String? satuanAwal;
  String? satuanAkhir;
  double nilaiSuhu = 0;
  double hasilKonversi = 0;

  final List<String> units = ['Celsius', 'Fahrenheit', 'Kelvin', 'Reamur'];
  TextEditingController suhuAwalController = TextEditingController();

  void konversi() {
    if (satuanAwal == satuanAkhir) {
      setState(() {
        hasilKonversi = nilaiSuhu;
      });
      return;
    }

    if (satuanAwal == 'Celsius' && satuanAkhir == 'Fahrenheit') {
      setState(() {
        hasilKonversi = (nilaiSuhu * 9 / 5) + 32;
      });
    } else if (satuanAwal == 'Fahrenheit' && satuanAkhir == 'Celsius') {
      setState(() {
        hasilKonversi = (nilaiSuhu - 32) * 5 / 9;
      });
    } else if (satuanAwal == 'Celsius' && satuanAkhir == 'Kelvin') {
      setState(() {
        hasilKonversi = nilaiSuhu + 273.15;
      });
    } else if (satuanAwal == 'Kelvin' && satuanAkhir == 'Celsius') {
      setState(() {
        hasilKonversi = nilaiSuhu - 273.15;
      });
    } else if (satuanAwal == 'Fahrenheit' && satuanAkhir == 'Kelvin') {
      setState(() {
        hasilKonversi = (nilaiSuhu - 32) * 5 / 9 + 273.15;
      });
    } else if (satuanAwal == 'Kelvin' && satuanAkhir == 'Fahrenheit') {
      setState(() {
        hasilKonversi = (nilaiSuhu - 273.15) * 9 / 5 + 32;
      });
    } else if (satuanAwal == 'Celsius' && satuanAkhir == 'Reamur') {
      setState(() {
        hasilKonversi = nilaiSuhu * 4 / 5;
      });
    } else if (satuanAwal == 'Reamur' && satuanAkhir == 'Celsius') {
      setState(() {
        hasilKonversi = nilaiSuhu * 5 / 4;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18, top: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Convert From',
                style: TextStyle(fontSize: 24, fontFamily: 'ChakraPetch'),
              ),
              DropdownButton<String>(
                value: satuanAwal,
                onChanged: (String? newUnit) {
                  setState(() {
                    satuanAwal = newUnit;
                  });
                },
                items: units.map<DropdownMenuItem<String>>((String unit) {
                  return DropdownMenuItem<String>(
                    value: unit,
                    child: Text(
                      unit,
                      style: TextStyle(fontSize: 20, fontFamily: 'ChakraPetch'),
                    ),
                  );
                }).toList(),
                underline: Container(
                  height: 2,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Degrees',
                        labelStyle: TextStyle(
                            fontSize: 24,
                            fontFamily: 'ChakraPetch',
                            color: Colors.black),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 2.0),
                        ),
                      ),
                      controller: suhuAwalController,
                      onChanged: (String value) {
                        setState(() {
                          nilaiSuhu = double.tryParse(value) ?? 0;
                        });
                      },
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'ChakraPetch',
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        nilaiSuhu = 25;
                        satuanAwal = 'Celsius';
                        suhuAwalController.text = '25';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 15,
                      ),
                    ),
                    child: Text(
                      'Current Temperature',
                      style: TextStyle(fontSize: 16, fontFamily: 'ChakraPetch'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text(
                'Convert To',
                style: TextStyle(fontSize: 24, fontFamily: 'ChakraPetch'),
              ),
              DropdownButton<String>(
                value: satuanAkhir,
                onChanged: (String? newUnit) {
                  setState(() {
                    satuanAkhir = newUnit;
                  });
                },
                items: units.map<DropdownMenuItem<String>>((String unit) {
                  return DropdownMenuItem<String>(
                    value: unit,
                    child: Text(
                      unit,
                      style: TextStyle(fontSize: 20, fontFamily: 'ChakraPetch'),
                    ),
                  );
                }).toList(),
                underline: Container(
                  height: 2,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: konversi,
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 10,
                  ),
                ),
                child: Text(
                  'CONVERT',
                  style: TextStyle(
                      fontSize: 28,
                      fontFamily: 'ChakraPetch',
                      color: Colors.white),
                ),
              ),
              SizedBox(height: 35),
              Center(
                child: Text(
                  'Result : $hasilKonversi°',
                  style: TextStyle(fontSize: 24, fontFamily: 'ChakraPetch'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
