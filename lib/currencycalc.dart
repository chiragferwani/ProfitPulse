import 'package:flutter/material.dart';
import 'package:profitpulse/main.dart';

class CurrencyCalculator extends StatefulWidget {
  const CurrencyCalculator({super.key});

  @override
  State<CurrencyCalculator> createState() => _CurrencyCalculatorState();
}

class _CurrencyCalculatorState extends State<CurrencyCalculator> {
 final TextEditingController _amountController = TextEditingController();
  final TextEditingController _convertedAmountController = TextEditingController();

  String _selectedFromCurrency = '₹';
  String _selectedToCurrency = '\$';

  final Map<String, double> _currencyRates = {
    '₹': 1.0,
    '\$': 83.88, // Example: 1 USD = 83.88 INR
    '€': 91.20,  // Example: 1 EUR = 91.20 INR
    '¥': 0.58,   // Example: 1 JPY = 0.58 INR
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildCurrencyInputField(
              'Enter Amount',
              _amountController,
              _selectedFromCurrency,
              (String? newValue) {
                setState(() {
                  _selectedFromCurrency = newValue!;
                });
              },
            ),
            SizedBox(height: 20),
            _buildCurrencyInputField(
              'Convert To',
              _convertedAmountController, // Use this controller to update the field
              _selectedToCurrency,
              (String? newValue) {
                setState(() {
                  _selectedToCurrency = newValue!;
                });
              },
              isReadOnly: true, // Make this field read-only
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertCurrency,
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  primary: Colors.blue, // background color
                ),
                child: Text('CONVERT', style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'PoppinsMedium',
                  color: Colors.white
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrencyInputField(
    String label,
    TextEditingController controller,
    String currentValue,
    ValueChanged<String?> onChanged, {
    bool isReadOnly = false, // Added flag for read-only fields
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'PoppinsMedium'
            ),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black38),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: [
              DropdownButton<String>(
                value: currentValue,
                underline: SizedBox(),
                items: ['₹', '\$', '€', '¥']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: onChanged,
              ),
              Expanded(
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: isReadOnly ? '' : '1,000',
                    hintStyle: TextStyle(
                      fontFamily: 'PoppinsMedium'
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  readOnly: isReadOnly, // Make the "Convert To" field read-only
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _convertCurrency() {
  double amount = double.tryParse(_amountController.text.replaceAll(',', '')) ?? 0;
  double fromRate = _currencyRates[_selectedFromCurrency] ?? 1;
  double toRate = _currencyRates[_selectedToCurrency] ?? 1;

  setState(() {
    double result = amount * (fromRate / toRate);
    _convertedAmountController.text = result.toStringAsFixed(2);
  });
}
}