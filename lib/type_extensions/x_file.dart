part of devspace;


extension ExtensionOnXFile on XFile {

  Future<img.Image> getImage() async
  {
    final bytes = await readAsBytes();
    img.Image? image;


    if (mimeType == 'image/jpeg' || mimeType == 'image/jpg')
    {
      image = img.decodeJpg(bytes);
    }
    else if (mimeType == 'image/png')
    {
      image = img.decodePng(bytes);
    }
    else
    {
      image = img.decodeImage(bytes);
    }



    if (image == null)
    {
      throw Exception('Failed to decode image. Maybe the file is not an image.');
    }
    return image;
  }

}