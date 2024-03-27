import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NormalTextField extends StatefulWidget {
  const NormalTextField({
    Key? key,
    required this.icon,
    required this.hintText,
    this.inputFormatter,
    this.validator,
    this.controller,
    this.onSubmit, // Add onSubmit callback
  }) : super(key: key);

  final IconData icon;
  final String hintText;
  final List<TextInputFormatter>? inputFormatter;
  final String Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String)? onSubmit; // Define onSubmit callback

  @override
  State<NormalTextField> createState() => _NormalTextFieldState();
}

class _NormalTextFieldState extends State<NormalTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      enabled: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50.sp),
          ),
        ),
        prefixIcon: Icon(widget.icon),
        hintText: widget.hintText,
        hintStyle: TextStyle(fontSize: 14.sp),
      ),
      inputFormatters: widget.inputFormatter,
      onChanged: (value) {
        // Check if the onSubmit callback is provided and the value is valid
        if (widget.onSubmit != null && widget.validator != null) {
          final validationResult = widget.validator!(value);
          // If the value is valid, call the onSubmit callback
          if (validationResult.isEmpty) {
            widget.onSubmit!(value);
          }
        }
      },
    );
  }
}

