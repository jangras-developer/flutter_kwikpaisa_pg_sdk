markdown
Copy code
# Flutter KwikPaisa PG SDK

A Flutter plugin for integrating the KwikPaisa NEO Bank payment gateway.

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_kwikpaisa_pg_sdk: ^1.1.0
  ```

 Then, run the following command to install the new dependency:
  
```yaml
  flutter pub get
  ```

  ## Configuration
  Before using the plugin, you need to configure your KwikPaisa API keys. Follow these steps:

Add the following code to kwikpaisa_configure.dart:

```yaml
  class KwikPaisaConfig {
  static const String baseUrl = 'https://uat.api.kwikpaisa.com';
  static const String contentType = 'application/json';
  static const String clientId = '<Your Client ID>'; // Replace with your API Client ID
  static const String clientSecret = '<Your Client Secret>'; // Replace with your API Client Secret
  static const String orderSource = 'rest-api'; // This can be adjusted based on your source
}
  ```
Make sure to replace <Your Client ID> and <Your Client Secret> with your actual KwikPaisa API credentials.
## Usage
#### Step 1: Import the SDK

In your Flutter application, import the KwikPaisa PG SDK and the configuration file:
```
import 'package:flutter_kwikpaisa_pg_sdk/flutter_kwikpaisa_pg_sdk.dart';
```

#### Step 2: Create an Order

You can create a new order using the KwikPaisaPaymentGateway class. Here’s how you can do it:
```
void createOrder(BuildContext context) async {
  final paymentGateway = KwikPaisaPaymentGateway();

  // Generate a unique order ID
  String orderId = 'order_${DateTime.now().millisecondsSinceEpoch}';
  double orderAmount = 100.00; // Example order amount

  // Prepare order data
  Map<String, dynamic> orderData = {
    'order_id': orderId,
    'order_amount': orderAmount,
    'order_currency': 'INR',
    'order_note': 'Payment for services',
    'service_type': 'DIGITAL', // Adjust this based on your service type
    'customer_name': 'John Doe',
    'customer_email': 'john.doe@example.com',
    'customer_phone': '1234567890',
    'customer_address_line1': '123 Main St',
    'customer_address_city': 'Your City',
    'customer_address_state': 'Your State',
    'customer_address_country': 'Your Country',
    'customer_address_postal_code': '110011',
    'return_url': 'yourapp://kwikpaisaReturn?order_id=$orderId', // Construct the return URL dynamically
  };

  try {
    Map<String, dynamic> response = await paymentGateway.createOrder(orderData);
    if (response['code'] == '200' && response['status'] == 'success') {
      String paymentLink = response['return_data']['payment_link'];

      // Navigate to PaymentHandlerScreen to open the payment link in WebView
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PaymentHandlerScreen(paymentLink: paymentLink),
        ),
      );
    } else {
      print('Order creation failed: ${response['message']}');
    }
  } catch (e) {
    print('Error: $e');
  }
}


```

#### Step 3: Handle Payment Completion

After the payment is completed, the user will be redirected to the return URL you specified. You can create another screen to handle the return and fetch the order status:
```
void handlePaymentReturn(String orderId) async {
  final paymentGateway = KwikPaisaPaymentGateway();

  Map<String, dynamic> statusData = {
    'order_id': orderId,
  };

  try {
    Map<String, dynamic> response = await paymentGateway.checkOrderStatus(statusData);
    
    // Check if the API call was successful
    if (response['code'] == '200' && response['status'] == 'success') {
      // Access the order data
      var orderData = response['order_data'];
      String orderStatus = orderData['order_status'];

      if (orderStatus == 'PAID') {
        // Payment successful
        print('Payment successful for order: $orderId');
        // You can also access other details like customer data and payment data if needed
        var customerData = orderData['customer_data'];
        var paymentData = orderData['payment_data'];
        print('Customer Name: ${customerData['customer_name']}');
        print('Payment Method: ${paymentData['payment_method']}');
      } else {
        // Payment not completed
        print('Payment not completed for order: $orderId');
      }
    } else {
      // Handle API failure
      print('API Error: ${response['message']}');
    }
  } catch (e) {
    print('Error: $e');
  }
}

```

Testing
You can test the plugin by running the Flutter application and initiating a payment. Make sure to replace the API credentials and use valid order data.

Contribution
Contributions are welcome! Please feel free to submit issues and pull requests.

License
This project is licensed under the MIT License. See the LICENSE file for more information.

