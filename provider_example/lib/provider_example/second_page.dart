import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/provider_example/list_number_provider.dart';

class SecondPage extends StatefulWidget {
  SecondPage({super.key
  });

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
      context.read<ListNumberProvider>().add();
      },child: Icon(Icons.add),),
      appBar: AppBar(),
      body: Consumer<ListNumberProvider>(
        builder: (ctx,provider,__) => Column(
          children: [
            Text(provider.numbers.last.toString(),
            style: TextStyle(
              fontSize: 30
            ),),
            Container(
              width: double.infinity,
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: provider.numbers.length,
                itemBuilder: (context,index){
                  return Text(provider.numbers[index].toString(),
                  style: TextStyle(
                    fontSize: 30
                  ),);
              }),
            ),
          ],
        ),
      ),
    );
  }
}