


// ignore_for_file: library_private_types_in_public_api

part of devspace;

abstract class TestData {

  static const _TestDataUrls urls = _TestDataUrls._();

}

class _TestDataUrls {

  const _TestDataUrls._();

  String randomImage({
    int width = 600,
    int height = 400,
    List<String> keywords = const ['people'],
  })
  {
    Dev.logWarning(this, 'TEST DATA USED. A random image from the internet was requested. Make sure to remove this code in production.');
    
    return 'https://loremflickr.com/${width}/${height}/${keywords.join(',')}?random=${math.Random().nextInt(100000)}';
  }

}