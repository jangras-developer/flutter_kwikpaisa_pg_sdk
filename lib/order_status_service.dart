import 'dart:convert';
import 'package:http/http.dart' as http;
import 'kwikpaisa_configure.dart';

class OrderStatusService {
  // Method to fetch order status
  static Future<Map<String, dynamic>> getStatus(String orderId) async {
    final response = await http.post(
      Uri.parse("${KwikPaisaConfig.baseUrl}/status"),
      headers: {
        'Content-Type': KwikPaisaConfig.contentType,
        'order-source': KwikPaisaConfig.orderSource,
        'x-client-id': KwikPaisaConfig.clientId,
        'x-client-secret': KwikPaisaConfig.clientSecret,
      },
      body: jsonEncode({"order_id": orderId}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch order status: ${response.reasonPhrase}');
    }
  }
}
