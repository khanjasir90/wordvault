import 'package:flutter/material.dart';
import 'package:wordvault/model/search_result.dart';
import 'package:wordvault/theme.dart';
import 'package:wordvault/widgets/result_web_view.dart';
import 'package:wordvault/widgets/search_any_word.dart';
import 'package:wordvault/widgets/search_list_tile.dart';

class SearchFieldListSuggestion<T> extends StatefulWidget {
  const SearchFieldListSuggestion({super.key, required this.onSearch});

  final Future<T> Function(String query) onSearch;

  @override
  State<SearchFieldListSuggestion<T>> createState() => _SearchFieldState();
}

class _SearchFieldState<T> extends State<SearchFieldListSuggestion<T>> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get isSearchListVisible => _controller.text.length >= 3;

  bool get isTextBoxEmpty => _controller.text.isEmpty;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(PaddingUtils.p12),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: 'Search',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    10,
                  ),
                ),
              ),
            ),
            onChanged: (String value) {
              if (value.length > 3) {
                setState(() {});
              } else {
                setState(() {
                  
                });
              }
            },
          ),
          const SizedBox(
            height: 10,
          ),

          if(isTextBoxEmpty) ... [
            const SearchAnyWord(),
          ],

          Visibility(
            visible: isSearchListVisible,
            child: Flexible(
              child: FutureBuilder<SearchResult>(
                future:
                    widget.onSearch(_controller.text) as Future<SearchResult>,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Some Error Occurred', style: context.displayMedium,),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data?.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return SearchListTile<SearchData>(
                          item: snapshot.data?.data![index] as SearchData,
                          titleBuilder: (result) => result.displayText ?? '',
                          onTap: (result) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return SearchResutlWebView(
                                    url:
                                        result.reference?.source?.redirectUrl ??
                                            '',
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
