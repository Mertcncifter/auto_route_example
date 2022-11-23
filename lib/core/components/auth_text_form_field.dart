import 'package:flutter/material.dart';

class AuthTextFormField extends StatefulWidget {
  final void Function(String)? onChanged;
  final TextInputType? textInputType;
  final bool? isPassword;
  final String? labelText;
  final String? errorText;

  AuthTextFormField(
      {Key? key,
      this.onChanged,
      this.textInputType,
      this.isPassword = false,
      this.labelText,
      this.errorText})
      : super(key: key);

  @override
  _AuthTextFormFieldState createState() => _AuthTextFormFieldState();
}

class _AuthTextFormFieldState extends State<AuthTextFormField> {
  bool? passwordVisible;
  FocusNode? focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    passwordVisible = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: TextField(
        onChanged: widget.onChanged,
        autofocus: false,
        obscureText: passwordVisible!,
        decoration: InputDecoration(
          filled: true,
          errorText: widget.errorText,
          labelText: widget.labelText ?? "",
          border: OutlineInputBorder(),
          suffixIcon: widget.isPassword!
              ? InkWell(
                  onTap: () =>
                      setState(() => passwordVisible = !passwordVisible!),
                  child: Icon(
                      passwordVisible!
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey))
              : null,
          isDense: true,
        ),
        keyboardType: widget.textInputType ?? TextInputType.text,
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
        textAlignVertical: TextAlignVertical.bottom,
      ),
    );
  }
}
