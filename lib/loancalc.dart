import 'dart:math';

import 'package:flutter/material.dart';
import 'package:profitpulse/main.dart';

class LoanCalculator extends StatefulWidget {
  const LoanCalculator({super.key});

  @override
  State<LoanCalculator> createState() => _LoanCalculatorState();
}

class _LoanCalculatorState extends State<LoanCalculator> {
  final TextEditingController _loanAmountController = TextEditingController();
  final TextEditingController _interestRateController = TextEditingController();
  String _selectedLoanPeriod = '1 Year';
  double _totalInterest = 0;
  double _totalAmount = 0;

  void _calculateEmi() {
    double principal = double.tryParse(_loanAmountController.text.replaceAll(',', '')) ?? 0;
    double rate = double.tryParse(_interestRateController.text.replaceAll('%', '')) ?? 0;
    int period = int.parse(_selectedLoanPeriod.split(' ')[0]);

    // EMI Calculation
    double monthlyInterestRate = rate / 12 / 100;
    int numberOfMonths = period * 12;

    double emi = (principal * monthlyInterestRate * pow(1 + monthlyInterestRate, numberOfMonths)) /
        (pow(1 + monthlyInterestRate, numberOfMonths) - 1);

    setState(() {
      _totalInterest = (emi * numberOfMonths) - principal;
      _totalAmount = principal + _totalInterest;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loan/EMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Loan/EMI Calculator',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _loanAmountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter Loan Amount',
                  prefixText: '₹',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _selectedLoanPeriod,
                items: ['1 Year', '2 Years', '3 Years', '4 Years', '5 Years']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedLoanPeriod = newValue!;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Loan Period',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _interestRateController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter Interest Rate',
                  suffixText: '%',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: _calculateEmi,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    primary: Colors.blue, // background color
                  ),
                  child: Text('CALCULATE', style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'PoppinsMedium',
                    color: Colors.white
                    )),
                ),
              ),
              SizedBox(height: 30),
              if (_totalInterest > 0 && _totalAmount > 0) ...[
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Interest: ₹${_totalInterest.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Total Amount: ₹${_totalAmount.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}