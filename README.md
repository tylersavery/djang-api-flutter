

part 1
=======


- flutter create dj_app
- main.dart
- analysis options


- install packages

Riverpod

flutter pub add flutter_riverpod riverpod_annotation
flutter pub add dev:build_runner dev:riverpod_generator dev:riverpod_lint dev:custom_lint


Freezed
flutter pub add freezed_annotation json_annotation
flutter pub add dev:build_runner dev:freezed dev:json_serializable

Dio
flutter pub add dio

FPdart
flutter pub add fpdart

flutter pub add sembast


- make folder structure

lib->src->feature->post/comment

mkdir models providers services components screens

====

auth
 - token model, auth state
 - auth provider
 - auth interceptor

 core
 - api service

src/core/services/api_service.dart