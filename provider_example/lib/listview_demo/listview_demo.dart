import 'package:flutter/material.dart';
import 'package:provider_example/listview_demo/sample_data.dart';

class ListviewDemo extends StatefulWidget {
  const ListviewDemo({super.key});

  @override
  State<ListviewDemo> createState() => _ListviewDemoState();
}

class _ListviewDemoState extends State<ListviewDemo> {
  bool islike = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ListView Demo",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset("assets/logos/logo.png"),
                  title: Text(movies[index]["movieTitle"],style: 
                  TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text(movies[index]["movieDesc"]),
                  trailing: Column(
                    children: [
                      Icon(Icons.star_sharp,color: Colors.amber,),
                      Text(movies[index]["rating"].toString()),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CardView extends StatefulWidget {
  const CardView({super.key});

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  bool islike = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset("assets/logos/favicon.png", height: 100),
        Row(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  islike = islike ? false : true;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      islike ? "You liked the post" : "you unliked this post",
                    ),
                  ),
                );
              },
              icon: Icon(
                islike ? Icons.favorite : Icons.favorite_border,
                color: islike ? Colors.red : Colors.black,
              ),
            ),

            Text(islike ? "Liked" : ""),
          ],
        ),
      ],
    );
  }
}
