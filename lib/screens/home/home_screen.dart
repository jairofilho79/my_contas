import 'package:flutter/material.dart';

import 'components/body.dart';
import 'components/speed_dial.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Body(),
      floatingActionButton: buildSpeedDial(context),
    );
  }
}
