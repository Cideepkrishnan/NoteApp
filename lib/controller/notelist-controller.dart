// import 'package:hive/hive.dart';
// import 'package:todo/model/data_model.dart';

// class notelist_controller{
//   List<NoteModel>datalist=[];
//     final mybox=Hive.box('notebox');

// }
// void addnote(NoteModel newnote)
// {
//   datalist!.add(noteModel);
// }
// void deletenote(int index)
// {
//   datalist!.removeAt(index);
// }

import 'package:hive_flutter/adapters.dart';
import 'package:todo/model/data_model.dart';

class NoteController {
  final Box<NoteModel> _notesBox = Hive.box<NoteModel>('notes');
// load the data from database
  Future<List<NoteModel>> getNotes() async {
    return _notesBox.values.toList();
  }

// add data to database
  Future<void> addNote(NoteModel note) async {
    await _notesBox.add(note);
  }

// edit the saved datas
  Future<void> editNote(int index, NoteModel updatedNote) async {
    await _notesBox.putAt(index, updatedNote);
  }

// delete the saved datas
  Future<void> deleteNote(int index) async {
    await _notesBox.deleteAt(index);
  }
}
