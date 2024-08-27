import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InvestmentGoalSection extends StatefulWidget {
  @override
  _InvestmentGoalSectionState createState() => _InvestmentGoalSectionState();
}

class _InvestmentGoalSectionState extends State<InvestmentGoalSection> {
  final TextEditingController _goalController = TextEditingController();
  bool _isGoalSet = false;

  @override
  void initState() {
    super.initState();
    _loadGoal();
  }

  Future<void> _loadGoal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? goal = prefs.getString('investment_goal');
    if (goal != null && goal.isNotEmpty) {
      setState(() {
        _goalController.text = goal;
        _isGoalSet = true;
      });
    }
  }

  Future<void> _saveGoal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('investment_goal', _goalController.text);
  }

  void _toggleGoal() {
    setState(() {
      if (_isGoalSet) {
        // User is updating the goal, make the text field editable
        _isGoalSet = false;
      } else {
        // User is setting the goal for the first time or updating it
        if (_goalController.text.isNotEmpty) {
          _isGoalSet = true;
          _saveGoal();
          Fluttertoast.showToast(
            msg: "Goal Set Successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.blueAccent,
            textColor: Colors.white,
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'INVESTMENT GOAL',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'PoppinsMedium'
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _goalController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixText: '₹',
                hintStyle: TextStyle(
                  fontFamily: 'PoppinsMedium'
                ),
                border: OutlineInputBorder(),
                labelText: 'Enter Amount',
                labelStyle: TextStyle(
                  fontFamily: 'PoppinsMedium'
                )
              ),
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'PoppinsMedium'
                ),
              enabled: !_isGoalSet, // Disable editing if the goal is set
            ),
            SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: _toggleGoal,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                ),
                child: Text(
                  _isGoalSet ? 'UPDATE GOAL' : 'SET GOAL',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontFamily: 'PoppinsMedium'
                    ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}