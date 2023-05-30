import 'package:flutter/material.dart';
class EarnScreen extends StatefulWidget {
  const EarnScreen({Key? key}) : super(key: key);

  @override
  State<EarnScreen> createState() => _EarnScreenState();
}

class _EarnScreenState extends State<EarnScreen> {

  List<Map<String, dynamic>> earnList = [
    {
      'title':'Freelancing',
      'amount':'\$250',
      'date':'12-3-2023'
    },
    {
      'title':'Job',
      'amount':'\$220',
      'date':'12-3-2023'
    },
    {
      'title':'Local job',
      'amount':'\$550',
      'date':'12-3-2023'
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: earnList.length,
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
              title: Text(earnList[index]['title']),
              subtitle: Text(earnList[index]['date']),
              trailing: Text(earnList[index]['amount']),
            ),
          ),
        );
      },),
    );
  }
}
