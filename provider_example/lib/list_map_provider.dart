
import 'package:flutter/material.dart';

class ListMapProvider extends ChangeNotifier{

  List<Map<String,dynamic>> _mData = []; 

  List<Map<String,dynamic>> getData() => _mData;

  void addData(Map<String,dynamic> data){
    _mData.add(data);
    notifyListeners();
  }

    void removeData(int index){
    _mData.removeAt(index);
    notifyListeners();
  }


     void updateData(Map<String,dynamic> updateData,int index){
    _mData[index] = updateData; 
    notifyListeners();
  }

}