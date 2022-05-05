import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:usefull_widgets/config/palette.dart';
import 'package:usefull_widgets/config/theme.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _phoneNumberController = TextEditingController();
    final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formkey,
            child: InternationalPhoneNumberInput(
              countries: const ["TR", "US"],
              textStyle: const TextStyle(color: Palette.primaryTextColor),
              selectorConfig: const SelectorConfig(
                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                setSelectorButtonAsPrefixIcon: true,
                leadingPadding: 20,
              ),
              selectorTextStyle: CustomTheme.subtitle(context, color: Palette.hintTextColor),
              inputDecoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Palette.lightGrey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Palette.lightGrey),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Palette.lightGrey),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,

                // filled: true,
                // fillColor: const Color.fromRGBO(246, 246, 246, 1),
                hintStyle: CustomTheme.subtitle(context, color: Palette.hintTextColor),
                hintText: "Phone",

                contentPadding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
              ),
              textFieldController: _phoneNumberController,
              initialValue: PhoneNumber(isoCode: 'US'),
              onInputChanged: (PhoneNumber? value) {},
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (!_formkey.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.red,
                  content: Text("INVALID"),
                ),
              );
            }
          },
          child: const Text("Press to show validations"),
        )
      ],
    );
  }
}

class PhoneFieldPage extends StatelessWidget {
  const PhoneFieldPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "PhoneNumberInput",
          style: CustomTheme.title(context),
        ),
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const SafeArea(child: PhoneField()),
    );
  }
}
