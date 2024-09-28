import 'package:flutter/material.dart';
import 'package:wordvault/theme.dart';

class SearchListTile<T> extends StatelessWidget {

  const SearchListTile({
    super.key, 
    required this.item, 
    required this.titleBuilder,
    required this.onTap,
  });

  final String Function(T) titleBuilder;
  final T item;
  final Function(T) onTap;


  bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(item),
      child: Container(
        margin: const EdgeInsets.only(bottom: PaddingUtils.p12),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: isDarkMode(context) ? Colors.white : Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          title: Text(titleBuilder(item)),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}