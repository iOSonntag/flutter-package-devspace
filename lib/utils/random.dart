

part of devspace;


abstract class Random {

  Random._();

  static String string({
    int length = 16,
    String alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789',
  }) {
    final random = math.Random();
    final chars = List.generate(length, (index) => alphabet[random.nextInt(alphabet.length)]);
    return chars.join();
  }

}