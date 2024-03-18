import 'package:dj_flutter_app/src/core/models/api_error.model.dart';
import 'package:dj_flutter_app/src/core/screens/error.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

class DetailScreen<T> extends StatelessWidget {
  final AsyncValue<Either<ApiError, T>> data;
  final Function(T data) whenData;

  const DetailScreen({
    super.key,
    required this.data,
    required this.whenData,
  });

  @override
  Widget build(BuildContext context) {
    return data.when(
      loading: () => Scaffold(
        appBar: AppBar(),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, _) => ErrorScreen(
        body: error.toString(),
      ),
      data: (result) => result.fold(
        (error) => ErrorScreen(
          body: error.detail,
          title: error.code,
        ),
        (data) => whenData(data),
      ),
    );
  }
}
