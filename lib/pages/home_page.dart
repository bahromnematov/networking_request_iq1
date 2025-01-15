import 'package:flutter/material.dart';
import 'package:networking_request/service/networ_service.dart';

import '../model/post_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> items = [];
  var isLoading = false;

  void apiPostList() async {
    setState(() {
      isLoading = true;
    });
    var response = await Network.GET(Network.apiPosts, Network.paramsEmpty());
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
                child: ListTile(
                  title: Text(
                    items[index].email,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text(
                    items[index].body,
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  leading: Text(
                    items[index].id.toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
            itemCount: items.length,
          ),
          isLoading ? Center(child: CircularProgressIndicator()) : SizedBox()
        ],
      ),
    );
  }
}
