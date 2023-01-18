import 'package:flutter/material.dart';
import 'package:tugas_fitur/event/models/event.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: ((value) => updateEvent(value)),
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          suffixIcon: const Icon(
            Icons.search,
            color: Colors.blue,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: Colors.blue, width: 2),
          ),
          hintText: ("cari"),
    ));
  }

  void updateEvent(String value) {
    setState(() {
      displayEvent = eventList
          .where((element) =>
              element.name!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }
}
