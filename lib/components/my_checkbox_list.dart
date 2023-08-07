import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../data/user_database.dart';

class CheckboxList extends StatefulWidget {
  final Color back;
  final bool enabled;
  final List items;

  CheckboxList({
    Key? key,
    required this.back,
    required this.items,
    this.enabled = false,
  }) : super(key: key);

  @override
  _CheckboxListState createState() => _CheckboxListState();
}

class _CheckboxListState extends State<CheckboxList> {
  UserDatabase db = UserDatabase();

  @override
  Widget build(BuildContext context) {
    db.loadObjetives();

    return ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: widget.items.length,
        itemBuilder: (BuildContext context, int index) {
          return CheckboxListTile(
            checkColor: Colors.white,
            activeColor: widget.back,
            controlAffinity: ListTileControlAffinity.leading,
            value: widget.items[index][1],
            onChanged: widget.enabled
                ? null
                : (bool? value) {
                    setState(() {
                      db.updateObjetives(index, value!);
                      widget.items[index][1] = value;
                    });
                  },
            title: Text(
              db.objetivesModule1[index][0],
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        });
  }
}
