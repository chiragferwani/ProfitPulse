import 'package:flutter/material.dart';

class TaxCalculator extends StatefulWidget {
  const TaxCalculator({super.key});

  @override
  State<TaxCalculator> createState() => _TaxCalculatorState();
}

class _TaxCalculatorState extends State<TaxCalculator> {
 final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productAmountController = TextEditingController();

  String _selectedCategory = 'Regular';
  double _totalInterestRate = 0.0;
  double _taxableAmount = 0.0;
  double _stateGST = 0.0;
  double _centralGST = 0.0;
  double _totalTax = 0.0;

  void _calculateTax() {
    setState(() {
      _taxableAmount = double.tryParse(_productAmountController.text) ?? 0.0;

      switch (_selectedCategory) {
        case 'Food':
          _totalInterestRate = 5.0;
          break;
        case 'Electronics':
          _totalInterestRate = 18.0;
          break;
        case 'Luxury':
          _totalInterestRate = 28.0;
          break;
        default:
          _totalInterestRate = 0.0;
      }

      _totalTax = (_taxableAmount * _totalInterestRate) / 100;
      _stateGST = _totalTax / 2;
      _centralGST = _totalTax / 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tax Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Name Input
              TextField(
                controller: _productNameController,
                decoration: InputDecoration(
                  labelText: 'Enter Product Name',
                  labelStyle: TextStyle(
                    fontFamily: 'PoppinsMedium',
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10.0),
              // Category Dropdown
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                decoration: InputDecoration(
                  labelText: 'Enter Category',
                  labelStyle: TextStyle(
                    fontFamily: 'PoppinsMedium',
                  ),
                  border: OutlineInputBorder(),
                ),
                items: ['Regular', 'Food', 'Electronics', 'Luxury']
                    .map((category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value!;
                  });
                },
              ),
              SizedBox(height: 10.0),
              // Product Amount Input
              TextField(
                controller: _productAmountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter Product Amount',
                  labelStyle: TextStyle(
                    fontFamily: 'PoppinsMedium',
                  ),
                  border: OutlineInputBorder(),
                  prefixText: '₹',
                ),
              ),
              SizedBox(height: 20.0),
              // Calculate Button
              Center(
                child: ElevatedButton(
                  onPressed: _calculateTax,
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
              SizedBox(height: 20.0),
              // Tax Details
              _buildTaxDetail('Total Interest Rate', '$_totalInterestRate%'),
              _buildTaxDetail('Taxable Amount', '₹${_taxableAmount.toStringAsFixed(2)}'),
              _buildTaxDetail('State GST (S.GST)', '₹${_stateGST.toStringAsFixed(2)}'),
              _buildTaxDetail('Central GST (C.GST)', '₹${_centralGST.toStringAsFixed(2)}'),
              _buildTaxDetail('Total Tax', '₹${_totalTax.toStringAsFixed(2)}'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTaxDetail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16.0, 
              fontWeight: FontWeight.bold,
              fontFamily: 'PoppinsMedium'
              ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16.0, 
              fontWeight: FontWeight.bold,
              fontFamily: 'PoppinsMedium'
              ),
          ),
        ],
      ),
    );
  }
}