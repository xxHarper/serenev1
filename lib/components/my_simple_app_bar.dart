import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main_holder.dart';

class MySimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color back;
  final Color lightBackground;
  final String title;

  const MySimpleAppBar(
      {Key? key,
      required this.back,
      required this.lightBackground,
      this.title = ""})
      : super(key: key);

  Future sos() async {
    final Uri url = Uri(scheme: "tel", path: "911");

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print("No puede abrir unu");
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: back,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          IconButton(
            icon: const Icon(Icons.home),
            tooltip: 'Volver al menú',
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const MainHolder()),
                  (route) => false);
            },
          ),
          IconButton(
            icon: const Icon(Icons.call),
            tooltip: 'Emergencia, 911',
            onPressed: sos,
          ),
        ],
      ),
      centerTitle: true,
      /* actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.call),
          tooltip: 'Emergencia, 911',
          onPressed: sos,
        ),
      ], */
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
