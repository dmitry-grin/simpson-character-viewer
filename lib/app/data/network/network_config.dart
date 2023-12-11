abstract class NetworkConfig {
  String get baseURL;

  int get defaultTimeout {
    //in milliseconds
    return 30 * 1000;
  }
}

class DefaultNetworkConfig extends NetworkConfig {
  static const String _url = 'http://api.duckduckgo.com/';

  @override
  String get baseURL => _url;
}