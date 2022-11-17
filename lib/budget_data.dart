import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/budget_info.dart';

class BudgetDataPage extends StatefulWidget {
  const BudgetDataPage({super.key});

  @override
  State<BudgetDataPage> createState() => _BudgetDataPageState();
}

class _BudgetDataPageState extends State<BudgetDataPage> {
  final _formKey = GlobalKey<FormState>();
  String _fullName = "";
  bool undergraduateDegree = false;
  bool diplomaDegree = false;
  bool masterDegree = false;
  bool doctorDegree = false;
  double age = 0;
  String pdbClass = 'A';
  List<String> listPBDClass = ['A', 'B', 'C', 'D', 'E', 'F', 'KI'];
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            ListTile(
              title: const Text('counter_7'),
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage(title: 'Flutter Demo Home Page')),
                );
              },
            ),
            ListTile(
              title: const Text('Add Budget Info'),
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => const BudgetInfoPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Budget Data'),
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BudgetDataPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          for(var item in Data.budgetData)
            Padding(
                padding: const EdgeInsets.all(6.0),
                child: Card(
                  child: Column(
                    children: [
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(item[0],
                            style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        )
                      ),
                      ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${item[1].toString()}\$',
                                  style: const TextStyle(fontSize: 16)
                              ),
                              Text(item[2],
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          )
                      )
                    ],
                  )
                )
            )
        ],
      )
    );
  }
}