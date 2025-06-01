import 'package:flutter/material.dart';
import 'package:local_database_sqlite/add_note_page.dart';
import 'package:local_database_sqlite/data/local/db_helper.dart';
import 'package:local_database_sqlite/provider.dart';
import 'package:local_database_sqlite/setting_page.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Map<String, dynamic>> allNotes = [];
  // DBHelper? dbRef;
  String errorMessage = "";

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // dbRef = DBHelper.getInstance;

    context.read<DBProvider>().getInitialNotes();
    // getNotes();
  }

  // void getNotes() async {
  //   allNotes = await dbRef!.getAllNotes();
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notes'), centerTitle: true,
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
        })
      ],
      ),
      body:Consumer<DBProvider>(
        builder: (ctx,provider,__){

          List<Map<String,dynamic>> allNotes = provider.getNotes();
          return 
          allNotes.isNotEmpty
              ? ListView.builder(
                itemCount: allNotes.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    leading: Text('${index + 1})'),
                    title: Text(allNotes[index][DBHelper.COLUMN_NOTE_TITLE]),
                    subtitle: Text(allNotes[index][DBHelper.COLUMN_NOTE_DESC]),
                    trailing: SizedBox(
                      width: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              int sNo =
                                  allNotes[index][DBHelper.COLUMN_NOTE_SNO];

                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return AddNotePage(
                                      isupdate: true,
                                      sNo: sNo,
                                      title:
                                          allNotes[index][DBHelper
                                              .COLUMN_NOTE_TITLE],
                                      desc:
                                          descController.text =
                                              allNotes[index][DBHelper
                                                  .COLUMN_NOTE_DESC],
                                    );
                                  },
                                ),
                              );
                              //   showModalBottomSheet(
                              //     context: context,
                              //     builder: (context) {
                              //       int sNo =
                              //           allNotes[index][DBHelper.COLUMN_NOTE_SNO];
                              //       titleController.text =
                              //           allNotes[index][DBHelper
                              //               .COLUMN_NOTE_TITLE];
                              //       descController.text =
                              //           allNotes[index][DBHelper
                              //               .COLUMN_NOTE_DESC];
                              //       return getBottomSheetView(
                              //         isupdate: true,
                              //         sNo: sNo,
                              //       );
                              //     },
                              //   );
                            },
                            child: Icon(Icons.edit, color: Colors.blue),
                          ),

                          InkWell(
                            onTap: () async {

                              context.read<DBProvider>().deleteNotes(allNotes[index][DBHelper.COLUMN_NOTE_SNO]);
                              // int sNo =
                              //     allNotes[index][DBHelper.COLUMN_NOTE_SNO];
                              // bool checkNote = await dbRef!.deleteNote(
                              //   sNo: sNo,
                              // );
                              // if (checkNote) {
                              //   getNotes();
                              // }
                            },
                            child: Icon(Icons.delete, color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
              : Center(child: Text('No data found'));
      }),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (Context) {
                return AddNotePage();
              },
            ),
          );
          // showModalBottomSheet(
          //   context: context,
          //   builder: (context) {
          //     return getBottomSheetView();
          //   },
          // );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // Widget getBottomSheetView({bool isupdate = false, int sNo = 0}) {
  //   return Container(
  //     width: double.infinity,
  //     padding: EdgeInsets.all(11),
  //     child: Column(
  //       children: [
  //         Text(
  //           isupdate ? "Update Note" : "Add Note",
  //           style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
  //         ),

  //         SizedBox(height: 10),
  //         TextField(
  //           controller: titleController,
  //           decoration: InputDecoration(
  //             label: Text('Title *'),
  //             hintText: "Enter the Title",
  //             focusedBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(11),
  //             ),
  //             enabledBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(11),
  //             ),
  //           ),
  //         ),

  //         SizedBox(height: 10),
  //         TextField(
  //           controller: descController,
  //           maxLines: 5,
  //           decoration: InputDecoration(
  //             label: Text("Description *"),
  //             hintText: "Enter the Description",
  //             focusedBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(11),
  //             ),
  //             enabledBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(11),
  //             ),
  //           ),
  //         ),

  //         SizedBox(height: 10),

  //         Row(
  //           children: [
  //             Expanded(
  //               child: OutlinedButton(
  //                 style: OutlinedButton.styleFrom(
  //                   side: BorderSide(width: 1),
  //                   shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(11),
  //                   ),
  //                 ),
  //                 onPressed: () async {
  //                   var title = titleController.text;
  //                   var desc = descController.text;
  //                   if (title.isNotEmpty && desc.isNotEmpty) {
  //                     bool check =
  //                         isupdate
  //                             ? await dbRef!.updateNote(
  //                               mTitle: title,
  //                               mDesc: desc,
  //                               srno: sNo,
  //                             )
  //                             : await dbRef!.addNotes(
  //                               mTitle: title,
  //                               mDesc: desc,
  //                             );
  //                     if (check) {
  //                       getNotes();
  //                       titleController.clear();
  //                       descController.clear();
  //                     }
  //                   } else {
  //                     ScaffoldMessenger.of(context).showSnackBar(
  //                       SnackBar(
  //                         content: Text(
  //                           'please fill all the requireds blanks !!!',
  //                         ),
  //                       ),
  //                     );
  //                   }
  //                   Navigator.pop(context);
  //                 },
  //                 child: Text(isupdate ? "Update Note" : "Add Note"),
  //               ),
  //             ),

  //             SizedBox(width: 10),

  //             Expanded(
  //               child: OutlinedButton(
  //                 style: OutlinedButton.styleFrom(
  //                   side: BorderSide(width: 1),
  //                   shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(11),
  //                   ),
  //                 ),
  //                 onPressed: () {
  //                   Navigator.pop(context);
  //                 },
  //                 child: Text("Cancel"),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
