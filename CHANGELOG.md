## 1.0.1

- Updated code formatting.

## 1.0.0

- Breaking change - public api changed to lowerCamelCase. For example...
  - `GeoIp.country_code` changed to `GeoIp.countryCode`
  - `GeoIp.region_code` changed to `GeoIp.regionCode`

## 0.1.3

- Made null safe - with thanks to [malkovro](https://github.com/malkovro).
- Made Dart 3 compatible.
- Bug fix - Now uses latest seeip.org uri format.

## 0.1.2

- Bug fix - GeoIP raising error. This is due to SeeIP now returning 'offset' as an int instead of a String.
  Added parsing for Offset to handle this.

## 0.1.1

- Bug fix - Added parsing for int Lat/Long coordinates. 

## 0.1.0

- Initial version, created by Mad About Brighton.
