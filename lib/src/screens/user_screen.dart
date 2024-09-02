import 'package:flutter/material.dart';

import '../reusable_widgets//custom_dropdown.dart';

class UserScreen extends StatefulWidget {

  final String title;

  const UserScreen({super.key, required this.title});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {

  String? environment = "http://";
  String? selectedItem;

  final List<String> _items = [
    'Flipkart',
    'Amazon',
    'Myntra',
    'Nyka',
    'Meesho',
    'Blinkit',
    'Zepto',
    'Porter',
    'Decathlon',
    'Home Decor',
    'Market 99'
  ];

  void _handleRadioValueChange(String? value) {
    setState(() {
      environment = value;
    });
  }

  void _handleCustomDropDownChange(String value) {
    setState(() {
      selectedItem = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Select Environment',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Row(
              children: [
                Radio<String>(
                    value: "prod",
                    groupValue: environment,
                    onChanged: _handleRadioValueChange),
                const Text("Production")
              ],
            ),
            Row(
              children: [
                Radio<String>(
                    value: "Staging",
                    groupValue: environment,
                    onChanged: _handleRadioValueChange),
                const Text("Staging")
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
                child: CustomDropdown(
                  onSelected: _handleCustomDropDownChange,
                  items: _items,
                )),
            const SizedBox(
              height: 25,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple, // Background color
                ),
                onPressed: selectedItem == null
                    ? null
                    : () {
                  // Action to perform when the button is pressed
                  print('ElevatedButton pressed');
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(
                    'Build Store',
                    style: TextStyle(color: Colors.white, fontSize: 16),
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
