// Copyright (c) 2023, Mad About Brighton. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Stores the response when requesting geographical IP address information.
class GeoIP {
  /// Public IP address, or IP address specified as parameter.
  String? ip;

  /// Autonomous System Number (ASN) + Internet Service Provider (ISP) name.
  String? organization;

  /// Name of the city.
  String? city;

  /// Name of the region.
  String? region;

  /// Designated Market Area (DMA) code (USA and Canada only).
  String? dmaCode;

  /// The Public Switch Telephone Network (PSTN) area code.
  String? areaCode;

  /// The time zone.
  String? timezone;

  /// Universal Coordinated Time (UTC) time offset.
  int? offset;

  /// Longitude coordinate.
  double? longitude;

  /// Three-letter ISO 3166-1 alpha-3 country code.
  String? countryCode3;

  /// Postal/zip code.
  String? postalCode;

  /// Two-letter continent code.
  String? continentCode;

  /// Name of the country.
  String? country;

  /// Two-letter ISO-3166-2 state/region code for US and Canada, FIPS 10-4 region codes otherwise.
  String? regionCode;

  /// Two-letter ISO 3166-1 alpha-2 country code.
  String? countryCode;

  /// Latitude coordinate.
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
    return 'GeoIP {ip: $ip, organization: $organization, city: $city,'
        'region: $region, dmaCode: $dmaCode, areaCode: $areaCode,'
        'timezone: $timezone, offset: $offset, longitude: $longitude,'
        'countryCode3: $countryCode3, postalCode: $postalCode,'
        'continentCode: $continentCode, country: $country,'
        'regionCode: $regionCode, countryCode: $countryCode,'
        'latitude: $latitude}';
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
