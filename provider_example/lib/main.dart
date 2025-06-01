import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/counter_provider.dart';
import 'package:provider_example/list_map_provider.dart';
import 'package:provider_example/listpage.dart';

void main() {
  runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=> ListMapProvider()),
          ChangeNotifierProvider(create: (context)=> CounterProvider()),
        ],
        child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Listpage()
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // print("whole page run");
    return Scaffold(
      appBar: AppBar(title: Text('Provider Demo'),),
      body: Center(
        child: Consumer(builder: (ctx,_,__){
          // print("consumer page run");
          return Text(
          // '${Provider.of<CounterProvider>(ctx, listen: true).getcount()}',
          '${ctx.watch<CounterProvider>().getcount()}', 
          style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold
        ),); 
        })
        ),

        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              onPressed: (){
                // Provider.of<CounterProvider>(context,listen: false).incrementCount();      
                context.read<CounterProvider>().incrementCount();    
              },
              child: Icon(Icons.add),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                onPressed: (){
                  // Provider.of<CounterProvider>(context,listen: false).incrementCount();      
                  context.read<CounterProvider>().decrementCount();    
                },
                child: Icon(Icons.remove),
                ),
              ),
          ],
        ),
    );
  }
}
