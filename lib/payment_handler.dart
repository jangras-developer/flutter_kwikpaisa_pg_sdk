import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentHandlerScreen extends StatelessWidget {
  final String paymentLink;

  PaymentHandlerScreen({required this.paymentLink});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Payment")),
      body: WebView(
        initialUrl: paymentLink,
        javascriptMode: JavascriptMode.unrestricted,
        onPageFinished: (url) {
          // Check if the return URL is reached
          if (url.contains("kwikpaisaReturn")) {
            // Extract the order ID from the URL
            Uri uri = Uri.parse(url);
            String? orderId = uri.queryParameters['order_id'];

            // Handle the order ID and fetch order status
            if (orderId != null) {
              // Call the status API here to check if the payment was successful
              fetchOrderStatus(orderId);
            }

            // Navigate back or close the WebView
            Navigator.of(context).pop();
          }
        },
      ),
    );
  }

  Future<void> fetchOrderStatus(String orderId) async {
    // Implement your order status API call here using the orderId
    // Example:
    // final status = await OrderStatusService.getStatus(orderId);
    // Process the status as needed
  }
}
