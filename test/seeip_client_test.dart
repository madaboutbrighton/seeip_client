// Copyright (c) 2019, Mad About Brighton. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:seeip_client/seeip_client.dart';
import 'package:test/test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';

class MockClient extends Mock implements Client {}

void main() {

  group('Only IP tests', () {
    test('IPAddress', () async {

      SeeipClient seeip = SeeipClient();

      OnlyIP ipaddress = await seeip.getIP();

      print(ipaddress);

      expect(ipaddress is OnlyIP, isTrue);
    });

    test('IPv4Address', () async {

      SeeipClient seeip = SeeipClient();

      OnlyIP ipaddress = await seeip.getIPv4();

      print(ipaddress);

      expect(ipaddress is OnlyIP, isTrue);
    });

  });

  group('Geo IP tests', () {
    test('GeoIP', () async {

      SeeipClient seeip = SeeipClient();

      GeoIP geoip = await seeip.getGeoIP();

      print(geoip);

      expect(geoip is GeoIP, isTrue);
    });

    test('GeoIP from IP address', () async {

      SeeipClient seeip = SeeipClient();

      GeoIP geoip = await seeip.getGeoIP('216.58.208.174');

      print(geoip);

      expect(geoip is GeoIP, isTrue);
    });
  });

  group('Mockito client tests', () {

    test('getIP successfully', () async {
      final Client client = MockClient();

      String myIP = "192.168.1.1";

      SeeipClient seeip = SeeipClient(client: client);

      Uri uri = Uri(
          scheme: "https",
          host: "ip.seeip.org",
          pathSegments: ["json"]);

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.get(uri))
          .thenAnswer((_) async => Response('{"ip": "$myIP"}', 200));

      OnlyIP ipaddress = await seeip.getIP();

      expect(ipaddress.ip == myIP, isTrue);
    });

    test('getIP unsuccessfully', () async {
      final Client client = MockClient();

      String myIP = "192.168.1.1";

      SeeipClient seeip = SeeipClient(client: client);

      Uri uri = Uri(
          scheme: "https",
          host: "ip.seeip.org",
          pathSegments: ["json"]);

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.get(uri))
          .thenAnswer((_) async => Response('{"ip": "$myIP"}', 400));

      OnlyIP ipaddress;

      try {
        ipaddress = await seeip.getIP();
      } catch(e) {
        //handle exception
      }

      expect(ipaddress == null, isTrue);
    });

    test('getIPv6 unsuccessfully', () async {
      // IPv6 not currently working on seeip.org
      final Client client = MockClient();

      String myIP = "192.168.1.1";

      SeeipClient seeip = SeeipClient(client: client);

      Uri uri = Uri(
          scheme: "https",
          host: "ip6.seeip.org",
          pathSegments: ["json"]);

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.get(uri))
          .thenAnswer((_) async => Response('{"ip": "$myIP"}', 11001));

      OnlyIP onlyIP;

      try {
        onlyIP = await seeip.getIPv6();
      } catch(e) {
        //handle exception
      }

      expect(onlyIP == null, isTrue);
    });

    test('getGeoIP successfully', () async {
      final Client client = MockClient();

      String myIP = "192.168.1.1";

      SeeipClient seeip = SeeipClient(client: client);

      Uri uri = Uri(
          scheme: "https",
          host: "ip.seeip.org",
          pathSegments: ["geoip"]);

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.get(uri))
          .thenAnswer((_) async => Response('{"ip": "$myIP"}', 200));

      GeoIP ipaddress = await seeip.getGeoIP();

      expect(ipaddress.ip == myIP, isTrue);
    });

    test('getGeoIP unsuccessfully', () async {
      final Client client = MockClient();

      String myIP = "192.168.1.1";

      SeeipClient seeip = SeeipClient(client: client);

      Uri uri = Uri(
          scheme: "https",
          host: "ip.seeip.org",
          pathSegments: ["geoip"]);

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.get(uri))
          .thenAnswer((_) async => Response('{"ip": "$myIP"}', 400));

      GeoIP geoIP;

      try {
        geoIP = await seeip.getGeoIP();
      } catch(e) {
        //handle exception
      }

      expect(geoIP == null, isTrue);
    });

  });

}
