class SearchResult {
  
  int? count;
  List<SearchData?>? data;

  SearchResult({this.count, this.data});

  SearchResult.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['data'] != null) {
      data = <SearchData>[];
      json['data'].forEach((v) {
        data!.add(SearchData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v!.toJson()).toList();
    }
    return data;
  }

}

class SearchData {
  String? displayText;
  SearchReference? reference; 

  SearchData({this.displayText, this.reference});

  SearchData.fromJson(Map<String, dynamic> json) {
    displayText = json['displayText'];
    reference = json['reference'] != null ? SearchReference.fromJson(json['reference']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['displayText'] = displayText;
    if (reference != null) {
      data['reference'] = reference!.toJson();
    }
    return data;
  }
}

class SearchReference {
  String? identifier;
  num? score;
  String? type;
  SearchSource? source;

  SearchReference({this.identifier, this.score, this.type, this.source});

  SearchReference.fromJson(Map<String, dynamic> json) {
    identifier = json['identifier'];
    score = json['score'];
    type = json['type'];
    source = json['source'] != null ? SearchSource.fromJson(json['source']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['identifier'] = identifier;
    data['score'] = score;
    data['type'] = type;
    if (source != null) {
      data['source'] = source!.toJson();
    }
    return data;
  }
}

class SearchSource {
  String? name;
  String? baseUrl;
  String? redirectUrl;
  String? redirectUrlPath;

  SearchSource({this.name, this.baseUrl, this.redirectUrl, this.redirectUrlPath});

  SearchSource.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    baseUrl = json['baseUrl'];
    redirectUrl = json['redirectUrl'];
    redirectUrlPath = json['redirectUrlPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['baseUrl'] = baseUrl;
    data['redirectUrl'] = redirectUrl;
    data['redirectUrlPath'] = redirectUrlPath;
    return data;
  }
}