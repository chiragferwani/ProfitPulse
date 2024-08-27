import 'package:flutter/material.dart';
import 'package:profitpulse/banks.dart';

class BankList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: [
              _buildBankCard(context, 'SBI', 'assets/images/sbi.png', '/sbi'),
              _buildBankCard(context, 'Kotak', 'assets/images/kotak.png', '/sbi'),
              _buildBankCard(context, 'SBI', 'assets/images/icici.png', '/sbi'),
              _buildBankCard(context, 'SBI', 'assets/images/axis.png', '/sbi'),
              _buildBankCard(context, 'SBI', 'assets/images/cosmos.png', '/sbi'),
              _buildBankCard(context, 'SBI', 'assets/images/hdfc.png', '/sbi'),
              
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBankCard(BuildContext context, String bankName, String imagePath, String route) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Banks()));
      },
      child: Container(
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                height: 75,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
      ),
    );
  }
}