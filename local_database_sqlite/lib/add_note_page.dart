import 'package:flutter/material.dart';
import 'package:local_database_sqlite/data/local/db_helper.dart';
import 'package:local_database_sqlite/provider.dart';
import 'package:local_database_sqlite/setting_page.dart';
import 'package:provider/provider.dart';

class AddNotePage extends StatelessWidget {
  bool isupdate;
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  DBHelper? dbRef = DBHelper.getInstance;
  String title, desc;
  int sNo;

  AddNotePage({
    super.key,
    this.isupdate = false,
    this.sNo = 0,
    this.title = "",
    this.desc = "",
  });

  @override
  Widget build(BuildContext context) {

    if(isupdate){
      titleController.text =title;
      descController.text = desc;
    }

    return Scaffold(
      appBar: AppBar(title: Text(isupdate ? "Update Note":'Add Note',style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold
      ),), centerTitle: true,
      actions: [
        PopupMenuButton(itemBuilder: 
        (_){
          return [
            PopupMenuItem(child: Row(
              children: [
                 Icon(Icons.settings),
                 SizedBox(width: 11,),
                 Text("Setting"),
              ],
            ),
            onTap: (){
               Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return SettingPage();
               }));
            },)
          ];
        }),
      ],),

      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(11),
        child: Column(
          children: [
            SizedBox(height: 10),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                label: Text('Title *'),
                hintText: "Enter the Title",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
              ),
            ),

            SizedBox(height: 10),
            TextField(
              controller: descController,
              maxLines: 5,
              decoration: InputDecoration(
                label: Text("Description *"),
                hintText: "Enter the Description",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
              ),
            ),

            SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                    onPressed: () async {
                      var title = titleController.text;
                      var desc = descController.text;
                      if (title.isNotEmpty && desc.isNotEmpty) {

                        if(isupdate){
                          context.read<DBProvider>().updateNotes(title, desc, sNo);
                        }else{
                          context.read<DBProvider>().addNotes(title, desc);
                        }
                        Navigator.pop(context);
                        // bool check =
                        //     isupdate
                        //         ? await dbRef!.updateNote(
                        //           mTitle: title,
                        //           mDesc: desc,
                        //           srno: sNo,
                        //         )
                        //         : await dbRef!.addNotes(
                        //           mTitle: title,
                        //           mDesc: desc,
                        //         );
                        // if (check) {
                        //   Navigator.pop(context);
                        // }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'please fill all the requireds blanks !!!',
                            ),
                          ),
                        );
                      } 
                    },
                    child: Text(isupdate ? "Update Note" : "Add Note"),
                  ),
                ),

                SizedBox(width: 10),

                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
