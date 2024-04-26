import 'package:assesment/const/const.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({super.key});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _selectedItem;
  String? newValue;
  String? title;

  List<String> _items = ['PG 1', 'PG 2', 'PG 3', 'PG 4', 'PG 5'];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: DropdownButton<String>(underline: SizedBox(),
            borderRadius: BorderRadius.circular(10),
            icon: Icon(
              Icons.expand_circle_down_sharp,
              color: Colors.black,
              size: 20,
            ),
            hint: Text(
              'Select PG ',
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
      ),
    );
  }
}
