import 'package:flutter/material.dart';
import 'package:my_note/Models/NoteModel.dart';
import 'package:my_note/utils/Pallet/ColorPallet.dart';

class NoteWidget extends StatefulWidget {
  const NoteWidget({super.key, required this.note, required this.onBookMarked});

  final NoteModel note;
  final VoidCallback onBookMarked;

  @override
  State<NoteWidget> createState() => _NoteWidgetState();
}

class _NoteWidgetState extends State<NoteWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      margin: EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
        color: Cus_Pallet.white,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.note.title,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    widget.note.isFav = widget.note.isFav ? false : true;
                  });
                },
                icon: Icon(
                  widget.note.isFav ? Icons.bookmark : Icons.bookmark_border,
                  size: 20,
                  color: Cus_Pallet.blue,
                ),
              ),
            ],
          ),
          Container(
            constraints: BoxConstraints(maxHeight: 60),
            child: Text(
              widget.note.description,
              style: TextStyle(
                fontSize: 14,
              ),
              overflow: TextOverflow.fade,
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            width: double.infinity,
            child: Text(
              '${widget.note.date} | ${widget.note.time}',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
