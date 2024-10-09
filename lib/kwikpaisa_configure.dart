import 'package:flutter/material.dart';

class KwikPaisaConfig {
  // Base URL for the KwikPaisa API
  static const String baseUrl = "https://test.payarise.com";
  
  // Content type for the API requests
  static const String contentType = "application/json";
  
  // Client ID for the API authentication
  static const String clientId = "mid_83df7c61e229c6e"; // Replace with your actual client ID
  
  // Client secret for the API authentication
  static const String clientSecret = "key_79a95c3cc85be4d74b4e1cfd357c4a67"; // Replace with your actual secret key
  
  // Source of the order (usually 'rest-api')
  static const String orderSource = "reset-api";
}
