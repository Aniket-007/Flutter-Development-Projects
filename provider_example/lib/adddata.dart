import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/list_map_provider.dart';

class AddData extends StatelessWidget {
  const AddData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note')
        ),
        body: Center(child: IconButton(
          onPressed: (){
            context.read<ListMapProvider>().addData(
              {
                "name" : "Aniket",
                "mobile" : "8999764847"
              }
            );
          }, 
          icon: Icon(Icons.add)),),
    );
  }
}

