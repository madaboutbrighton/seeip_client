// Copyright (c) 2019, Mad About Brighton. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:seeip_client/seeip_client.dart';

main() async {
  SeeipClient seeip = SeeipClient();

  // Fetches only the IP address of the requesting device.
  OnlyIP ip = await seeip.getIP();

  print(ip);

  // Fetches only the IPv4 address of the requesting device.
  OnlyIP ipv4 = await seeip.getIPv4();

  print(ipv4);

  // Fetches the Geo IP of the requesting device.
  GeoIP geoIP = await seeip.getGeoIP();

  print(geoIP);

  // Fetches the Geo IP of the specified IP address.
  GeoIP geoIPSpecific = await seeip.getGeoIP('216.58.208.174');

  print(geoIPSpecific);
}
