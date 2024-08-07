part of devspace;


extension ExtensionOnUint8List on Uint8List {

  bool get isHeicImage
  {
    const heicSignature = [0x00, 0x00, 0x00, 0x18, 0x66, 0x74, 0x79, 0x70, 0x68, 0x65, 0x69, 0x63];

    return listEquals(sublist(4, 16), heicSignature);
  }

}