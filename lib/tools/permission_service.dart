import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  static final PermissionService _instance = PermissionService._();

  factory PermissionService() => _instance;

  PermissionService._();

  void checkPermission(BuildContext context, Permission permission,
      {required String title,
      String? description,
      VoidCallback? onGranted}) async {
    var status = await permission.request();
    status = await permission.status;
    switch (status) {
      case PermissionStatus.granted:
      case PermissionStatus.limited:
        onGranted?.call();
        break;
      default:
        showDialog(
            context: context,
            builder: (_) {
              return const Center(child: Text("Error"));
            },
            barrierDismissible: false);
    }
  }
}
