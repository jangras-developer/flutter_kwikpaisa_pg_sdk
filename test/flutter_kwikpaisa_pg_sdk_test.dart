import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_kwikpaisa_pg_sdk/flutter_kwikpaisa_pg_sdk.dart';
import 'package:flutter_kwikpaisa_pg_sdk/flutter_kwikpaisa_pg_sdk_platform_interface.dart';
import 'package:flutter_kwikpaisa_pg_sdk/flutter_kwikpaisa_pg_sdk_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterKwikpaisaPgSdkPlatform
    with MockPlatformInterfaceMixin
    implements FlutterKwikpaisaPgSdkPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterKwikpaisaPgSdkPlatform initialPlatform = FlutterKwikpaisaPgSdkPlatform.instance;

  test('$MethodChannelFlutterKwikpaisaPgSdk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterKwikpaisaPgSdk>());
  });

  test('getPlatformVersion', () async {
    FlutterKwikpaisaPgSdk flutterKwikpaisaPgSdkPlugin = FlutterKwikpaisaPgSdk();
    MockFlutterKwikpaisaPgSdkPlatform fakePlatform = MockFlutterKwikpaisaPgSdkPlatform();
    FlutterKwikpaisaPgSdkPlatform.instance = fakePlatform;

    expect(await flutterKwikpaisaPgSdkPlugin.getPlatformVersion(), '42');
  });
}
