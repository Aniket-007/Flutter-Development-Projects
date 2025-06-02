import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/provider_example/list_number_provider.dart';
import 'package:provider_example/provider_example/second_page.dart';

class HomeNew extends StatefulWidget {
  const HomeNew({super.key});

  @override
  State<HomeNew> createState() => _HomeNewState();
}

class _HomeNewState extends State<HomeNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ListNumberProvider>().add();
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(backgroundColor: Colors.amber),
      body: Consumer<ListNumberProvider>(
        builder:
            (context, provider, __) => Column(
              children: [
                Text(
                  provider.numbers.last.toString(),
                  style: TextStyle(fontSize: 30),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: provider.numbers.length,
                    itemBuilder: (context, index) {
                      return Text(
                        provider.numbers[index].toString(),
                        style: TextStyle(fontSize: 30),
                      );
                    },
                  ),
                ),

                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return SecondPage();
                        },
                      ),
                    );
                  },
                  child: Text("Second"),
                ),
              ],
            ),
      ),
    );
  }
}
