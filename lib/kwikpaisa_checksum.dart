import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'kwikpaisa_configure.dart';

class KwikPaisaChecksum {
  // Calculate the checksum based on the order data
  static String calculateChecksum(Map<String, dynamic> orderData) {
    // Define required parameters fetched from KwikPaisaConfig
    String appId = KwikPaisaConfig.clientId; // App ID from the configuration
    String secretKey = KwikPaisaConfig.clientSecret; // Secret key from the configuration
    
    // Extract order details from the provided orderData map
    String customerAddressCity = orderData['customer_address_city'] ?? '';
    String customerAddressCountry = orderData['customer_address_country'] ?? '';
    String customerAddressLine1 = orderData['customer_address_line1'] ?? '';
    String customerAddressLine2 = orderData['customer_address_line2'] ?? '';
    String customerAddressPostalCode = orderData['customer_address_postal_code'] ?? '';
    String customerAddressState = orderData['customer_address_state'] ?? '';
    String customerEmail = orderData['customer_email'] ?? '';
    String customerName = orderData['customer_name'] ?? '';
    String customerPhone = orderData['customer_phone'] ?? '';
    String orderAmount = orderData['order_amount'] ?? '';
    String orderCurrency = orderData['order_currency'] ?? '';
    String orderId = orderData['order_id'] ?? '';
    String orderNote = orderData['order_note'] ?? '';
    String returnUrl = orderData['return_url'] ?? '';
    String serviceType = orderData['service_type'] ?? '';

    // Create the sorted string based on the given logic
    String sortedString = 
        'app_id$appId'
        'customer_address_city$customerAddressCity'
        'customer_address_country$customerAddressCountry'
        'customer_address_line1$customerAddressLine1'
        'customer_address_line2$customerAddressLine2'
        'customer_address_postal_code$customerAddressPostalCode'
        'customer_address_state$customerAddressState'
        'customer_email$customerEmail'
        'customer_name$customerName'
        'customer_phone$customerPhone'
        'order_amount$orderAmount'
        'order_currency$orderCurrency'
        'order_id$orderId'
        'order_note$orderNote'
        'return_url$returnUrl'
        'service_type$serviceType';

    // Generate the HMAC signature
    var hmac = Hmac(sha256, utf8.encode(secretKey)); // Create HMAC SHA256 instance
    var digest = hmac.convert(utf8.encode(sortedString)); // Hash the sorted string

    return base64.encode(digest.bytes); // Return the Base64 encoded signature
  }
}
