import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:usefull_widgets/config/palette.dart';
import 'package:usefull_widgets/config/theme.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _phoneNumberController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InternationalPhoneNumberInput(
        countries: const ["US"],
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
        initialValue: PhoneNumber(isoCode: 'TR'),
        onInputChanged: (PhoneNumber number) {},
      ),
    );
  }
}
