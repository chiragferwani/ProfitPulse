import 'package:flutter/material.dart';
import 'package:profitpulse/calculators.dart';

class CalculatorsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          
          Text(
            'CALCULATORS',
            style: TextStyle(
              fontWeight: FontWeight.bold, 
              fontSize: 20,
              fontFamily: 'PoppinsMedium'),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalculatorIcon(
                      icon: Icons.show_chart,
                      label: 'INVEST',
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Calculators()));
                      },
                    ),
                    CalculatorIcon(
                      icon: Icons.attach_money,
                      label: 'LOAN',
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Calculators()));
                      },
                    ),
                    CalculatorIcon(
                      icon: Icons.currency_exchange,
                      label: 'CURRENCY',
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Calculators()));
                      },
                    ),
                    CalculatorIcon(
                      icon: Icons.balance,
                      label: 'DUTY',
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Calculators()));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
  }
}

class CalculatorIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  CalculatorIcon({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            child: Icon(icon, size: 30),
          ),
          SizedBox(height: 8),
          Text(label, style: TextStyle(
            fontSize: 16,
            fontFamily: 'PoppinsMedium',
            )),
        ],
      ),
    );
  }
}