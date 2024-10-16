import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import '../../Models/NoteModel.dart';
import '../../utils/Custom/DescriptionTextField.dart';
import '../../utils/Custom/TitleTextField.dart';
import '../../utils/Pallet/ColorPallet.dart';

class CreatingNoteScreen extends StatefulWidget {
  const CreatingNoteScreen({super.key});

  @override
  State<CreatingNoteScreen> createState() => _CreatingNoteScreenState();
}

class _CreatingNoteScreenState extends State<CreatingNoteScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String date = '';
  String time = '';
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Cus_Pallet.blue,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          '$date \n $time',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              var noteHive = await Hive.openBox('note_hive');
              print('this is note-hive data ${noteHive.get(0).description}');
            },
            icon: Icon(
              Icons.bookmark_border,
              color: Cus_Pallet.blue,
            ),
          ),
        ],
      ),
      body: Hero(
        tag: 'create',
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              TitleTextField(
                titleController: titleController,
              ),
              DescriptionTextField(
                descriptionController: descriptionController,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (titleController.text.isNotEmpty) {
      createNote();
    }
  }

  void createNote() async {
    int i = 0;
    var noteBox = await Hive.openBox('note_hive');
    NoteModel model = NoteModel(++i, titleController.text.toString(),
        descriptionController.text.toString(), isFav, date, time);
    noteBox.add(model);
  }

  @override
  void initState() {
    final datetime = DateTime.now();
    date = DateFormat('dd-MM-yyyy').format(datetime);
    time = DateFormat('hh:mm a').format(datetime);
  }
}
