
part of devspace;


// ignore: constant_identifier_names
const double CONTENT_DEFAULT_LINE_HEIGHT = 1.3;

abstract class TextLabel {

  TextLabel._();

  static Widget small(String? text, {
    Color? color,
    bool? italic,
    bool? bold,
    TextAlign? textAlign,
    double lineHeight = CONTENT_DEFAULT_LINE_HEIGHT,
    double? letterSpacing,
    TextStyle? style
  })
  {
    return Builder(
      builder: (context) => Text(text ?? '',
        textAlign: textAlign,
        style: context.text.labelSmall!.merge(style).copyWith(
          color: color,
          fontStyle: italic == true ? FontStyle.italic : null,
          fontWeight: bold == true ? FontWeight.bold : null,
          height: lineHeight, 
          letterSpacing: letterSpacing
        ),
      ),
    );
  }

  static Widget medium(String? text, {
    Color? color,
    bool? italic,
    bool? bold,
    TextAlign? textAlign,
    double lineHeight = CONTENT_DEFAULT_LINE_HEIGHT,
    double? letterSpacing,
    TextStyle? style
  })
  {
    return Builder(
      builder: (context) => Text(text ?? '',
        textAlign: textAlign,
        style: context.text.labelMedium!.merge(style).copyWith(
          color: color,
          fontStyle: italic == true ? FontStyle.italic : null,
          fontWeight: bold == true ? FontWeight.bold : null,
          height: lineHeight, 
          letterSpacing: letterSpacing
        ),
      ),
    );
  }

  static Widget large(String? text, {
    Color? color,
    bool? italic,
    bool? bold,
    TextAlign? textAlign,
    double lineHeight = CONTENT_DEFAULT_LINE_HEIGHT,
    double? letterSpacing,
    TextStyle? style
  })
  {
    return Builder(
      builder: (context) => Text(text ?? '',
        textAlign: textAlign,
        style: context.text.labelLarge!.merge(style).copyWith(
          color: color,
          fontStyle: italic == true ? FontStyle.italic : null,
          fontWeight: bold == true ? FontWeight.bold : null,
          height: lineHeight, 
          letterSpacing: letterSpacing
        ),
      ),
    );
  }

}


abstract class TextTitle {

  TextTitle._();

  static Widget small(String? text, {
    Color? color,
    bool? italic,
    bool? bold,
    TextAlign? textAlign,
    double? lineHeight,
    double? letterSpacing,
    TextStyle? style
  })
  {
    return Builder(
      builder: (context) => Text(text ?? '',
        textAlign: textAlign,
        style: context.text.titleSmall!.merge(style).copyWith(
          color: color,
          fontStyle: italic == true ? FontStyle.italic : null,
          fontWeight: bold == true ? FontWeight.bold : null,
          height: lineHeight, 
          letterSpacing: letterSpacing
        ),
      ),
    );
  }

  static Widget medium(String? text, {
    Color? color,
    bool? italic,
    bool? bold,
    TextAlign? textAlign,
    double? lineHeight,
    double? letterSpacing,
    TextStyle? style
  })
  {
    return Builder(
      builder: (context) => Text(text ?? '',
        textAlign: textAlign,
        style: context.text.titleMedium!.merge(style).copyWith(
          color: color,
          fontStyle: italic == true ? FontStyle.italic : null,
          fontWeight: bold == true ? FontWeight.bold : null,
          height: lineHeight, 
          letterSpacing: letterSpacing
        ),
      ),
    );
  }

  static Widget large(String? text, {
    Color? color,
    bool? italic,
    bool? bold,
    TextAlign? textAlign,
    double? lineHeight,
    double? letterSpacing,
    TextStyle? style
  })
  {
    return Builder(
      builder: (context) => Text(text ?? '',
        textAlign: textAlign,
        style: context.text.titleLarge!.merge(style).copyWith(
          color: color,
          fontStyle: italic == true ? FontStyle.italic : null,
          fontWeight: bold == true ? FontWeight.bold : null,
          height: lineHeight, 
          letterSpacing: letterSpacing
        ),
      ),
    );
  }

}

