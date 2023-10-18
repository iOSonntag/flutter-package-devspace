


part of devspace;

extension BoolExtension on bool {
  

  bool toggle() => !this;

  T thenEither<T>(T trueValue, T falseValue)
  {
    if (this)
    {
      return trueValue;
    }
    
    return falseValue;
  }

  T? then<T>(T trueValue)
  {
    if (this)
    {
      return trueValue;
    }
    
    return null;
  }

  // idea thenUse | thenElse

  /// Returns [child] if this is true, otherwise returns null.
  /// 
  /// This is useful for when you want to conditionally show a widget, but you
  /// don't want to have to wrap it in an [Opacity] or [Offstage] widget.
  /// 
  /// If you need the function to return a [SizedBox.shrink] instead of null,
  /// use [thenChild] instead.
  Widget? maybeThenChild(Widget child)
  {
    if (this)
    {
      return child;
    }
    
    return null;
  }

  /// Returns [child] if this is true, otherwise returns a [SizedBox.shrink].
  /// 
  /// This is useful for when you want to conditionally show a widget, but you
  /// don't want to have to wrap it in an [Opacity] or [Offstage] widget.
  /// 
  /// If you need the function to return null instead of a [SizedBox.shrink],
  /// use [maybeThenChild] instead.
  Widget thenChild(Widget child)
  {
    if (this)
    {
      return child;
    }
    
    return const SizedBox.shrink();
  }


  Widget thenNotChild(Widget child)
  {
    if (!this)
    {
      return child;
    }
    
    return const SizedBox.shrink();
  }
}

