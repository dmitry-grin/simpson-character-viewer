/// An abstract class defining the configuration for network-related settings.
abstract class NetworkConfig {
  /// Gets the base URL for network requests.
  String get baseURL;

  /// Gets the default timeout for network requests, in milliseconds.
  int get defaultTimeout;
}

/// Default implementation of [NetworkConfig] providing default values for network settings.
class DefaultNetworkConfig extends NetworkConfig {
  /// The default base URL for network requests.
  static const String _url = 'http://api.duckduckgo.com/';

  @override
  String get baseURL => _url;

  @override
  int get defaultTimeout {
    // Default timeout set to 30 seconds in milliseconds.
    return 30 * 1000;
  }
}