abstract class TextBody {

  TextBody._();

  static Widget small(String? text, {
    Color? color,
    bool? italic,
    bool? bold,
    TextAlign? textAlign,
    double lineHeight = CONTENT_DEFAULT_LINE_HEIGHT,
    double? letterSpacing,
    TextStyle? style
  })
  {
    return Builder(
      builder: (context) => Text(text ?? '',
        textAlign: textAlign,
        style: context.text.bodySmall!.merge(style).copyWith(
          color: color,
          fontStyle: italic == true ? FontStyle.italic : null,
          fontWeight: bold == true ? FontWeight.bold : null,
          height: lineHeight, 
          letterSpacing: letterSpacing
        ),
      ),
    );
  }

  static Widget medium(String? text, {
    Color? color,
    bool? italic,
    bool? bold,
    TextAlign? textAlign,
    double lineHeight = CONTENT_DEFAULT_LINE_HEIGHT,
    double? letterSpacing,
    TextStyle? style
  })
  {
    return Builder(
      builder: (context) => Text(text ?? '',
        textAlign: textAlign,
        style: context.text.bodyMedium!.merge(style).copyWith(
          color: color,
          fontStyle: italic == true ? FontStyle.italic : null,
          fontWeight: bold == true ? FontWeight.bold : null,
          height: lineHeight, 
          letterSpacing: letterSpacing
        ),
      ),
    );
  }

  static Widget large(String? text, {
    Color? color,
    bool? italic,
    bool? bold,
    TextAlign? textAlign,
    double lineHeight = CONTENT_DEFAULT_LINE_HEIGHT,
    double? letterSpacing,
    TextStyle? style
  })
  {
    return Builder(
      builder: (context) => Text(text ?? '',
        textAlign: textAlign,
        style: context.text.bodyLarge!.merge(style).copyWith(
          color: color,
          fontStyle: italic == true ? FontStyle.italic : null,
          fontWeight: bold == true ? FontWeight.bold : null,
          height: lineHeight, 
          letterSpacing: letterSpacing
        ),
      ),
    );
  }

}

abstract class TextHeadline {

  TextHeadline._();

  static Widget small(String? text, {
    Color? color,
    bool? italic,
    bool? bold,
    TextAlign? textAlign,
    double? lineHeight,
    double? letterSpacing,
    TextStyle? style
  })
  {
    return Builder(
      builder: (context) => Text(text ?? '',
        textAlign: textAlign,
        style: context.text.headlineSmall!.merge(style).copyWith(
          color: color,
          fontStyle: italic == true ? FontStyle.italic : null,
          fontWeight: bold == true ? FontWeight.bold : null,
          height: lineHeight, 
          letterSpacing: letterSpacing
        ),
      ),
    );
  }

  static Widget medium(String? text, {
    Color? color,
    bool? italic,
    bool? bold,
    TextAlign? textAlign,
    double? lineHeight,
    double? letterSpacing,
    TextStyle? style
  })
  {
    return Builder(
      builder: (context) => Text(text ?? '',
        textAlign: textAlign,
        style: context.text.headlineMedium!.merge(style).copyWith(
          color: color,
          fontStyle: italic == true ? FontStyle.italic : null,
          fontWeight: bold == true ? FontWeight.bold : null,
          height: lineHeight, 
          letterSpacing: letterSpacing
        ),
      ),
    );
  }

  static Widget large(String? text, {
    Color? color,
    bool? italic,
    bool? bold,
    TextAlign? textAlign,
    double? lineHeight,
    double? letterSpacing,
    TextStyle? style
  })
  {
    return Builder(
      builder: (context) => Text(text ?? '',
        textAlign: textAlign,
        style: context.text.headlineLarge!.merge(style).copyWith(
          color: color,
          fontStyle: italic == true ? FontStyle.italic : null,
          fontWeight: bold == true ? FontWeight.bold : null,
          height: lineHeight, 
          letterSpacing: letterSpacing
        ),
      ),
    );
  }

}