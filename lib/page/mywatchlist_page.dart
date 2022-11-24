import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_7/model/mywatchlist.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/page/budget_info.dart';
import 'package:counter_7/page/budget_data.dart';
import 'package:counter_7/page/mywatchlist_details.dart';

class MyWatchlistPage extends StatefulWidget {
  const MyWatchlistPage({Key? key}) : super(key: key);

  @override
  State<MyWatchlistPage> createState() => _MyWatchlistPageState();
}

class _MyWatchlistPageState extends State<MyWatchlistPage> {
  Future<List<MyWatchlist>> fetchToDo() async {
    var url = Uri.parse('https://pbp-assg-2.herokuapp.com/mywatchlist/json/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // decode the response into the json form
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    List<MyWatchlist> listMywatchlist = [];
    for (var d in data) {
      if (d != null) {
        listMywatchlist.add(MyWatchlist.fromJson(d["fields"]));
      }
    }
    return listMywatchlist;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Watchlist'),
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
              ListTile(
                title: const Text('My Watchlist'),
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyWatchlistPage()),
                  );
                },
              ),
            ],
          ),
        ),
        body: FutureBuilder(
            future: fetchToDo(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "To do list is empty :(",
                        style: TextStyle(
                            color: Color(0xff59A5D8),
                            fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index)=> Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                        child:ListTile(
                            title:Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment:  CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "${snapshot.data![index].title}",
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500
                                    )
                                )
                              ],
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context)  => DetailsPage(rating: snapshot.data![index].rating,
                                      releaseDate: snapshot.data![index].releaseDate,
                                      review: snapshot.data![index].review,
                                      title: snapshot.data![index].title,
                                      watched: snapshot.data![index].watched)
                                  ));
                            }
                        ),
                      )
                  );
                }
              }
            }
        )
    );
  }
}