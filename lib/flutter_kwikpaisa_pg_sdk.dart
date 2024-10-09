import 'dart:convert';
import 'package:http/http.dart' as http;
import 'kwikpaisa_configure.dart';
import 'kwikpaisa_checksum.dart';

class KwikPaisaPaymentGateway {
  Future<Map<String, dynamic>> createOrder(Map<String, dynamic> orderData) async {
    // Calculate the checksum
    String checksum = KwikPaisaChecksum.calculateChecksum(orderData);
    orderData['order_checksum'] = checksum; // Add the checksum to orderData

    final response = await http.post(
      Uri.parse("${KwikPaisaConfig.baseUrl}/order.php"),
      headers: {
        'Content-Type': KwikPaisaConfig.contentType,
        'x-client-id': KwikPaisaConfig.clientId,
        'x-client-secret': KwikPaisaConfig.clientSecret,
        'order-source': KwikPaisaConfig.orderSource,
      },
      body: jsonEncode(orderData),
    );

    if (response.statusCode == 200) {
      // Parse the response and return
      return jsonDecode(response.body);
    } else {
      // Handle error response
      throw Exception('Failed to create order: ${response.reasonPhrase}');
    }
  }
}
