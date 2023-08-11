import 'package:serenev1/bar%20graph/individual_bar.dart';

class BarData {
  final bar;

  BarData({required this.bar});

  List<IndividualBar> barData = [];

  // Initialize bar data
  void initBarData(int x) {
    barData = [
      IndividualBar(x: x, y: bar),
    ];
  }
}
