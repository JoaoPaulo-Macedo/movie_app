// Mocks generated by Mockito 5.1.0 from annotations
// in movie_app/test/mockito.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:movie_app/core/data/services/dio_service_imp.dart' as _i2;
import 'package:movie_app/core/data/services/preferences_service_imp.dart'
    as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [DioHttpServiceImp].
///
/// See the documentation for Mockito's code generation for more information.
class MockDioHttpServiceImp extends _i1.Mock implements _i2.DioHttpServiceImp {
  MockDioHttpServiceImp() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<dynamic> get(String? path, {String? description}) =>
      (super.noSuchMethod(
          Invocation.method(#get, [path], {#description: description}),
          returnValue: Future<dynamic>.value()) as _i3.Future<dynamic>);
  @override
  dynamic post(String? path,
          {Map<String, dynamic>? queryParams, String? description}) =>
      super.noSuchMethod(Invocation.method(#post, [path],
          {#queryParams: queryParams, #description: description}));
  @override
  _i3.Future<dynamic> delete(String? path, Map<String, dynamic>? queryParams,
          {String? description}) =>
      (super.noSuchMethod(
          Invocation.method(
              #delete, [path, queryParams], {#description: description}),
          returnValue: Future<dynamic>.value()) as _i3.Future<dynamic>);
}

/// A class which mocks [PreferencesServiceImp].
///
/// See the documentation for Mockito's code generation for more information.
class MockPreferencesServiceImp extends _i1.Mock
    implements _i4.PreferencesServiceImp {
  MockPreferencesServiceImp() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get debug =>
      (super.noSuchMethod(Invocation.getter(#debug), returnValue: false)
          as bool);
  @override
  _i3.Future<String?> getString(String? key, {String? description}) =>
      (super.noSuchMethod(
          Invocation.method(#getString, [key], {#description: description}),
          returnValue: Future<String?>.value()) as _i3.Future<String?>);
  @override
  _i3.Future<List<String>?> getStringList(String? key, {String? description}) =>
      (super.noSuchMethod(
          Invocation.method(#getStringList, [key], {#description: description}),
          returnValue:
              Future<List<String>?>.value()) as _i3.Future<List<String>?>);
  @override
  _i3.Future<bool> setString(String? key, String? value,
          {String? description}) =>
      (super.noSuchMethod(
          Invocation.method(
              #setString, [key, value], {#description: description}),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  _i3.Future<bool> setStringList(String? key, List<String>? value,
          {String? description}) =>
      (super.noSuchMethod(
          Invocation.method(
              #setStringList, [key, value], {#description: description}),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  _i3.Future<bool> remove(String? key, {String? description}) =>
      (super.noSuchMethod(
          Invocation.method(#remove, [key], {#description: description}),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  _i3.Future<bool> clear({String? description}) => (super.noSuchMethod(
      Invocation.method(#clear, [], {#description: description}),
      returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
}
