import 'package:assesment/const/const.dart';
import 'package:flutter/material.dart';

class CustomDropdown2 extends StatefulWidget {
  const CustomDropdown2({super.key});

  @override
  State<CustomDropdown2> createState() => _CustomDropdown2State();
}

class _CustomDropdown2State extends State<CustomDropdown2> {
  String? _selectedItem;
  String? newValue;
  String? title;

  List<String> _items = ['Dosa 1', 'Dosa 2', 'Dosa 3', 'Dosa 4', 'Dosa 5'];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      height: 30,
      decoration: BoxDecoration(
        color: Color(0xffF9F9F9),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: DropdownButton<String>(
          underline: SizedBox(),
          borderRadius: BorderRadius.circular(10),
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.black,
            size: 20,
          ),
          hint: Text(
            'Dosa',
            style: myStyle(16, Colors.black),
          ),
          value: _selectedItem,
          onChanged: (newValue) {
            setState(() {
              _selectedItem = newValue!;
            });
          },
          items: _items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
