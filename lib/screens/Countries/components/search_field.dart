import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final String hintText;
  final Function(String value) onChanged;
  final bool autofocus;
  const SearchField({
    Key? key,
    required this.hintText,
    required this.onChanged,
    this.autofocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: autofocus,
      decoration: InputDecoration(
        fillColor: Color(0xFFF6F7FB),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        prefixIcon: const Icon(
          Icons.search_rounded,
          color: Color(0xFFA4A4A4),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Color(0xFF111111),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
