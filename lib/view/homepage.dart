import 'package:flutter/material.dart';
import 'package:usefull_widgets/config/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Text(
              "Widgets that I customize & use frequently",
              style: CustomTheme.title(context),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
