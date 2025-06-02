import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveDatabase {
  static late Box box;

  /// Initialize Hive
  static initializeHive() async {
    Directory directory = await getApplicationDocumentsDirectory();
    debugPrint('---- Path: ${directory.path}');
    try {
      Hive.init('${directory.path}/hive');
      HiveDatabase.box = await Hive.openBox('blgprk');
    } catch (e) {
      debugPrint('---- Failed to local/create hive: $e');
    }
  }

  /// Save token
  static Future<void> saveToken(String token) async {
    await box.put('token', token);
    debugPrint('---- Token saved');
  }

  /// Get token
  static String? getToken() {
    return box.get('token');
  }

  /// Save user name
  static Future<void> saveUserName(String userName) async {
    await box.put('userName', userName);
    debugPrint('---- User Name saved');
  }

  /// Get user name
  static String? getUserName() {
    return box.get('userName');
  }

  /// Save user email
  static Future<void> saveUserEmail(String userEmail) async {
    await box.put('userEmail', userEmail);
    debugPrint('---- User Name saved');
  }

  /// Get user email
  static String? getUserEmail() {
    return box.get('userEmail');
  }

  /// Save student id
  static Future<void> saveStudentId(String studentId) async {
    await box.put('studentId', studentId);
    debugPrint('---- User Name saved');
  }

  /// Get student id
  static String? getStudentId() {
    return box.get('studentId');
  }

  /// Save batch id
  static Future<void> saveBatchId(String batchId) async {
    await box.put('batchId', batchId);
    debugPrint('---- User Name saved');
  }

  /// Get batch id
  static String? getBatchId() {
    return box.get('batchId');
  }

  /// Optional: Clear data
  static Future<void> clearData() async {
    await box.clear();
    debugPrint('---- Hive box cleared');
  }
}
