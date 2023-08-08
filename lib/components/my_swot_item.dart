import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MySwotItem extends StatelessWidget {
  final String itemName;
  final bool itemSelected;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? settingsTapped;
  final Function(BuildContext)? deleteTapped;
  final Color back;

  const MySwotItem(
      {super.key,
      required this.itemName,
      required this.itemSelected,
      required this.onChanged,
      required this.settingsTapped,
      required this.deleteTapped,
      required this.back});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          // settings option
          SlidableAction(
            onPressed: settingsTapped,
            backgroundColor: Colors.grey.shade800,
            icon: Icons.settings,
            borderRadius: BorderRadius.circular(12),
          ),

          // delete option
          SlidableAction(
            onPressed: deleteTapped,
            backgroundColor: Colors.red.shade400,
            icon: Icons.delete,
            borderRadius: BorderRadius.circular(12),
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          /* color: Colors.white, */
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // checkbox
            Checkbox(
              activeColor: back,
              checkColor: Colors.white,
              value: itemSelected,
              onChanged: onChanged,
            ),

            // habit name
            Expanded(
              /* flex: 1, */
              child: Text(
                itemName,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
