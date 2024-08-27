import 'package:flutter/material.dart';
import 'package:profitpulse/main.dart';

class Calculators extends StatelessWidget {
  const Calculators({super.key});
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
           Center(
             child: Text(
              'CALCULATORS',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'PoppinsMedium'),
                textAlign: TextAlign.center,
                     ),
           ),
            SizedBox(height: 16),
            _buildCalculatorCard(
              context,
              'Investment',
              'Set a goal and track your investments',
              'assets/images/invest.png',
              '/investment',
            ),
            SizedBox(height: 15),
            _buildCalculatorCard(
              context,
              'Loan/EMI',
              'Plan loans & secure your future',
              'assets/images/loan.png',
              '/loan',
            ),
            SizedBox(height: 15),
            _buildCalculatorCard(
              context,
              'Currency',
              'Convert currencies and track rates',
              'assets/images/currency.png',
              '/currency',
            ),
            SizedBox(height: 15),
            _buildCalculatorCard(
              context,
              'Tax (GST)',
              'Estimate your tax and optimize savings',
              'assets/images/tax.png',
              '/income_tax',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalculatorCard(
    BuildContext context,
    String title,
    String subtitle,
    String iconPath,
    String route,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(
              iconPath,
              height: 50,
              width: 50,
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}