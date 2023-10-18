import 'package:flutter/material.dart';
import 'package:todo/model/data_model.dart';

class Details extends StatelessWidget {
  const Details(
      {super.key,
      required this.title,
      required this.description,
      required this.date,
      required this.index});
  final String title;
  final String description;
  final date;
  final index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: noteModel[index].color,
        // appBar: AppBar(
        //   centerTitle: true,
        //   backgroundColor: const Color.fromARGB(255, 141, 139, 139),
        //   elevation: 4,
        // ),
        body: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              noteModel[index].title,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            SizedBox(
              height: 15,
            ),
            Divider(
              color: Colors.black,
              thickness: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  noteModel[index].date,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 500,
              child: Text(
                noteModel[index].description,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ));
  }
}
