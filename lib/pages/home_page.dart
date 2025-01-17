import 'package:flutter/material.dart';
import 'package:networking_request/service/networ_service.dart';

import '../model/user_model.dart';
import '../model/valyuta_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ValyutaModel> items = [];
  var isLoading = false;

  void apiPostList() async {
    setState(() {
      isLoading = true;
    });
    var response = await Network.GET();
    setState(() {
      isLoading = false;
      items = Network.parsePostList(response);
      print(items);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    items[index].ccyNmUz,
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(items[index].nominal),
                  Text(
                    items[index].rate,
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    items[index].date.toString(),
                    style: TextStyle(
                        color: Colors.orange, fontWeight: FontWeight.bold),
                  ),
                ],
              ));
            },
            itemCount: items.length,
          ),
          isLoading ? Center(child: CircularProgressIndicator()) : SizedBox()
        ],
      ),
    );
  }
}
