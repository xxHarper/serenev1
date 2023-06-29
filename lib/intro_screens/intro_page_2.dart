import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class IntroPage2 extends StatefulWidget {
  const IntroPage2({Key? key}) : super(key: key);

  @override
  _IntroPage2State createState() => _IntroPage2State();
}

class _IntroPage2State extends State<IntroPage2> {
  GlobalKey _betterPlayerKey = GlobalKey();
  BetterPlayerController? _betterPlayerController;
  String url = "https://firebasestorage.googleapis.com/v0/b/demos-d97a5.appspot.com/o/Modulo_2%2Foshi.mp4?alt=media&token=98f2afac-b6c2-409c-b0d9-9dcd80fec334";


  @override
  void initState() {
    // TODO: implement initState
    BetterPlayerConfiguration betterPlayerConfiguration =
        BetterPlayerConfiguration(
            autoPlay: false, aspectRatio: 16 / 9, fit: BoxFit.fitWidth, );

    BetterPlayerDataSourceType type = BetterPlayerDataSourceType.network;

    BetterPlayerDataSource dataSource = BetterPlayerDataSource(type, url);

    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);

    _betterPlayerController!.setupDataSource(dataSource);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Color(0xff4F3C75),
      child: BetterPlayer(
          key: _betterPlayerKey, controller: _betterPlayerController!),
    );
  }
}
