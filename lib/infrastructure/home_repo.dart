import 'dart:convert';

import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:reqres/utils/network_util/network_handler.dart';

import '../domain/home/home_response.dart';
import '../utils/api_routes.dart';

class HomeRepo {
  final api = NetworkHandler.instance;

  Future<Either<CleanFailure, HomeResponse>> getHomeDate() async {
    final data = await api.get(
      fromData: (json) => HomeResponse.fromMap(json),
      endPoint: APIRoute.USER,
      withToken: true,
    );

    Logger.i("data: $data");

    return data.fold((l) {
      final error = jsonDecode(l.error);
      final failure = l.copyWith(error: error['error']);
      return left(failure);
    }, (r) => right(r));
  }
}
