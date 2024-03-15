class CheckModel {
  final String content;
  bool? checked;

  CheckModel({required this.content, bool? checked})
      : checked = checked ?? false;
  static List<CheckModel> checkModelList = [
    CheckModel(content: "月"),
    CheckModel(content: "火"),
    CheckModel(content: "水"),
    CheckModel(content: "水"),
    CheckModel(content: "金"),
    CheckModel(content: "土", checked: true),
    CheckModel(content: "日", checked: true),
    CheckModel(content: "祝", checked: true)
  ];
}
