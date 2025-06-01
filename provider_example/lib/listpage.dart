import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/adddata.dart';
import 'package:provider_example/list_map_provider.dart';

class Listpage extends StatelessWidget {
  const Listpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
        centerTitle: true,
      ),

      body: Consumer<ListMapProvider>(builder: (_,provider,__){
        var allData = provider.getData();
         return allData.isNotEmpty ? ListView.builder(
          itemCount: allData.length,
          itemBuilder: (_,index){
            return ListTile(
              title: Text('${allData[index]['name']}'),
              subtitle: Text('${allData[index]['mobile']}'),
              trailing: SizedBox(
                width: 120,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: (){
                        context.read<ListMapProvider>().updateData({
                          "name" : "Jay",
                          "mobile" : "9657133886"
                        }, index);
                      }, 
                      icon: Icon(Icons.edit),color: Colors.blue,),
                      IconButton(
                      onPressed: (){
                        context.read<ListMapProvider>().removeData(index);
                      }, 
                      icon: Icon(Icons.delete),color: Colors.red,)
                  ],
                ),
              ),

            );
          },) : Center(child: Text('No contacts yet !'),);
      }),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
            FloatingActionButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> AddData()));
            },
            child: Icon(Icons.add),
            ),
        ],
      ),
    );
  }
}