import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:usefull_widgets/config/palette.dart';
import 'package:usefull_widgets/config/theme.dart';

class CustomTextField extends StatefulWidget {
  final String? _initialValue;
  final String? _placeholder;
  final bool? _isEnabled;
  final bool? _autofocus;
  final Function(String value)? _onChanged;
  final Function(String value)? _onFieldSubmitted;
  final FormFieldValidator<String>? _validator;
  final List<TextInputFormatter>? _inputFormatters;
  final Iterable<String>? _autofillHints;
  final TextEditingController? _controller;
  final FocusNode? _focusNode;
  final TextInputType? _keyboardType;
  final TextInputAction? _textInputAction;
  final int? _maxLength;
  final int? _maxLines;
  final Widget? _prefix;
  final Widget? _suffix;
  final String? _hintText;
  final EdgeInsetsGeometry? _margin;
  final EdgeInsetsGeometry? _padding;
  final EdgeInsetsGeometry? _contentPadding;
  final BorderRadiusGeometry? _borderRadius;
  final bool? _obsecureText;

  const CustomTextField({
    Key? key,
    Function(String value)? onChanged,
    Function(String value)? onFieldSubmitted,
    String? initialValue,
    String? placeholder,
    bool? isEnabled = true,
    bool? autofocus = false,
    FormFieldValidator<String>? validator,
    List<TextInputFormatter>? inputFormatters,
    Iterable<String>? autofillHints,
    TextEditingController? controller,
    FocusNode? focusNode,
    TextInputType keyboardType = TextInputType.name,
    TextInputAction textInputAction = TextInputAction.next,
    int? maxLength,
    int? maxLines,
    Widget? prefix,
    Widget? suffix,
    EdgeInsetsGeometry margin = const EdgeInsets.symmetric(vertical: 5.0),
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    EdgeInsetsGeometry contentPadding = const EdgeInsets.fromLTRB(12, 18, 12, 18),
    BorderRadiusGeometry borderRadius = const BorderRadius.all(Radius.circular(5)),
    String? hintText,
    bool? obsecureText,
  })  : _initialValue = initialValue,
        _placeholder = placeholder,
        _isEnabled = isEnabled,
        _autofocus = autofocus,
        _onChanged = onChanged,
        _onFieldSubmitted = onFieldSubmitted,
        _validator = validator,
        _prefix = prefix,
        _suffix = suffix,
        _inputFormatters = inputFormatters,
        _autofillHints = autofillHints,
        _controller = controller,
        _focusNode = focusNode,
        _keyboardType = keyboardType,
        _textInputAction = textInputAction,
        _maxLength = maxLength,
        _maxLines = maxLines,
        _margin = margin,
        _padding = padding,
        _contentPadding = contentPadding,
        _borderRadius = borderRadius,
        _hintText = hintText,
        _obsecureText = obsecureText,
        assert(onChanged != null || controller != null),
        super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget._obsecureText ?? false,
      controller: widget._controller,
      focusNode: widget._focusNode,
      initialValue: widget._initialValue,
      enabled: widget._isEnabled,
      onFieldSubmitted: widget._onFieldSubmitted,
      onChanged: widget._onChanged,
      autofillHints: widget._autofillHints,
      autofocus: widget._autofocus!,
      validator: widget._validator,
      inputFormatters: widget._inputFormatters,
      keyboardType: widget._keyboardType,
      textInputAction: widget._textInputAction,
      maxLength: widget._maxLength,
      maxLines: widget._obsecureText == true ? 1 : widget._maxLines,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: CustomTheme.subtitle(context),
      decoration: InputDecoration(
        hintText: widget._hintText,
        hintStyle: CustomTheme.subtitle(context, color: Palette.hintTextColor),
        contentPadding: widget._contentPadding,
        alignLabelWithHint: true,
        labelText: widget._placeholder,
        labelStyle: CustomTheme.body(context, fontWeight: FontWeight.w600, color: Palette.hintTextColor),
        prefixIcon: widget._prefix == null
            ? null
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: widget._prefix,
              ),
        suffixIcon: widget._suffix == null
            ? null
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: widget._suffix,
              ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Palette.lightGrey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Palette.lightGrey),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Palette.lightGrey),
          gapPadding: 10,
        ),
      ),
    );
  }
}

class CustomTextFielPage extends StatelessWidget {
  const CustomTextFielPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _phoneNumberController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Custom TextFormField",
          style: CustomTheme.title(context),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              controller: _emailController,
              autofillHints: const [AutofillHints.email],
              keyboardType: TextInputType.emailAddress,
              hintText: "Email",
              validator: (String? value) {
                if (value!.isEmpty) {
                  return "Email boş bırakılamaz";
                } else if (!RegExp(
                  r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?",
                ).hasMatch(value)) {
                  return 'Lütfen geçerli bir email giriniz';
                }

                return null;
              },
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              controller: _passwordController,
              obsecureText: true,
              autofillHints: const [AutofillHints.newPassword],
              keyboardType: TextInputType.emailAddress,
              hintText: "Password",
              validator: (val) {
                if (val!.length < 6 || val.isEmpty) {
                  return "Şifre 6 haneden fazla olmalı";
                }

                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
