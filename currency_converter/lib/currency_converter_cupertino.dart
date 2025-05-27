import 'package:flutter/cupertino.dart';

class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({super.key});

  @override
  State<CurrencyConverterCupertinoPage> createState() => _CurrencyConverterCupertinoPageState();

}

class _CurrencyConverterCupertinoPageState extends State<CurrencyConverterCupertinoPage> {
  double result = 0.0;
  final TextEditingController textEditingController = TextEditingController();
  
    void convert(){
     result = double.parse(textEditingController.text) *81; 
     setState(() {});
  }

     @override
      void dispose(){
      textEditingController.dispose();
      super.dispose();
     }

  @override
  Widget build(BuildContext context) {

    return CupertinoPageScaffold(
        backgroundColor: CupertinoColors.systemGrey3,
        navigationBar: CupertinoNavigationBar(
          middle: Center(
            child: Text(
              "Currency Converter",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: CupertinoColors.white),
            ),
          ),
          backgroundColor: CupertinoColors.systemGrey3,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '₹ ${result != 0 ? result.toStringAsFixed(2) : 0}',
                style: TextStyle(
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.white,
                ),
              ),
              // ElevatedButton(onPressed: () {}, child: Text("Convert")),
              Padding(
                padding: const EdgeInsets.all(10),
                child: CupertinoTextField(
                  controller: textEditingController,
                  style: TextStyle(color: CupertinoColors.black),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: BoxDecoration(
                    color: CupertinoColors.white,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  placeholder: 'Please Enter the amount in USD',
                  prefix: Icon(CupertinoIcons.money_dollar),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CupertinoButton(
                  onPressed: convert,
                  color: CupertinoColors.black,
                  child: Text("Convert"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CupertinoButton(
                  onPressed: () {
                    setState(() {
                      result = 0.0; 
                      textEditingController.clear();
                    });
                  },
                  color: CupertinoColors.black,
                  child: Text("Clear"),
                ),
              ),
            
            ],
          ),
        ),
    );
  }
}