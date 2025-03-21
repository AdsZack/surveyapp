import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class GuidService {
  String? generateGuid() {
    try {
      final uuid = Uuid();
      final guid = uuid.v4();
      debugPrint('[GenerateGUID] $guid');
      return guid;
    } catch (e) {
      debugPrint('[GenerateGUID] Error Occured $e');
      return null;
    }
  }
}
