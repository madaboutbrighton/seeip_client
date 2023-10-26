// Copyright (c) 2023, Mad About Brighton. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:mockito/annotations.dart';
import 'package:seeip_client/seeip_client.dart';
import 'package:test/test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';

import 'seeip_client_test.mocks.dart';

@GenerateMocks([Client])
void main() {

  group('Only IP tests', () {
    test('IPAddress', () async {
      var seeip = SeeipClient();
      var ipaddress = await seeip.getIP();
      print(ipaddress);
      expect(ipaddress.ip == "", isFalse);
    });

    test('IPv4Address', () async {
      var seeip = SeeipClient();
      var ipaddress = await seeip.getIPv4();
      print(ipaddress);
      expect(ipaddress.ip == "", isFalse);
    });
  });

  group('Geo IP tests', () {
    test('GeoIP', () async {
      var seeip = SeeipClient();
      var geoip = await seeip.getGeoIP();
      print(geoip);
      expect(geoip.ip == "", isFalse);
    });

    test('GeoIP from IP address', () async {
      String ip = '208.67.222.222';
      var seeip = SeeipClient();
      var geoip = await seeip.getGeoIP(ip);
      print(geoip);
      expect(geoip.ip == ip, isTrue);
    });
  });

  group('Mockito client tests', () {

    test('getIP successfully', () async {
      final client = MockClient();
      var myIP = '192.168.1.1';
      var seeip = SeeipClient(client: client);
      var uri = Uri(
          scheme: 'https',
          host: 'api.seeip.org',
          pathSegments: ['jsonip']);

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.get(uri))
          .thenAnswer((_) => Future.value(Response('{"ip": "$myIP"}', 200)));

      var ipaddress = await seeip.getIP();

      expect(ipaddress.ip == myIP, isTrue);
    });

    test('getIP unsuccessfully', () async {
      final client = MockClient();
      var myIP = '192.168.1.1';
      var seeip = SeeipClient(client: client);
      var uri = Uri(
          scheme: 'https',
          host: 'api.seeip.org',
          pathSegments: ['jsonip']);

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.get(uri))
          .thenAnswer((_) async => Response('{"ip": "$myIP"}', 400));

      bool isError = false;

      try {
        await seeip.getIP();
      } catch(e) {
        //handle exception
        isError = true;
      }

      expect(isError, isTrue);
    });

    test('getIPv6 unsuccessfully', () async {
      // IPv6 not currently working on seeip.org
      final client = MockClient();
      var myIP = '192.168.1.1';
      var seeip = SeeipClient(client: client);
      var uri = Uri(
          scheme: 'https',
          host: 'ipv6.seeip.org',
          pathSegments: ['jsonip']);

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.get(uri))
          .thenAnswer((_) async => Response('{"ip": "$myIP"}', 11001));

      bool isError = false;

      try {
        await seeip.getIPv6();
      } catch(e) {
        //handle exception
        isError = true;
      }

      expect(isError, isTrue);
    });

    test('getGeoIP successfully', () async {
      final client = MockClient();
      var myIP = '192.168.1.1';
      var seeip = SeeipClient(client: client);
      var uri = Uri(
          scheme: 'https',
          host: 'api.seeip.org',
          pathSegments: ['geoip']);

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.get(uri))
          .thenAnswer((_) async => Response('{"ip": "$myIP"}', 200));

      var ipaddress = await seeip.getGeoIP();

      expect(ipaddress.ip == myIP, isTrue);
    });

    test('getGeoIP unsuccessfully', () async {
      final client = MockClient();
      var myIP = '192.168.1.1';
      var seeip = SeeipClient(client: client);
      var uri = Uri(
          scheme: 'https',
          host: 'api.seeip.org',
          pathSegments: ['geoip']);

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.get(uri))
          .thenAnswer((_) async => Response('{"ip": "$myIP"}', 400));

      bool isError = false;

      try {
        await seeip.getGeoIP();
      } catch(e) {
        print(e);
        //handle exception
        isError = true;
      }

      expect(isError, isTrue);
    });

  });

}
