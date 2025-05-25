import 'package:flutter/material.dart';


class CurrentConverterMaterialApp extends StatefulWidget{
  
  const CurrentConverterMaterialApp({super.key});
  @override
  State<CurrentConverterMaterialApp> createState() => _CurrencyConverter();
}

class _CurrencyConverter extends State<CurrentConverterMaterialApp> {
  
  double result = 0.0;
  final TextEditingController textEditingController = TextEditingController();


  void convert(){
     result = double.parse(textEditingController.text) *81; 
     setState(() {});
  }

 @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(width: 2.0, style: BorderStyle.solid),
      borderRadius: BorderRadius.all(Radius.circular(5)),
    );

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Center(
            child: Text(
              "Currency Converter",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
            ),
          ),
          backgroundColor: Colors.blueGrey,
          elevation: 0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '₹ ${result != 0 ? result.toStringAsFixed(2) : 0}',
                style: TextStyle(
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              // ElevatedButton(onPressed: () {}, child: Text("Convert")),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: textEditingController,
                  style: TextStyle(color: Colors.black),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.monetization_on_outlined),
                    prefixIconColor: Colors.black,
                    hintText: "Please Enter the amount in USD",
                    hintStyle: TextStyle(color: Colors.black),
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: border,
                    enabledBorder: border,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                  onPressed: () {
                    convert();
                  },
                  // style: ButtonStyle(
                  //   backgroundColor: WidgetStatePropertyAll(Colors.black),
                  //   foregroundColor: WidgetStatePropertyAll(Colors.greenAccent),
                  //   minimumSize: WidgetStatePropertyAll(
                  //     Size(double.infinity, 50),
                  //   ),
                  //   shape: WidgetStatePropertyAll(
                  //     RoundedRectangleBorder( 
                  //       borderRadius: BorderRadius.circular(5),
                  //     ),
                  //   ),
                  // ),

                  style: TextButton.styleFrom(
                      backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    minimumSize: 
                      Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                  ),
                  child: Text("Convert"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                  onPressed: () {
                       

                    setState(() {
                      result = 0.0; 
                      textEditingController.clear();
                    });
                  },
                  // style: ButtonStyle(
                  //   backgroundColor: WidgetStatePropertyAll(Colors.black),
                  //   foregroundColor: WidgetStatePropertyAll(Colors.greenAccent),
                  //   minimumSize: WidgetStatePropertyAll(
                  //     Size(double.infinity, 50),
                  //   ),
                  //   shape: WidgetStatePropertyAll(
                  //     RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(5),
                  //     ),
                  //   ),
                  // ),

                  style: TextButton.styleFrom(
                      backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    minimumSize: 
                      Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                  ),
                  child: Text("Clear"),
                ),
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}




  