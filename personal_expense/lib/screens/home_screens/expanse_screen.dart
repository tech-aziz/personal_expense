import 'package:flutter/material.dart';

class ExpanseScreen extends StatefulWidget {
  const ExpanseScreen({Key? key}) : super(key: key);

  @override
  State<ExpanseScreen> createState() => _EarnScreenState();
}

class _EarnScreenState extends State<ExpanseScreen> {
  List<Map<String, dynamic>> expanseList = [
    {'title': 'Medicine', 'amount': '\$100', 'date': '11-3-2023'},
    {'title': 'Grocery', 'amount': '\$150', 'date': '12-3-2023'},
    {'title': 'Transport', 'amount': '\$340', 'date': '14-3-2023'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: expanseList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
              ),
              color: Colors.green.withOpacity(0.5),
              elevation: 12,
              child: ListTile(
                title: Text(expanseList[index]['title']),
                subtitle: Text(expanseList[index]['date']),
                trailing: Text(expanseList[index]['amount']),
              ),
            ),
          );
        },
      ),
    );
  }
}
