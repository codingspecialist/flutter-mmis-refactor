import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ucms/services/beacon/beacon_result.dart';
import 'package:ucms/services/socket/user_socket_client.dart';
import 'package:beacons_plugin/beacons_plugin.dart';

class BeaconManager extends GetxService {
  BeaconManager() {
    initPlatformState();
  }

  late BeaconResult beaconResult = BeaconResult();
  var isRunning = false;
  UserSocketClient socket = Get.find<UserSocketClient>();
  final StreamController<String> beaconEventsController =
      StreamController<String>.broadcast();

  void startListeningBeacons() {
    BeaconsPlugin.listenToBeacons(beaconEventsController);
  }

  Future<void> initPlatformState() async {
    try {
      await BeaconsPlugin.setDisclosureDialogMessage(
          title: "Need Location Permission",
          message: "This app collects location data to work with beacons.");

      startListeningBeacons();

      await BeaconsPlugin.addRegion("testBeacon",
          "74278BDA-B644-4520-8F0C-720EAF059935"); // iBeacon uuid 등록

      BeaconsPlugin.setForegroundScanPeriodForAndroid(
          foregroundScanPeriod: 1000, foregroundBetweenScanPeriod: 10);
      BeaconsPlugin.setBackgroundScanPeriodForAndroid(
          backgroundScanPeriod: 1000, backgroundBetweenScanPeriod: 10);

      beaconEventsController.stream.listen(
          (data) {
            if (data.isNotEmpty && isRunning) {
              beaconResult = BeaconResult.fromJson(jsonDecode(data));
            }
          },
          onDone: () {},
          onError: (error) {/*print("Error: $error");*/});

      await BeaconsPlugin.runInBackground(true);

      BeaconsPlugin.channel.setMethodCallHandler((call) async {
        if (call.method == 'scannerReady') {
          await BeaconsPlugin.startMonitoring();
          isRunning = true;
        }
      });

      if (isRunning) return;
    } on MissingPluginException catch (e) {
      debugPrint("Exception caught ${e.message}");
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
