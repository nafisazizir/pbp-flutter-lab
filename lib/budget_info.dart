import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/budget_data.dart';

class BudgetInfoPage extends StatefulWidget {
  const BudgetInfoPage({super.key});

  @override
  State<BudgetInfoPage> createState() => _BudgetInfoPageState();
}

class Data {
  static List budgetData = [];
}

class _BudgetInfoPageState extends State<BudgetInfoPage> {
  final _formKey = GlobalKey<FormState>();
  String _title = "";
  int _amount = 0;
  String? type;
  List<String> listType = ['Income', 'Expense'];

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
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  // Using padding of 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Example: Makan Siang Masjep",
                      labelText: "Title",
                      // Added a circular border to make it neater
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Added behavior when name is typed
                    onChanged: (String? value) {
                      setState(() {
                        _title = value!;
                      });
                    },
                    // Added behavior when data is saved
                    onSaved: (String? value) {
                      setState(() {
                        _title = value!;
                      });
                    },
                    // Validator as form validation
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Title cannot be empty!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  // Using padding of 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Example: 15000",
                      labelText: "Amount",
                      // Added a circular border to make it neater
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Added behavior when name is typed
                    onChanged: (String? value) {
                      setState(() {
                        _amount = int.parse(value!);
                      });
                    },
                    // Added behavior when data is saved
                    onSaved: (String? value) {
                      setState(() {
                        _amount = int.parse(value!);
                      });
                    },
                    // Validator as form validation
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Amount cannot be empty!';
                      }
                      return null;
                    },
                  ),
                ),
                DropdownButton(
                  hint: const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                          "Choose Type"
                      )
                  ),
                  value: type,
                  underline: const SizedBox(),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: listType.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      type = newValue ?? "";
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    var store = [];
                    store.add(_title);
                    store.add(_amount);
                    store.add(type);
                    Data.budgetData.add(store);
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 15,
                          child: Container(
                            child: ListView(
                              padding: const EdgeInsets.only(top: 20, bottom: 20),
                              shrinkWrap: true,
                              children: <Widget>[
                                Center(child: Text('Your data has been saved')),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const BudgetDataPage())
                                        );
                                  },
                                  child: const Text('Return'),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
                child: const Text(
                  "Save",
                  style: TextStyle(color: Colors.white),

                ),
              ),
            ],
          )
      ),
    );
  }
}