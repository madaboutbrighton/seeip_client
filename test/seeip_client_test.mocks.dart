// Copyright (c) 2023, Mad About Brighton. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async' as i5;
import 'dart:convert' as i6;
import 'dart:typed_data' as i7;

import 'package:http/src/base_request.dart' as i8;
import 'package:http/src/client.dart' as i4;
import 'package:http/src/response.dart' as i2;
import 'package:http/src/streamed_response.dart' as i3;
import 'package:mockito/mockito.dart' as i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeResponse extends i1.Fake implements i2.Response {}

class _FakeStreamedResponse extends i1.Fake implements i3.StreamedResponse {}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockClient extends i1.Mock implements i4.Client {
  MockClient() {
    i1.throwOnMissingStub(this);
  }

  @override
  i5.Future<i2.Response> head(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#head, [url], {#headers: headers}),
              returnValue: Future<i2.Response>.value(_FakeResponse()))
          as i5.Future<i2.Response>);
  @override
  i5.Future<i2.Response> get(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#get, [url], {#headers: headers}),
              returnValue: Future<i2.Response>.value(_FakeResponse()))
          as i5.Future<i2.Response>);
  @override
  i5.Future<i2.Response> post(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          i6.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<i2.Response>.value(_FakeResponse()))
          as i5.Future<i2.Response>);
  @override
  i5.Future<i2.Response> put(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          i6.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<i2.Response>.value(_FakeResponse()))
          as i5.Future<i2.Response>);
  @override
  i5.Future<i2.Response> patch(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          i6.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#patch, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<i2.Response>.value(_FakeResponse()))
          as i5.Future<i2.Response>);
  @override
  i5.Future<i2.Response> delete(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          i6.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<i2.Response>.value(_FakeResponse()))
          as i5.Future<i2.Response>);
  @override
  i5.Future<String> read(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#read, [url], {#headers: headers}),
          returnValue: Future<String>.value('')) as i5.Future<String>);
  @override
  i5.Future<i7.Uint8List> readBytes(Uri? url,
          {Map<String, String>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#readBytes, [url], {#headers: headers}),
              returnValue: Future<i7.Uint8List>.value(i7.Uint8List(0)))
          as i5.Future<i7.Uint8List>);
  @override
  i5.Future<i3.StreamedResponse> send(i8.BaseRequest? request) =>
      (super.noSuchMethod(Invocation.method(#send, [request]),
              returnValue:
                  Future<i3.StreamedResponse>.value(_FakeStreamedResponse()))
          as i5.Future<i3.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
}
