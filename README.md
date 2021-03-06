# seeip client

A library that makes it easy to fetch data from [SeeIP](https://seeip.org/) - A simple IP address API.

This is a pure Dart library which relies on the http package. Therefore, it can be used cross-platform, from Flutter to Web to server-side.

## Usage

You can fetch data from SeeIP without any api or auth tokens. Simply create an instance of the SeeipClient class.

Please see example/seeip_client_example.dart for more examples.

```dart
import 'package:seeip_client/seeip_client.dart';

main() async {
  var seeip = SeeipClient();
  var ipaddress = await seeip.getIP();
  print(ipaddress);
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker](https://github.com/madaboutbrighton/seeip_client/blob/master/LICENSE.md).