import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionUtils {
  static void requestPermission(
    Permission permission,
    BuildContext context, {
    Function? permissionGranted,
    Function? permissionDenied,
    Function? permissionNotAskAgain,
    bool isOpenSettings = false,
    bool isShowMessage = false,
  }) {
    permission.request().then((status) {
      var allPermissionGranted = true;
      allPermissionGranted =
          allPermissionGranted && (status == PermissionStatus.granted);

      if (allPermissionGranted) {
        if (permissionGranted != null) permissionGranted();
      } else if (permissionDenied != null) permissionDenied();
    });
  }
}
