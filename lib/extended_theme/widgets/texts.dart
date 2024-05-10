
part of devspace;


// ignore: constant_identifier_names
//const double CONTENT_DEFAULT_LINE_HEIGHT = 1.1;

abstract class TextLabel {

  TextLabel._();

  static Widget small(String? text, {
    Color? color,
    bool? italic,
    bool? bold,
    TextAlign? textAlign,
    double? lineHeight,
    double? letterSpacing,
    bool? softWrap,
    bool? shrinkIfNeeded,
    int? maxLines,
    TextStyle? style
  })
  {
    return Builder(
      builder: (context) => _TextBuilder(text, 
        color: color,
        italic: italic,
        bold: bold,
        textAlign: textAlign,
        lineHeight: lineHeight,
        letterSpacing: letterSpacing,
        softWrap: softWrap,
        shrinkIfNeeded: shrinkIfNeeded,
        maxLines: maxLines,
        baseStyle: context.text.labelSmall!,
        style: style
      )
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
    bool? shrinkIfNeeded,
    int? maxLines,
    TextStyle? style
  })
  {
    return Builder(
      builder: (context) => _TextBuilder(text, 
        color: color,
        italic: italic,
        bold: bold,
        textAlign: textAlign,
        lineHeight: lineHeight,
        letterSpacing: letterSpacing,
        softWrap: softWrap,
        shrinkIfNeeded: shrinkIfNeeded,
        maxLines: maxLines,
        baseStyle: context.text.labelMedium!,
        style: style
      )
    );
  }

