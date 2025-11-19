import 'package:flutter/material.dart';

class DefaultTextFieldOutlined extends StatelessWidget {
  final Function(String text) onChanged;
  final String text;
  final IconData icon;
  final EdgeInsetsGeometry margin;
  final String? Function(String?)? validator;

  const DefaultTextFieldOutlined({
    super.key,
    required this.text,
    required this.icon,
    this.margin = const EdgeInsets.only(top: 50, left: 20, right: 20),
    required this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      margin: margin,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.8),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: TextFormField(
        onChanged: (text) {
          onChanged(text);
        },
        validator: validator,
        decoration: InputDecoration(
          label: Text(text),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 35, 161, 183),
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 34, 101, 202),
              width: 1,
            ),
          ),
          prefixIcon: Container(
            margin: EdgeInsets.only(top: 10),
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              children: [
                Icon(icon),
                Container(height: 20, width: 1, color: Colors.grey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
