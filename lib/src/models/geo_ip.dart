// Copyright (c) 2023, Mad About Brighton. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Stores the response when requesting geographical IP address information.
class GeoIP {
  /// Public IP address, or IP address specified as parameter.
  String ip;

  /// Autonomous System Number (ASN) + Internet Service Provider (ISP) name.
  String organization;

  /// Name of the city.
  String city;

  /// Name of the region.
  String region;

  /// Designated Market Area (DMA) code (USA and Canada only).
  String dmaCode;

  /// The Public Switch Telephone Network (PSTN) area code.
  String areaCode;

  /// The time zone.
  String timezone;

  /// Universal Coordinated Time (UTC) time offset.
  int offset;

  /// Latitude coordinate. Returns null for an empty value.
  double? latitude;

  /// Longitude coordinate. Returns null for an empty value.
  double? longitude;

  /// Three-letter ISO 3166-1 alpha-3 country code.
  String countryCode3;

  /// Postal/zip code.
  String postalCode;

  /// Two-letter continent code.
  String continentCode;

  /// Name of the country.
  String country;

  /// Two-letter ISO-3166-2 state/region code for US and Canada, FIPS 10-4 region codes otherwise.
  String regionCode;

  /// Two-letter ISO 3166-1 alpha-2 country code.
  String countryCode;

  GeoIP({
    this.ip = '',
    this.organization = '',
    this.city = '',
    this.region = '',
    this.dmaCode = '',
    this.areaCode = '',
    this.timezone = '',
    this.offset = 0,
    this.latitude,
    this.longitude,
    this.countryCode3 = '',
    this.postalCode = '',
    this.continentCode = '',
    this.country = '',
    this.regionCode = '',
    this.countryCode = '',
  });

  static GeoIP fromJson(Map<String, dynamic> map) {
    return GeoIP(
      ip: map['ip'] ?? '',
      organization: map['organization'] ?? '',
      city: map['city'] ?? '',
      region: map['region'] ?? '',
      dmaCode: map['dma_code'] ?? '',
      areaCode: map['area_code'] ?? '',
      timezone: map['timezone'] ?? '',
      offset: _toInt(map['offset'] ?? 0),
      latitude: _toCoordinate(map['latitude']),
      longitude: _toCoordinate(map['longitude']),
      countryCode3: map['country_code3'] ?? '',
      postalCode: map['postal_code'] ?? '',
      continentCode: map['continent_code'] ?? '',
      country: map['country'] ?? '',
      regionCode: map['region_code'] ?? '',
      countryCode: map['country_code'] ?? '',
    );
  }

  @override
  String toString() {
    return 'GeoIP {\n\t'
        'ip: $ip\n\t'
        'organization: $organization\n\t'
        'city: $city\n\t'
        'region: $region\n\t'
        'dmaCode: $dmaCode\n\t'
        'areaCode: $areaCode\n\t'
        'timezone: $timezone\n\t'
        'offset: $offset\n\t'
        'latitude: $latitude\n\t'
        'longitude: $longitude\n\t'
        'countryCode3: $countryCode3\n\t'
        'postalCode: $postalCode\n\t'
        'continentCode: $continentCode\n\t'
        'country: $country\n\t'
        'regionCode: $regionCode\n\t'
        'countryCode: $countryCode\n}';
  }

  /// Convert [value] to an [int].
  static int _toInt(var value) {
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

  /// Convert [value] to a coordinate [double].
  ///
  /// An empty/null coordinate is allowed as converting null to zero
  /// would create a misleading coordinate.
  static double? _toCoordinate(var value) {
    if (value != null) {
      // Convert a [String], for example "3.7", to a [double]
      if (value is String) {
        value = double.parse(value);
      }

      // Convert an [int], for example 5, to a [double]
      if (value is int) {
        // dividing 2 integers creates a [double]
        value = value / 1;
      }
    }

    return value;
  }
}
