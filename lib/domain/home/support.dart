import 'dart:convert';

import 'package:equatable/equatable.dart';

class Support extends Equatable {
  final String url;
  final String text;
  Support({
    required this.url,
    required this.text,
  });

  Support copyWith({
    String? url,
    String? text,
  }) {
    return Support(
      url: url ?? this.url,
      text: text ?? this.text,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'text': text,
    };
  }

  factory Support.fromMap(Map<String, dynamic> map) {
    return Support(
      url: map['url'] ?? '',
      text: map['text'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Support.fromJson(String source) => Support.fromMap(json.decode(source));

  @override
  String toString() => 'Support(url: $url, text: $text)';

  @override
  List<Object> get props => [url, text];
}