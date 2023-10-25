// Copyright (c) 2019, Mad About Brighton. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// This class is used to store the response when requesting geo IP information.
class GeoIP {
  String? ip;
  String? organization;
  String? city;
  String? region;
  String? dmaCode;
  String? areaCode;
  String? timezone;
  int? offset;
  double? longitude;
  String? countryCode3;
  String? postalCode;
  String? continentCode;
  String? country;
  String? regionCode;
  String? countryCode;
  double? latitude;

  GeoIP({
    this.ip,
    this.organization,
    this.city,
    this.region,
    this.dmaCode,
    this.areaCode,
    this.timezone,
    this.offset,
    this.longitude,
    this.countryCode3,
    this.postalCode,
    this.continentCode,
    this.country,
    this.regionCode,
    this.countryCode,
    this.latitude,
  });

  static GeoIP fromJson(Map<String, dynamic> map) {
    return GeoIP(
      ip: map['ip'],
      organization: map['organization'],
      city: map['city'],
      region: map['region'],
      dmaCode: map['dma_code'],
      areaCode: map['area_code'],
      timezone: map['timezone'],
      offset: _toInt(map['offset']),
      longitude: _toDouble(map['longitude']),
      countryCode3: map['country_code3'],
      postalCode: map['postal_code'],
      continentCode: map['continent_code'],
      country: map['country'],
      regionCode: map['region_code'],
      countryCode: map['country_code'],
      latitude: _toDouble(map['latitude']),
    );
  }

  @override
  String toString() {
    return 'GeoIP {ip: $ip, organization: $organization, city: $city, region: $region, dmaCode: $dmaCode, areaCode: $areaCode, timezone: $timezone, offset: $offset, longitude: $longitude, countryCode3: $countryCode3, postalCode: $postalCode, continentCode: $continentCode, country: $country, regionCode: $regionCode, countryCode: $countryCode, latitude: $latitude}';
  }

  /// Convert [value] to an [int].
  static int? _toInt(var value) {
    // Convert a [String], for example "123", to an int
    if (value is String) {
      value = int.tryParse(value) as String? ?? 0 as String;
    }

    // Convert an [double], for example 5.5, to an int
    if (value is double) {
      value = int.tryParse(value.toString()) as double? ?? 0;
    }

    return value;
  }

  /// Convert [value] to a [double].
  static double? _toDouble(var value) {
    // Convert a [String], for example "3.7", to a [double]
    if (value is String) {
      value = double.parse(value);
    }

    // Convert an [int], for example 5, to a [double]
    if (value is int) {
      // dividing 2 integers creates a [double]
      value = value / 1;
    }

    return value;
  }
}
