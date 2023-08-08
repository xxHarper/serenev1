import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../components/my_alert_box.dart';
import '../../components/my_fab.dart';
import '../../components/my_simple_app_bar.dart';
import '../../components/my_simple_container.dart';
import '../../components/my_swot_item.dart';
import '../../components/my_top_module_title.dart';
import '../../data/user_database.dart';

class Opportunities extends StatefulWidget {
  const Opportunities({Key? key}) : super(key: key);

  @override
  _OpportunitiesState createState() => _OpportunitiesState();
}

class _OpportunitiesState extends State<Opportunities> {
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
    if (_myBox.get("swotOpportunities") == null) {
      db.initOpportunities();
    } else {
      db.loadOpportunities();
    }

    // update
    db.updateOpportunities();
    super.initState();
  }

  // checkbox was tapped
  void checkBoxTapped(bool? value, int index) {
    setState(() {
      db.swotOpportunities[index][1] = value;
    });
    db.updateOpportunities();
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
          hintText: 'Ingresa tu oportunidad',
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
      db.swotOpportunities.add([_newItemController.text, false]);
    });

    // clear textfield
    _newItemController.clear();
    // pop dialog box
    Navigator.of(context).pop();
    db.updateOpportunities();
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
      db.swotOpportunities.removeAt(index);
    });
    db.updateOpportunities();
  }

  // save existing habit with a new name
  void saveExistingItem(int index) {
    setState(() {
      db.swotOpportunities[index][0] = _newItemController.text;
    });
    _newItemController.clear();
    Navigator.pop(context);
    db.updateOpportunities();
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
          hintText: db.swotOpportunities[index][0],
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
                height: 130,
                title:
                    "OPORTUNIDADES\n(aspectos que dependen del entorno de las personas y se deben sacar provecho de estas)",
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
                    itemCount: db.swotOpportunities.length,
                    itemBuilder: (context, index) {
                      return MySwotItem(
                        back: back,
                        itemName: db.swotOpportunities[index][0],
                        itemSelected: db.swotOpportunities[index][1],
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
