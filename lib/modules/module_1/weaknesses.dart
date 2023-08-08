import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../components/my_alert_box.dart';
import '../../components/my_fab.dart';
import '../../components/my_simple_app_bar.dart';
import '../../components/my_simple_container.dart';
import '../../components/my_swot_item.dart';
import '../../components/my_top_module_title.dart';
import '../../data/user_database.dart';

class Weaknesses extends StatefulWidget {
  const Weaknesses({Key? key}) : super(key: key);

  @override
  _WeaknessesState createState() => _WeaknessesState();
}

class _WeaknessesState extends State<Weaknesses> {
  final Color back = const Color(0xff42BF9F);
  final Color lightBackground = const Color(0XFFE2FFF7);
  final Color letter = const Color(0XFF3A907A);
  final Color border = Colors.greenAccent;

  final _newItemController = TextEditingController();

  UserDatabase db = UserDatabase();
  final _myBox = Hive.box("User_Database");

  @override
  void initState() {
    // If first time...
    if (_myBox.get("swotWeaknesses") == null) {
      db.initWeaknesses();
    } else {
      db.loadWeaknesses();
    }

    // update
    db.updateWeaknesses();
    super.initState();
  }

  // checkbox was tapped
  void checkBoxTapped(bool? value, int index) {
    setState(() {
      db.swotWeaknesses[index][1] = value;
    });
    db.updateWeaknesses();
  }

  void createNewItem() {
    // show alert dialog for user to enter the new item details
    showDialog(
      context: context,
      builder: (context) {
        return MyAlertBox(
          letter: letter,
          lightBackground: lightBackground,
          buttonColor: back,
          controller: _newItemController,
          hintText: 'Ingresa tu debilidad',
          onSave: saveNewItem,
          onCancel: cancelDialogBox,
        );
      },
    );
  }

  // save new item
  void saveNewItem() {
    // add new item list
    setState(() {
      db.swotWeaknesses.add([_newItemController.text, false]);
    });

    // clear textfield
    _newItemController.clear();
    // pop dialog box
    Navigator.of(context).pop();
    db.updateWeaknesses();
  }

  // cancel new item
  void cancelDialogBox() {
    // clear textfield
    _newItemController.clear();

    // pop dialog box
    Navigator.of(context).pop();
  }

  // delete strenghts item
  void deleteItem(int index) {
    setState(() {
      db.swotWeaknesses.removeAt(index);
    });
    db.updateWeaknesses();
  }

  // save existing habit with a new name
  void saveExistingItem(int index) {
    setState(() {
      db.swotWeaknesses[index][0] = _newItemController.text;
    });
    _newItemController.clear();
    Navigator.pop(context);
    db.updateWeaknesses();
  }

  // open habit settings to edit
  void openItemSettings(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return MyAlertBox(
          letter: letter,
          lightBackground: lightBackground,
          buttonColor: back,
          controller: _newItemController,
          hintText: db.swotWeaknesses[index][0],
          onSave: () => saveExistingItem(index),
          onCancel: cancelDialogBox,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MySimpleAppBar(back: back, lightBackground: lightBackground),
      backgroundColor: back,
      floatingActionButton: MyFloatingActionButton(
        onPressed: createNewItem,
        back: back,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
        child: Column(
          children: [
            MyTopModuleTitle(
                title:
                    "DEBILIDADES\n(aspectos propios de la persona y deben ser superadas)",
                letter: letter,
                lightBackground: lightBackground),

            // LIST OF ITEMS
            Expanded(
              child: MySimpleContainer(
                lightBackground: lightBackground,
                child: SingleChildScrollView(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: db.swotWeaknesses.length,
                    itemBuilder: (context, index) {
                      return MySwotItem(
                        back: back,
                        itemName: db.swotWeaknesses[index][0],
                        itemSelected: db.swotWeaknesses[index][1],
                        onChanged: (value) => checkBoxTapped(value, index),
                        settingsTapped: (context) => openItemSettings(index),
                        deleteTapped: (context) => deleteItem(index),
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
