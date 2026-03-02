// Copyright (c) 2023, Mad About Brighton. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Stores the response when requesting only the IP address.
class OnlyIP {
  /// Public IP address, or IP address specified as parameter.
  String ip;

  OnlyIP({
    this.ip = '',
  });

  // Map JSON response to OnlyIP object.
  static OnlyIP fromJson(Map<String, dynamic> map) {
    return OnlyIP(ip: map['ip'] ?? '');
  }

  // Convert OnlyIP object to a string.
  @override
  String toString() {
    return 'OnlyIP {ip: $ip}';
  }
}
