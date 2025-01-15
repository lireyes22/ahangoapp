import 'package:flutter/material.dart';

class SearchBarLi extends StatelessWidget {
  final Function(String) onSearch;

  const SearchBarLi({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextField(
        onChanged: onSearch,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Buscar...',
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
