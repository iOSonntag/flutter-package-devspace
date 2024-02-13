
part of devspace;


// ignore: constant_identifier_names
const double CONTENT_DEFAULT_LINE_HEIGHT = 1.1;

abstract class TextLabel {

  TextLabel._();

  static Widget small(String? text, {
    Color? color,
    bool? italic,
    bool? bold,
    TextAlign? textAlign,
    double? lineHeight = CONTENT_DEFAULT_LINE_HEIGHT,
    double? letterSpacing,
    bool? softWrap,
    TextStyle? style
  })
  {
    return Builder(
      builder: (context) => Text(text ?? '',
        textAlign: textAlign,
        softWrap: softWrap,
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
    double? lineHeight = CONTENT_DEFAULT_LINE_HEIGHT,
    double? letterSpacing,
    bool? softWrap,
    TextStyle? style
  })
  {
    return Builder(
      builder: (context) => Text(text ?? '',
        textAlign: textAlign,
        softWrap: softWrap,
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
    double? lineHeight = CONTENT_DEFAULT_LINE_HEIGHT,
    double? letterSpacing,
    bool? softWrap,
    TextStyle? style
  })
  {
    return Builder(
      builder: (context) => Text(text ?? '',
        textAlign: textAlign,
        softWrap: softWrap,
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

  static Widget size3(kSize3 size, String? text, {
    Color? color,
    bool? italic,
    bool? bold,
    TextAlign? textAlign,
    double? lineHeight = CONTENT_DEFAULT_LINE_HEIGHT,
    double? letterSpacing,
    bool? softWrap,
    TextStyle? style
  })
  {
    switch (size)
    {
      case kSize3.S: return small(text, color: color, softWrap: softWrap, italic: italic, bold: bold, textAlign: textAlign, lineHeight: lineHeight, letterSpacing: letterSpacing, style: style);
      case kSize3.M: return medium(text, color: color, softWrap: softWrap, italic: italic, bold: bold, textAlign: textAlign, lineHeight: lineHeight, letterSpacing: letterSpacing, style: style);
      case kSize3.L: return large(text, color: color, softWrap: softWrap, italic: italic, bold: bold, textAlign: textAlign, lineHeight: lineHeight, letterSpacing: letterSpacing, style: style);
    }
  }

  static Widget small(String? text, {
    Color? color,
    bool? italic,
    bool? bold,
    TextAlign? textAlign,
    double? lineHeight,
    double? letterSpacing,
    bool? softWrap,
    TextStyle? style
  })
  {
    return Builder(
      builder: (context) => Text(text ?? '',
        textAlign: textAlign,
        softWrap: softWrap,
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
    bool? softWrap,
    TextStyle? style
  })
  {
    return Builder(
      builder: (context) => Text(text ?? '',
        textAlign: textAlign,
        softWrap: softWrap,
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
    bool? softWrap,
    TextStyle? style
  })
  {
    return Builder(
      builder: (context) => Text(text ?? '',
        textAlign: textAlign,
        softWrap: softWrap,
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

  static Widget size3(kSize3 size, String? text, {
    Color? color,
    bool? italic,
    bool? bold,
    TextAlign? textAlign,
    double? lineHeight = CONTENT_DEFAULT_LINE_HEIGHT,
    double? letterSpacing,
    bool? softWrap,
    TextStyle? style
  })
  {
    switch (size)
    {
      case kSize3.S: return small(text, color: color, softWrap: softWrap, italic: italic, bold: bold, textAlign: textAlign, lineHeight: lineHeight, letterSpacing: letterSpacing, style: style);
      case kSize3.M: return medium(text, color: color, softWrap: softWrap, italic: italic, bold: bold, textAlign: textAlign, lineHeight: lineHeight, letterSpacing: letterSpacing, style: style);
      case kSize3.L: return large(text, color: color, softWrap: softWrap, italic: italic, bold: bold, textAlign: textAlign, lineHeight: lineHeight, letterSpacing: letterSpacing, style: style);
    }
  }

  static Widget small(String? text, {
    Color? color,
    bool? italic,
    bool? bold,
    TextAlign? textAlign,
    double? lineHeight = CONTENT_DEFAULT_LINE_HEIGHT,
    double? letterSpacing,
    bool? softWrap,
    TextStyle? style
  })
  {
    return Builder(
      builder: (context) => Text(text ?? '',
        textAlign: textAlign,
        softWrap: softWrap,
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
    double? lineHeight = CONTENT_DEFAULT_LINE_HEIGHT,
    double? letterSpacing,
    bool? softWrap,
    TextStyle? style
  })
  {
    return Builder(
      builder: (context) => Text(text ?? '',
        textAlign: textAlign,
        softWrap: softWrap,
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
    double? lineHeight = CONTENT_DEFAULT_LINE_HEIGHT,
    double? letterSpacing,
    bool? softWrap,
    TextStyle? style
  })
  {
    return Builder(
      builder: (context) => Text(text ?? '',
        textAlign: textAlign,
        softWrap: softWrap,
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

  static Widget size3(kSize3 size, String? text, {
    Color? color,
    bool? italic,
    bool? bold,
    TextAlign? textAlign,
    double? lineHeight = CONTENT_DEFAULT_LINE_HEIGHT,
    double? letterSpacing,
    bool? softWrap,
    TextStyle? style
  })
  {
    switch (size)
    {
      case kSize3.S: return small(text, color: color, softWrap: softWrap, italic: italic, bold: bold, textAlign: textAlign, lineHeight: lineHeight, letterSpacing: letterSpacing, style: style);
      case kSize3.M: return medium(text, color: color, softWrap: softWrap, italic: italic, bold: bold, textAlign: textAlign, lineHeight: lineHeight, letterSpacing: letterSpacing, style: style);
      case kSize3.L: return large(text, color: color, softWrap: softWrap, italic: italic, bold: bold, textAlign: textAlign, lineHeight: lineHeight, letterSpacing: letterSpacing, style: style);
    }
  }

  static Widget small(String? text, {
    Color? color,
    bool? italic,
    bool? bold,
    TextAlign? textAlign,
    double? lineHeight,
    double? letterSpacing,
    bool? softWrap,
    TextStyle? style
  })
  {
    return Builder(
      builder: (context) => Text(text ?? '',
        textAlign: textAlign,
        softWrap: softWrap,
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
    bool? softWrap,
    TextStyle? style
  })
  {
    return Builder(
      builder: (context) => Text(text ?? '',
        textAlign: textAlign,
        softWrap: softWrap,
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
    bool? softWrap,
    TextStyle? style
  })
  {
    return Builder(
      builder: (context) => Text(text ?? '',
        textAlign: textAlign,
        softWrap: softWrap,
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