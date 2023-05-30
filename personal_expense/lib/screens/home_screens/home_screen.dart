import 'package:flutter/material.dart';

import '../widgets/custom_drawer.dart';
import 'earn_screen.dart';
import 'expanse_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _purposeController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                      width: 1, color: Colors.green.withOpacity(0.5))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Azizul Hakim',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.green.withOpacity(0.5))),
                        const Text('Software Engineer')
                      ],
                    ),
                    const CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage(
                          'https://avatars.githubusercontent.com/u/23038515?v=4'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => buildShowDialog(context),
                  child: Container(
                    height: 45,
                    width: 140,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(width: 1, color: Colors.grey)),
                    child: Center(
                      child: Text('Earn',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.green.withOpacity(0.5))),
                    ),
                  ),
                ),
                Container(
                    height: 35,
                    child:
                        VerticalDivider(color: Colors.green.withOpacity(0.5))),
                InkWell(
                  onTap: () => buildShowDialog(context),
                  child: Container(
                      height: 45,
                      width: 140,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(width: 1, color: Colors.grey)),
                      child: Center(
                        child: Text('Expanse',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.green.withOpacity(0.5))),
                      )),
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            DefaultTabController(
                length: 2, // length of tabs
                initialIndex: 0,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const TabBar(
                        indicatorWeight: 0,
                        indicatorColor: Colors.transparent,
                        labelColor: Colors.green,
                        unselectedLabelColor: Colors.black,
                        indicator: BoxDecoration(),
                        tabs: [
                          Tab(text: 'Earn'),
                          Tab(text: 'Expanse'),
                        ],
                      ),
                      Container(
                          height: 300, //height of TabBarView
                          decoration: const BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: Colors.grey, width: 0.5))),
                          child: const TabBarView(children: <Widget>[
                            EarnScreen(),
                            ExpanseScreen()
                          ]))
                    ])),
          ],
        ),
      ),
    );
  }

  Future<dynamic> buildShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: SizedBox(
          height: 250,
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const SizedBox(
                      width: 75,
                      child: Text(
                        'Purpose: ',
                        style: TextStyle(fontSize: 17),
                      )),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          labelText: 'Purpose',
                          labelStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      controller: _purposeController,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Container(
                      width: 75,
                      child: const Text('Amount:',
                          style: TextStyle(fontSize: 17))),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Amount',
                          labelStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      controller: _amountController,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Date:', style: TextStyle(fontSize: 17)),
                  InkWell(
                      onTap: () => _selectDate,
                      child: const Text('Select Date',
                          style: TextStyle(fontSize: 17))),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  height: 45,
                  width: 140,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Center(
                    child: Text('Add',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green.withOpacity(0.5))),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
