import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_note/Models/NoteModel.dart';
import 'package:my_note/utils/Custom/DescriptionTextField.dart';
import 'package:my_note/utils/Custom/TitleTextField.dart';
import '../../utils/Pallet/ColorPallet.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({super.key});
  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  String time = '';
  String date = '';
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)?.settings.arguments as NoteModel;
    titleController.text = data.title;
    descriptionController.text = data.description;
    isFav = data.isFav;
    date = data.date;
    time = data.time;
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
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              isFav? Icons.bookmark : Icons.bookmark_border,
              color: Cus_Pallet.blue,
            ),
          ),
        ],
      ),
      body: Container(
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
    );
  }

  @override
  void dispose() {
    super.dispose();
    editNote();
  }

  void editNote() async {
    final datetime = DateTime.now();
    date = DateFormat('dd-MM-yyyy').format(datetime);
    time = DateFormat('hh:mm a').format(datetime);
  }
}
