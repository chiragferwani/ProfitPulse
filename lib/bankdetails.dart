import 'package:flutter/material.dart';

class BankDetails extends StatelessWidget {
  final String bankLogo;
  final String bankName;
  final String fdRates;
  final String loanRates;
  final String investmentRates;
  final VoidCallback onTap;

  BankDetails({
    required this.bankLogo,
    required this.bankName,
    required this.fdRates,
    required this.loanRates,
    required this.investmentRates,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage(bankLogo), // Use the bankLogo image path
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bankName,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'PoppinsMedium'
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'FD Rates: $fdRates',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'PoppinsMedium'
                      ),
                  ),
                  Text(
                    'Loan Rates: $loanRates',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'PoppinsMedium',
                      ),
                  ),
                  Text(
                    'Investment Rates: $investmentRates',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'PoppinsMedium'
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