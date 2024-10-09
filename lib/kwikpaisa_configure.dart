import 'package:flutter/material.dart';

class KwikPaisaConfig {
  // Base URL for the KwikPaisa API
  static const String baseUrl = "https://uat.api.kwikpaisa.com";
  
  // Content type for the API requests
  static const String contentType = "application/json";
  
  // Client ID for the API authentication
  static const String clientId = ""; // Replace with your actual client ID
  
  // Client secret for the API authentication
  static const String clientSecret = ""; // Replace with your actual secret key
  
  // Source of the order (usually 'rest-api')
  static const String orderSource = "reset-api";
}
