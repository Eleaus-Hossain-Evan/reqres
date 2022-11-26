// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:reqres/domain/auth/model/user_model.dart';

import 'support.dart';

class HomeResponse extends Equatable {
  final int page;
  final int per_page;
  final int total;
  final int total_pages;
  final List<UserModel> data;
  final Support support;

  const HomeResponse({
    required this.page,
    required this.per_page,
    required this.total,
    required this.total_pages,
    required this.data,
    required this.support,
  });

  HomeResponse copyWith({
    int? page,
    int? per_page,
    int? total,
    int? total_pages,
    List<UserModel>? data,
    Support? support,
  }) {
    return HomeResponse(
      page: page ?? this.page,
      per_page: per_page ?? this.per_page,
      total: total ?? this.total,
      total_pages: total_pages ?? this.total_pages,
      data: data ?? this.data,
      support: support ?? this.support,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'per_page': per_page,
      'total': total,
      'total_pages': total_pages,
      'data': data.map((x) => x.toMap()).toList(),
      'support': support.toMap(),
    };
  }

  factory HomeResponse.fromMap(Map<String, dynamic> map) {
    return HomeResponse(
      page: map['page']?.toInt() ?? 0,
      per_page: map['per_page']?.toInt() ?? 0,
      total: map['total']?.toInt() ?? 0,
      total_pages: map['total_pages']?.toInt() ?? 0,
      data: List<UserModel>.from(
          map['data']?.map((x) => UserModel.fromMap(x)) ?? const []),
      support: Support.fromMap(map['support']),
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeResponse.fromJson(String source) =>
      HomeResponse.fromMap(json.decode(source));

  @override
  String toString() {
    return 'HomeResponse(page: $page, per_page: $per_page, total: $total, total_pages: $total_pages, data: $data, support: $support)';
  }

  @override
  List<Object> get props {
    return [
      page,
      per_page,
      total,
      total_pages,
      data,
      support,
    ];
  }
}
