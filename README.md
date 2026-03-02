# seeip client

Obtain IP address information using [SeeIP](https://seeip.org/) - A simple IP address API.

This is a pure Dart library which relies on the http package. Therefore, it can be used cross-platform, from Flutter to Web to server-side.

## Usage

You can fetch data from SeeIP without any api or auth tokens. Simply create an instance of the SeeipClient class.

### Obtain a public IP address.

Obtain the public IP of the device making the request.

```dart
import 'package:seeip_client/seeip_client.dart';

main() async {
  var seeip = SeeipClient();
  var result = await seeip.getIP();
  print(result);
}
```

### Obtain geographical IP address information.

Obtain the geographical public IP address information for a specific IP address.

```dart
main() async {
  var seeip = SeeipClient();
  // Leave out the ip address to return client's ip address information.
  var result = await seeip.getGeoIP('208.67.222.222');
  print(result);
}
```

Gives the following output...

```shell
result {
  ip: 208.67.222.222,
  organization: OPENDNS,
  city: Wright City,
  region: Missouri,
  timezone: America/Chicago,
  offset: -18000,
  longitude: -91.0332,
  countryCode3: USA,
  postalCode: 63390,
  continentCode: NA,
  country: United States,
  regionCode: MO,
  countryCode: US,
  latitude: 38.811
}
```

The requested IP address can be in IPv4 or IPv6 format.

Omit the IP address to return the geographical IP address information for the device making the request.

Please see example/seeip_client_example.dart for more examples.

## Features and bugs

Please file feature requests and bugs at the [issue tracker](https://github.com/madaboutbrighton/seeip_client/issues).
