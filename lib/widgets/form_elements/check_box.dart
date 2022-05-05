import 'package:flutter/material.dart';
import 'package:usefull_widgets/config/palette.dart';
import 'package:usefull_widgets/config/theme.dart';

class CustomCheckboxItem {
  final String title;
  bool isChecked = false;

  CustomCheckboxItem(this.title);
}

CustomCheckboxItem checkbox1 = CustomCheckboxItem("Option 1");

CustomCheckboxItem checkbox2 = CustomCheckboxItem("This is a long option 2");
CustomCheckboxItem checkbox3 = CustomCheckboxItem("Option 3");
CustomCheckboxItem checkbox4 = CustomCheckboxItem("Option 4");
CustomCheckboxItem checkbox5 = CustomCheckboxItem("Option 5");
CustomCheckboxItem checkbox6 = CustomCheckboxItem("Option 6");
CustomCheckboxItem checkbox7 = CustomCheckboxItem("Other");

final List<CustomCheckboxItem> checkboxes = [
  checkbox1,
  checkbox2,
  checkbox3,
  checkbox4,
  checkbox5,
  checkbox6,
  checkbox7,
];

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({Key? key}) : super(key: key);

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Checkboxes",
          style: CustomTheme.title(context),
        ),
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Choose options below - You can choose multiple ones",
              style: CustomTheme.subtitle(context),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Wrap(
              children: checkboxes
                  .map(
                    (e) => Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          fillColor: MaterialStateProperty.all(Palette.primaryColor),
                          value: e.isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              e.isChecked = value!;
                            });
                          },
                        ),
                        Text(
                          e.title,
                          style: CustomTheme.subtitle(context),
                        )
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
