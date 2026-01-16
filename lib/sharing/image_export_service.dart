import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class ImageExportService {
  static Future<void> captureAndShare(GlobalKey key) async {
    try {
      // 1. Boundary find karna
      RenderRepaintBoundary boundary =
          key.currentContext!.findRenderObject() as RenderRepaintBoundary;

      // 2. Image capture karna (High quality ke liye pixelRatio 3.0 rakhen)
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      // 3. Temporary path pe save karna
      final directory = await getTemporaryDirectory();
      final imagePath = await File(
        '${directory.path}/quote_share.png',
      ).create();
      await imagePath.writeAsBytes(pngBytes);

      // 4. Share dialogue kholna
      // await Share.shareXFiles([XFile(imagePath.path)], text: '');
      await SharePlus.instance.share(
        ShareParams(files: [XFile(imagePath.path)]),
      );
      Get.snackbar('Success', 'Quote Shared!', margin: EdgeInsets.all(15));
    } catch (e) {
      Get.snackbar('Error', 'Error is: $e', margin: EdgeInsets.all(15));
    }
  }
}
