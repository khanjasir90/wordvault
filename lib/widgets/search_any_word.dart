import 'package:flutter/material.dart';
import 'package:wordvault/theme.dart';

class SearchAnyWord extends StatelessWidget {
  const SearchAnyWord({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 100,),
        SizedBox(
          width: 200,
          height: 200,
          child: Image.asset('assets/images/search.png'),
        ),
        const SizedBox(height: 20,),
        Text('Search any word', style: context.bodyLarge),
    ],);
  }
}