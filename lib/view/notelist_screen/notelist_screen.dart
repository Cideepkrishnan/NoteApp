import 'package:flutter/material.dart';
import 'package:todo/controller/notelist-controller.dart';
// import 'package:hive/hive.dart';
import 'package:todo/model/data_model.dart';
import 'package:todo/view/details_screen/details_screen.dart';

class notelist_screen extends StatefulWidget {
  const notelist_screen(
      {super.key,
      required this.title,
      required this.description,
      required this.date});
  final String title;
  final String description;
  final date;

  @override
  State<notelist_screen> createState() => _notelist_screenState();
}

class _notelist_screenState extends State<notelist_screen> {
  final NoteController _noteController = NoteController();
  late List<NoteModel> _notes = [];
  int existingNoteIndex = -1;

  TextEditingController todoController = TextEditingController();

  // var myDb= Hive.box('testBox');

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  int isSelectedColor = 0;
  Color? selectedColor;
  DateTime selectedDate = DateTime.now();

  void initState() {
    _loadNotes();
    super.initState();
  }

  Future<void> _loadNotes() async {
    final notes = await _noteController.getNotes();
    setState(() {
      _notes = notes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 42, 40, 40),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 234, 176, 3),
          elevation: 5,
          centerTitle: false,
          title: Text(
            "Notes",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontStyle: FontStyle.italic),
          ),
          actions: [
            Icon(
              Icons.more_vert,
              color: Colors.black,
              size: 30,
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    height: 400,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 20, right: 20, bottom: 20),
                            padding: EdgeInsets.only(left: 20),
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(20)),
                            child: TextField(
                              controller: titleController,
                              decoration: InputDecoration(
                                  hintText: "Title", border: InputBorder.none),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 20, right: 20, bottom: 20),
                            padding: EdgeInsets.only(left: 20),
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(20)),
                            child: TextField(
                              keyboardType: TextInputType.multiline,
                              controller: descriptionController,
                              decoration: InputDecoration(
                                  hintText: "Description",
                                  border: InputBorder.none),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20, right: 20),
                            padding: EdgeInsets.only(left: 20),
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(20)),
                            child: TextField(
                              controller: dateController,
                              decoration: InputDecoration(
                                  hintText: "date", border: InputBorder.none),
                              // Icon(Icons.calendar_month)
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 20,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: const NeverScrollableScrollPhysics(),
                                // shrinkWrap: true,
                                itemCount: color.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      selectedColor = color[index];
                                      isSelectedColor = index;
                                      setState(() {});
                                    },
                                    child: CircleAvatar(
                                      radius: 15,
                                      backgroundColor: color[index],
                                      child: isSelectedColor == index
                                          ? Icon(
                                              Icons.check,
                                              color: Colors.white,
                                              size: 13,
                                            )
                                          : null,
                                    ),
                                  );
                                }),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                noteModel.add(NoteModel(
                                    // date: dateController.text,
                                    date:
                                        "${selectedDate.day}  - ${selectedDate.month} - ${selectedDate.year}",
                                    description: descriptionController.text,
                                    title: titleController.text,
                                    color: selectedColor!));
                              });
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              width: 200,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.deepPurpleAccent,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text(
                                'Save',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white),
                              )),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          child: Icon(
            Icons.add,
            size: 35,
            color: Colors.blue,
          ),
        ),
        body: ListView.builder(
            itemCount: noteModel.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Details(
                            index: index,
                            title: widget.title ?? "",
                            description: widget.description ?? "",
                            date: widget.date ?? "",
                          )));
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  // height: 100,
                  margin: EdgeInsets.only(top: 25, left: 15, right: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: noteModel[index].color,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ListTile(
                        title: Text(noteModel[index].title),
                        subtitle: Text(noteModel[index].description),
                        trailing: Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  noteModel.removeAt(index);
                                });
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.share)),
                      Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: Text(noteModel[index].date),
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}
