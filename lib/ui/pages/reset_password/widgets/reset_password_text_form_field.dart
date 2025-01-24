import 'package:flutter/material.dart';

class ResetPasswordTextField extends StatefulWidget {
  final String labelText;
  final bool isPassword;
  final TextEditingController controller;

  const ResetPasswordTextField({
    super.key,
    required this.labelText,
    this.isPassword = false,
    required this.controller,
  });

  @override
  State<ResetPasswordTextField> createState() => _ResetPasswordTextFieldState();
}

class _ResetPasswordTextFieldState extends State<ResetPasswordTextField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.labelText,
        border: const OutlineInputBorder(),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
      obscureText: _obscureText,
    );
  }
}
