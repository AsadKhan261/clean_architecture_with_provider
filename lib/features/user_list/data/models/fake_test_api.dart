class FakeApi {
  FakeApi({
    required this.count,
    required this.entries,
  });
  late final int count;
  late final List<Entries> entries;

  FakeApi.fromJson(Map<String, dynamic> json){
    count = json['count'];
    entries = List.from(json['entries']).map((e)=>Entries.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['count'] = count;
    _data['entries'] = entries.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Entries {
  Entries({
    required this.API,
    required this.Description,
    required this.Auth,
    required this.HTTPS,
    required this.Cors,
    required this.Link,
    required this.Category,
  });
  late final String API;
  late final String Description;
  late final String Auth;
  late final bool HTTPS;
  late final String Cors;
  late final String Link;
  late final String Category;

  Entries.fromJson(Map<String, dynamic> json){
    API = json['API'];
    Description = json['Description'];
    Auth = json['Auth'];
    HTTPS = json['HTTPS'];
    Cors = json['Cors'];
    Link = json['Link'];
    Category = json['Category'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['API'] = API;
    _data['Description'] = Description;
    _data['Auth'] = Auth;
    _data['HTTPS'] = HTTPS;
    _data['Cors'] = Cors;
    _data['Link'] = Link;
    _data['Category'] = Category;
    return _data;
  }
}