import 'package:flutter/material.dart';

class InvestmentCalculator extends StatefulWidget {
  const InvestmentCalculator({super.key});

  @override
  State<InvestmentCalculator> createState() => _InvestmentCalculatorState();
}

class _InvestmentCalculatorState extends State<InvestmentCalculator> {
 final TextEditingController _goalAmountController = TextEditingController();
  final TextEditingController _investmentAmountController =
      TextEditingController();
  final TextEditingController _interestRateController =
      TextEditingController();
  final TextEditingController _riskFactorController = TextEditingController();

  String _selectedInvestmentOption = 'Stocks';
  String _selectedInvestmentPeriod = '1 Month';

  double _expectedReturns = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Investment Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Investment Goal Amount
              _buildInputField(
                'Enter Goal Amount',
                _goalAmountController,
                '₹1,00,000',
              ),
              SizedBox(height: 10),
              // Investment Amount
              _buildInputField(
                'Enter Investment',
                _investmentAmountController,
                '₹5,000',
              ),
              SizedBox(height: 10),
              // Investment Options Dropdown
              _buildDropdown(
                'Investment Options',
                _selectedInvestmentOption,
                (String? newValue) {
                  setState(() {
                    _selectedInvestmentOption = newValue!;
                  });
                },
                ['Stocks', 'Mutual Fund', 'Fixed Deposit', 'Real Estates', 'Gold'],
              ),
              SizedBox(height: 10),
              // Investment Period Dropdown
              _buildDropdown(
                'Investment Period',
                _selectedInvestmentPeriod,
                (String? newValue) {
                  setState(() {
                    _selectedInvestmentPeriod = newValue!;
                  });
                },
                ['1 Month', '6 Months', '1 Year', '5 Years', '10 Years'],
              ),
              SizedBox(height: 10),
              // Interest Rate
              _buildInputField(
                'Enter Interest Rate',
                _interestRateController,
                '10%',
              ),
              SizedBox(height: 10),
              // Risk Factor
              _buildInputField(
                'Enter Risk Factor',
                _riskFactorController,
                '2-10%',
              ),
              SizedBox(height: 20),
              // Calculate Button
              Center(
                child: ElevatedButton(
                  onPressed: _calculateReturns,
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
              SizedBox(height: 20),
              // Expected Returns
              _buildResultField(
                'Expected Returns',
                '₹${_expectedReturns.toStringAsFixed(2)}',
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to create input fields
  Widget _buildInputField(
    String label,
    TextEditingController controller,
    String hintText,
  ) {
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
        SizedBox(height: 5),
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ],
    );
  }

  // Helper function to create dropdowns
  Widget _buildDropdown(
    String label,
    String currentValue,
    ValueChanged<String?> onChanged,
    List<String> items,
  ) {
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
        SizedBox(height: 5),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black38),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: DropdownButton<String>(
            value: currentValue,
            isExpanded: true,
            underline: SizedBox(), // Removes the default underline
            items: items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  // Helper function to create result field
  Widget _buildResultField(String label, String result) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold, 
            fontSize: 16,
            fontFamily: 'PoppinsMedium'
            ),
        ),
        Text(
          result,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
            fontFamily: 'PoppinsMedium'
          ),
        ),
      ],
    );
  }

  // Calculation logic
  void _calculateReturns() {
    double goalAmount =
        double.tryParse(_goalAmountController.text.replaceAll('₹', '').replaceAll(',', '')) ?? 0;
    double investmentAmount =
        double.tryParse(_investmentAmountController.text.replaceAll('₹', '').replaceAll(',', '')) ?? 0;
    double interestRate =
        double.tryParse(_interestRateController.text.replaceAll('%', '')) ?? 0;
    double riskFactor =
        double.tryParse(_riskFactorController.text.replaceAll('%', '')) ?? 0;

    // Simple calculation for expected returns
    setState(() {
      _expectedReturns = investmentAmount * (interestRate / 100) *
          (1 + riskFactor / 100);
    });
  }
}