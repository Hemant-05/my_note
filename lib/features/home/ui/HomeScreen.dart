import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_note/Models/NoteModel.dart';
import 'package:my_note/utils/Custom/NoteWidget.dart';
import '../../../utils/Pallet/ColorPallet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<NoteModel> noteList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cus_Pallet.bg_color,
      appBar: AppBar(
        title: Text('My Note'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return getData();
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
            itemCount: noteList.length,
            itemBuilder: (context, index) {
              NoteModel model = noteList[index];
              return GestureDetector(
                onLongPress: () {
                  deleteDialog(index);
                },
                onTap: () {
                  Navigator.pushNamed(context, 'editingNote', arguments: model);
                },
                child: NoteWidget(
                  note: model,
                  onBookMarked: () {
                    model.isFav = true;
                    model.save();
                  },
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'creatingNote');
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  void deleteDialog(int index) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text('Are you sure to delete this note ?'),
          actions: [
            ElevatedButton(
              onPressed: () async {
                var noteHive = await Hive.openBox('note');
                noteHive.deleteAt(index);
                getData();
                Navigator.pop(context);
              },
              child: Icon(
                Icons.cloud_done_outlined,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.cancel_outlined,
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> getData() async {
    noteList.clear();
    var noteHive = await Hive.openBox('note');
    print(noteHive.length);
    for (int i = 0; i < noteHive.length; i++) {
      NoteModel note = noteHive.get(i) as NoteModel;
      noteList.add(note);
    }
    setState(() {});
  }
}
