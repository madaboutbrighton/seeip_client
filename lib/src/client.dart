// Copyright (c) 2019, Mad About Brighton. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:seeip_client/seeip_client.dart';

/// This class is used to interact with the SeeIP.
class SeeipClient {

  final Client _client;

  /// Constructor that allows correct http client to be injected. This will
  /// allow us to provide a BrowserClient on the Web, and IOClient for Flutter,
  /// and a MockClient for testing.
  ///
  /// If no [client] is provided, one is created under the hood.
  SeeipClient({Client? client}) : _client = client ?? Client();

  /// Obtains IP address plus additional details, such as location and organisation.
  ///
  /// The returned data will relate to [ip].
  /// If [ip] is ommitted, the data will relate to the requesting device's ip address.
  Future<GeoIP> getGeoIP([String? ip]) async {
    var segments = ['geoip'];
    if (ip != null) segments.add(ip);

    final uri = _buildUri('ip', segments);

    var response = await _getWithResilience(uri);
    var map = json.decode(response.body);
    var geoip = GeoIP.fromJson(map);
    return geoip;
  }

  /// Obtains the client IP address.
  ///
  /// The result could be IPv4 or IPv6, depending on the client.
  Future<OnlyIP> getIP() async {
    var uri = _buildUri('ip', ['json']);
    var response = await _getWithResilience(uri);
    var map = json.decode(response.body);
    var ipaddress = OnlyIP.fromJson(map);
    return ipaddress;
  }

  /// Obtains the client IPv4 address.
  ///
  /// Only the IPv4 address is returned.
  Future<OnlyIP> getIPv4() async {
    var uri = _buildUri('ip4', ['json']);
    var response = await _getWithResilience(uri);
    if (response.statusCode != 200) {
      throw Exception('Request status not successful for $uri');
    }
    var map = json.decode(response.body);
    var ipaddress = OnlyIP.fromJson(map);
    return ipaddress;
  }

  /// Obtains the client IPv6 address.
  ///
  /// Only the IPv6 address is returned.
  /// This function currently raises an error until it is fully supported on seeip.org
  Future<OnlyIP> getIPv6() async {
    var uri = _buildUri('ip6', ['json']);
    var response = await _getWithResilience(uri);
    var map = json.decode(response.body);
    var ipaddress = OnlyIP.fromJson(map);
    return ipaddress;
  }

  /// Constructs a well formatted URL.
  Uri _buildUri([String? subdomain, List<String>? segments]) {
    var uri = Uri(
        scheme: 'https',
        host: '$subdomain.seeip.org',
        pathSegments: segments);
    print(uri);
    return uri;
  }

  /// Get [reponse] for given [uri].
  ///
  /// Retires if server is busy, rather than crashing out.
  Future<Response> _getWithResilience(Uri uri) async {
    var response = await _client.get(uri);

    switch (response.statusCode) {
      // Too many requests
      case 429:
        var retryAfter = int.parse(response.headers['retry-after']!);
        await Future.delayed(Duration(seconds: retryAfter));
        return await _getWithResilience(uri);

      // OK
      case 200:
        return response;

      default:
        throw Exception('Request status not successful for $uri');
    }
  }
}
