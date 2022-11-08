import 'dart:convert';
/// mode : "DEV"

Mode modeFromJson(String str) => Mode.fromJson(json.decode(str));
String modeToJson(Mode data) => json.encode(data.toJson());
class Mode {
  Mode({
      String? mode,}){
    _mode = mode;
}

  Mode.fromJson(dynamic json) {
    _mode = json['mode'];
  }
  String? _mode;

  String? get mode => _mode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mode'] = _mode;
    return map;
  }

}