  static Widget large(String? text, {
    Color? color,
    bool? italic,
    bool? bold,
    TextAlign? textAlign,
    double? lineHeight,//,
    double? letterSpacing,
    bool? softWrap,
    bool? shrinkIfNeeded,
    int? maxLines,
    TextStyle? style
  })
  {
    return Builder(
      builder: (context) => _TextBuilder(text, 
        color: color,
        italic: italic,
        bold: bold,
        textAlign: textAlign,
        lineHeight: lineHeight,
        letterSpacing: letterSpacing,
        softWrap: softWrap,
        shrinkIfNeeded: shrinkIfNeeded,
        maxLines: maxLines,
        baseStyle: context.text.labelLarge!,
        style: style
      )
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
    double? lineHeight,
    double? letterSpacing,
    bool? softWrap,
    bool? shrinkIfNeeded,
    int? maxLines,
    TextStyle? style
  })
  {
    switch (size)
    {
      case kSize3.S: return small(text, color: color, softWrap: softWrap, italic: italic, bold: bold, textAlign: textAlign, lineHeight: lineHeight, letterSpacing: letterSpacing, shrinkIfNeeded: shrinkIfNeeded, maxLines: maxLines, style: style);
      case kSize3.M: return medium(text, color: color, softWrap: softWrap, italic: italic, bold: bold, textAlign: textAlign, lineHeight: lineHeight, letterSpacing: letterSpacing, shrinkIfNeeded: shrinkIfNeeded, maxLines: maxLines, style: style);
      case kSize3.L: return large(text, color: color, softWrap: softWrap, italic: italic, bold: bold, textAlign: textAlign, lineHeight: lineHeight, letterSpacing: letterSpacing, shrinkIfNeeded: shrinkIfNeeded, maxLines: maxLines, style: style);
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
    bool? shrinkIfNeeded,
    int? maxLines,
    TextStyle? style
  })
  {
    return Builder(
      builder: (context) => _TextBuilder(text, 
        color: color,
        italic: italic,
        bold: bold,
        textAlign: textAlign,
        lineHeight: lineHeight,
        letterSpacing: letterSpacing,
        softWrap: softWrap,
        shrinkIfNeeded: shrinkIfNeeded,
        maxLines: maxLines,
        baseStyle: context.text.titleSmall!,
        style: style
      )
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
    bool? shrinkIfNeeded,
    int? maxLines,
    TextStyle? style
  })
  {
    return Builder(
      builder: (context) => _TextBuilder(text, 
        color: color,
        italic: italic,
        bold: bold,
        textAlign: textAlign,
        lineHeight: lineHeight,
        letterSpacing: letterSpacing,
        softWrap: softWrap,
        shrinkIfNeeded: shrinkIfNeeded,
        maxLines: maxLines,
        baseStyle: context.text.titleMedium!,
        style: style
      )
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
    bool? shrinkIfNeeded,
    int? maxLines,
    TextStyle? style
  })
  {
    return Builder(
      builder: (context) => _TextBuilder(text, 
        color: color,
        italic: italic,
        bold: bold,
        textAlign: textAlign,
        lineHeight: lineHeight,
        letterSpacing: letterSpacing,
        softWrap: softWrap,
        shrinkIfNeeded: shrinkIfNeeded,
        maxLines: maxLines,
        baseStyle: context.text.titleLarge!,
        style: style
      )
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
    double? lineHeight,
    double? letterSpacing,
    bool? softWrap,
    bool? shrinkIfNeeded,
    int? maxLines,
    TextStyle? style
  })
  {
    switch (size)
    {
      case kSize3.S: return small(text, color: color, softWrap: softWrap, italic: italic, bold: bold, textAlign: textAlign, lineHeight: lineHeight, letterSpacing: letterSpacing, shrinkIfNeeded: shrinkIfNeeded, maxLines: maxLines, style: style);
      case kSize3.M: return medium(text, color: color, softWrap: softWrap, italic: italic, bold: bold, textAlign: textAlign, lineHeight: lineHeight, letterSpacing: letterSpacing, shrinkIfNeeded: shrinkIfNeeded, maxLines: maxLines, style: style);
      case kSize3.L: return large(text, color: color, softWrap: softWrap, italic: italic, bold: bold, textAlign: textAlign, lineHeight: lineHeight, letterSpacing: letterSpacing, shrinkIfNeeded: shrinkIfNeeded, maxLines: maxLines, style: style);
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
    bool? shrinkIfNeeded,
    int? maxLines,
    TextStyle? style
  })
  {
    return Builder(
      builder: (context) => _TextBuilder(text, 
        color: color,
        italic: italic,
        bold: bold,
        textAlign: textAlign,
        lineHeight: lineHeight,
        letterSpacing: letterSpacing,
        softWrap: softWrap,
        shrinkIfNeeded: shrinkIfNeeded,
        maxLines: maxLines,
        baseStyle: context.text.bodySmall!,
        style: style
      )
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
    bool? shrinkIfNeeded,
    int? maxLines,
    TextStyle? style
  })
  {
    return Builder(
      builder: (context) => _TextBuilder(text, 
        color: color,
        italic: italic,
        bold: bold,
        textAlign: textAlign,
        lineHeight: lineHeight,
        letterSpacing: letterSpacing,
        softWrap: softWrap,
        shrinkIfNeeded: shrinkIfNeeded,
        maxLines: maxLines,
        baseStyle: context.text.bodyMedium!,
        style: style
      )
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
    bool? shrinkIfNeeded,
    int? maxLines,
    TextStyle? style
  })
  {
    return Builder(
      builder: (context) => _TextBuilder(text, 
        color: color,
        italic: italic,
        bold: bold,
        textAlign: textAlign,
        lineHeight: lineHeight,
        letterSpacing: letterSpacing,
        softWrap: softWrap,
        shrinkIfNeeded: shrinkIfNeeded,
        maxLines: maxLines,
        baseStyle: context.text.bodyLarge!,
        style: style
      )
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
    double? lineHeight,
    double? letterSpacing,
    bool? softWrap,
    bool? shrinkIfNeeded,
    int? maxLines,
    TextStyle? style
  })
  {
    switch (size)
    {
      case kSize3.S: return small(text, color: color, softWrap: softWrap, italic: italic, bold: bold, textAlign: textAlign, lineHeight: lineHeight, letterSpacing: letterSpacing, shrinkIfNeeded: shrinkIfNeeded, maxLines: maxLines, style: style);
      case kSize3.M: return medium(text, color: color, softWrap: softWrap, italic: italic, bold: bold, textAlign: textAlign, lineHeight: lineHeight, letterSpacing: letterSpacing, shrinkIfNeeded: shrinkIfNeeded, maxLines: maxLines, style: style);
      case kSize3.L: return large(text, color: color, softWrap: softWrap, italic: italic, bold: bold, textAlign: textAlign, lineHeight: lineHeight, letterSpacing: letterSpacing, shrinkIfNeeded: shrinkIfNeeded, maxLines: maxLines, style: style);
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
    bool? shrinkIfNeeded,
    int? maxLines,
    TextStyle? style
  })
  {
    return Builder(
      builder: (context) => _TextBuilder(text, 
        color: color,
        italic: italic,
        bold: bold,
        textAlign: textAlign,
        lineHeight: lineHeight,
        letterSpacing: letterSpacing,
        softWrap: softWrap,
        shrinkIfNeeded: shrinkIfNeeded,
        maxLines: maxLines,
        baseStyle: context.text.headlineSmall!,
        style: style
      )
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
    bool? shrinkIfNeeded,
    int? maxLines,
    TextStyle? style
  })
  {
    return Builder(
      builder: (context) => _TextBuilder(text, 
        color: color,
        italic: italic,
        bold: bold,
        textAlign: textAlign,
        lineHeight: lineHeight,
        letterSpacing: letterSpacing,
        softWrap: softWrap,
        shrinkIfNeeded: shrinkIfNeeded,
        maxLines: maxLines,
        baseStyle: context.text.headlineMedium!,
        style: style
      )
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
    bool? shrinkIfNeeded,
    int? maxLines,
    TextStyle? style
  })
  {
    return Builder(
      builder: (context) =>  _TextBuilder(text, 
        color: color,
        italic: italic,
        bold: bold,
        textAlign: textAlign,
        lineHeight: lineHeight,
        letterSpacing: letterSpacing,
        softWrap: softWrap,
        shrinkIfNeeded: shrinkIfNeeded,
        maxLines: maxLines,
        baseStyle: context.text.headlineLarge!,
        style: style
      )
    );
  }


}


