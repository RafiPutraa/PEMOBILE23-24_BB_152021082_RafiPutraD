import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CurrencyConverterPage extends StatelessWidget {
  final double balanceInRupiah;

  CurrencyConverterPage({required this.balanceInRupiah});

  @override
  Widget build(BuildContext context) {
    double exchangeRate = 0.000064;
    double balanceInDollar = balanceInRupiah * exchangeRate;

    String formattedBalanceInRupiah =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0)
            .format(balanceInRupiah);

    String formattedBalanceInDollar =
        NumberFormat.currency(locale: 'en_US', symbol: '\$', decimalDigits: 2)
            .format(balanceInDollar);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Currency Converter",
          style: TextStyle(fontFamily: 'ChakraPetch', fontSize: 28),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 300,
              height: 125,
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Indonesian Rupiah",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontFamily: 'ChakraPetch',
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    formattedBalanceInRupiah,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontFamily: 'ChakraPetch',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 100),
            Container(
              width: 300,
              height: 125,
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "US Dollar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontFamily: 'ChakraPetch',
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    formattedBalanceInDollar,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontFamily: 'ChakraPetch',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
