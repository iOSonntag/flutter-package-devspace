import 'dart:async';
import 'dart:html'; // for using Blob
import 'dart:js_util' as js_util;
import 'dart:typed_data';

import 'package:js/js.dart';


@JS('convertHeicToPng')
external Future<Blob> convertHeicToPngBlob(Blob heicFile);

class HeicToAny {


  static Future<Uint8List> _blobToUint8List(Blob blob) async
  {
    final completer = Completer<Uint8List>();
    final reader = FileReader();
    reader.readAsArrayBuffer(blob);
    reader.onLoadEnd.listen((event) {
      completer.complete(Uint8List.fromList(reader.result as List<int>));
    });
    reader.onError.listen((event) {
      completer.completeError(reader.error ?? 'Unknown error');
    });
    return completer.future;
  }

  static Future<Uint8List> convertHeicToPng(Uint8List fileBytes) async
  {
    final blob = Blob([fileBytes]);
    final convertedBlob = await js_util.promiseToFuture<Blob>(
      js_util.callMethod(window, 'convertHeicToPng', [blob]),
    );
    return await _blobToUint8List(convertedBlob);
  }
}