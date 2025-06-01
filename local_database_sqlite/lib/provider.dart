import 'package:flutter/material.dart';
import 'package:local_database_sqlite/data/local/db_helper.dart';

class DBProvider extends ChangeNotifier {
  DBHelper dbHelper;
  DBProvider({required this.dbHelper});
  List<Map<String, dynamic>> _mdata = [];

  void addNotes(String title, String desc) async{
    bool check = await dbHelper.addNotes(mTitle: title, mDesc: desc);
    if(check){
      _mdata = await dbHelper.getAllNotes();
      notifyListeners();
    }
  }


   void updateNotes(String title, String desc,int sno) async{
    bool check = await dbHelper.updateNote(mTitle: title, mDesc: desc, srno: sno);
    if(check){
      _mdata = await dbHelper.getAllNotes();
      notifyListeners();
    }
  }


  void deleteNotes(int sno) async{
    bool check = await dbHelper.deleteNote(sNo: sno);
    if(check){
      _mdata = await dbHelper.getAllNotes();
      notifyListeners();
    }
  }

  List<Map<String,dynamic>> getNotes() => _mdata;

  void getInitialNotes() async {
    _mdata = await dbHelper.getAllNotes();
    notifyListeners();
  }
}
