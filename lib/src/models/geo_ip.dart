// Copyright (c) 2019, Mad About Brighton. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// This class is used to store the response when requesting geo IP information.
class GeoIP {

  String ip;
  String organization;
  String city;
  String region;
  String dma_code;
  String area_code;
  String timezone;
  String offset;
  double longitude;
  String country_code3;
  String postal_code;
  String continent_code;
  String country;
  String region_code;
  String country_code;
  double latitude;

  GeoIP({
    this.ip,
    this.organization,
    this.city,
    this.region,
    this.dma_code,
    this.area_code,
    this.timezone,
    this.offset,
    this.longitude,
    this.country_code3,
    this.postal_code,
    this.continent_code,
    this.country,
    this.region_code,
    this.country_code,
    this.latitude,
  });

  static GeoIP fromJson(Map<String, dynamic> map) {
    return GeoIP(
        ip: map["ip"],
        organization: map["organization"],
        city: map["city"],
        region: map["region"],
        dma_code: map["dma_code"],
        area_code: map["area_code"],
        timezone: map["timezone"],
        offset: map["offset"],
        longitude: _toDouble(map["longitude"]),
        country_code3: map["country_code3"],
        postal_code: map["postal_code"],
        continent_code: map["continent_code"],
        country: map["country"],
        region_code: map["region_code"],
        country_code: map["country_code"],
        latitude: _toDouble(map["latitude"]),
    );
  }

  @override
  String toString() {
    return 'GeoIP {ip: $ip, organization: $organization, city: $city, region: $region, dma_code: $dma_code, area_code: $area_code, timezone: $timezone, offset: $offset, longitude: $longitude, country_code3: $country_code3, postal_code: $postal_code, continent_code: $continent_code, country: $country, region_code: $region_code, country_code: $country_code, latitude: $latitude}';
  }

  /// Convert [value] to a double.
  static double _toDouble(var value) {

    // Convert a [String], for example "3.7", to a double
    if (value is String) {
      value = double.parse(value);
    }

    // Convert an [int], for example 5, to a double
    if (value is int) {
      // dividing 2 integers creates a double
      value = value / 1;
    }

    return value;
  }
}