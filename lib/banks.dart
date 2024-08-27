import 'package:flutter/material.dart';
import 'package:profitpulse/bankdetails.dart';
import 'package:iconsax/iconsax.dart';
import 'package:profitpulse/profile.dart';

class Banks extends StatelessWidget {
  const Banks({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 15),
             Text(
                'BANK DETAILS',
                style: TextStyle(
                  fontWeight: FontWeight.bold, 
                  fontSize: 20,
                  fontFamily: 'PoppinsMedium'),
              ),
              SizedBox(height: 10),
            BankDetails(
              bankLogo: 'assets/images/sbi.png',  // Example path for the bank logo image
              bankName: 'State Bank of India',
              fdRates: '7.12-9.05%',
              loanRates: '8.2-10.5%',
              investmentRates: '6.34-8.9%',
              onTap: () {
                //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Banks()));
              },
          ),
          SizedBox(height: 5),
            BankDetails(
              bankLogo: 'assets/images/kotak.png',  // Example path for the bank logo image
              bankName: 'Kotak Mahindra Bank',
              fdRates: '6.2-7.4%',
              loanRates: '9-10%',
              investmentRates: '7.5-9%',
              onTap: () {
                //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Banks()));
              },
          ),
          SizedBox(height: 5),
            BankDetails(
              bankLogo: 'assets/images/icici.png',  // Example path for the bank logo image
              bankName: 'ICICI Bank',
              fdRates: '5.5-7%',
              loanRates: '10.3-12%',
              investmentRates: '8-9%',
              onTap: () {
                //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Banks()));
              },
          ),
          SizedBox(height: 5),
            BankDetails(
              bankLogo: 'assets/images/axis.png',  // Example path for the bank logo image
              bankName: 'AXIS Bank',
              fdRates: '6.7-8.6%',
              loanRates: '6.25-10%',
              investmentRates: '10.2-11%',
              onTap: () {
                //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Banks()));
              },
          ),
          SizedBox(height: 5),
            BankDetails(
              bankLogo: 'assets/images/cosmos.png',  // Example path for the bank logo image
              bankName: 'Cosmos Bank',
              fdRates: '4.3-6%',
              loanRates: '6-9%',
              investmentRates: '7.5-10.5%',
              onTap: () {
                //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Banks()));
              },
          ),
          SizedBox(height: 5),
            BankDetails(
              bankLogo: 'assets/images/hdfc.png',  // Example path for the bank logo image
              bankName: 'HDFC Bank',
              fdRates: '6.3-8%',
              loanRates: '7.2-9%',
              investmentRates: '8-11.5%',
              onTap: () {
                //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Banks()));
              },
          ),
            ],
          ),
        ),
      ),
    );
  }
}