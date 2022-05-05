import 'package:flutter/material.dart';
import 'package:usefull_widgets/config/palette.dart';
import 'package:usefull_widgets/config/theme.dart';
import 'package:usefull_widgets/widgets/form_elements/check_box.dart';
import 'package:usefull_widgets/widgets/form_elements/custom_textfield.dart';
import 'package:usefull_widgets/widgets/tabbar_view/custom_tabbar.dart';

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
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                shrinkWrap: true,
                childAspectRatio: 1,
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 20,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const GridViewItem(
                    name: "Custom Tabbar View",
                    widget: CustomTabbar(),
                  ),
                  const GridViewItem(
                    name: "Custom Checkbox",
                    widget: CustomCheckbox(),
                  ),
                  const GridViewItem(
                    name: "Custom TextField",
                    widget: CustomTextFielPage(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GridViewItem extends StatelessWidget {
  final String name;
  final Widget widget;
  const GridViewItem({Key? key, required this.name, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) => widget),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Palette.primaryColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            name,
            style: CustomTheme.title(context),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
