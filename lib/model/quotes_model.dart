class QuotesModel {
  final String? text;
  final String? from;

  QuotesModel({this.text, this.from});

  factory QuotesModel.fromJson(Map<String, dynamic> json) {
    return QuotesModel(text: json['text'], from: json['from']);
  }
}