class _TextBuilder extends StatelessWidget {

  final String? text;
  final Color? color;
  final bool? italic;
  final bool? bold;
  final TextAlign? textAlign;
  final double? lineHeight;
  final double? letterSpacing;
  final bool? softWrap;
  final bool? shrinkIfNeeded;
  final int? maxLines;
  final TextStyle baseStyle;
  final TextStyle? style;

  const _TextBuilder(this.text, {
    required this.color,
    required this.italic,
    required this.bold,
    required this.textAlign,
    required this.lineHeight,
    required this.letterSpacing,
    required this.softWrap,
    required this.shrinkIfNeeded,
    required this.maxLines,
    required this.baseStyle,
    required this.style
  });

  @override
  Widget build(BuildContext context)
  {
    if (shrinkIfNeeded == true)
    {
      TextStyle finalStyle = baseStyle.merge(style).copyWith(
        color: color,
        fontStyle: italic == true ? FontStyle.italic : null,
        fontWeight: bold == true ? FontWeight.bold : FontWeight.normal,
        height: lineHeight, 
        letterSpacing: letterSpacing
      );


      return AutoSizeText(text ?? '',
        textAlign: textAlign,
        maxLines: maxLines,
        softWrap: softWrap,
        maxFontSize: finalStyle.fontSize ?? double.infinity,
        minFontSize: 4.0,
        style: finalStyle,
      );
    }

    return Text(text ?? '',
      textAlign: textAlign,
      softWrap: softWrap,
      maxLines: maxLines,
      style: baseStyle.merge(style).copyWith(
        color: color,
        fontStyle: italic == true ? FontStyle.italic : null,
        fontWeight: bold == true ? FontWeight.bold : FontWeight.normal,
        height: lineHeight, 
        letterSpacing: letterSpacing
      ),
    );
  }

}