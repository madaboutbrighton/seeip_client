import 'package:seeip_client/seeip_client.dart';

void main() async {
  var seeip = SeeipClient();

  // Fetches only the IP address of the requesting device.
  var ip = await seeip.getIP();
  print(ip);

  // Fetches only the IPv4 address of the requesting device.
  var ipv4 = await seeip.getIPv4();
  print(ipv4);

  // Fetches the Geo IP of the requesting device.
  var geoIP = await seeip.getGeoIP();
  print(geoIP);

  // Fetches the Geo IP of the specified IP address.
  var geoIPSpecific = await seeip.getGeoIP('216.58.208.174');
  print(geoIPSpecific);
}
