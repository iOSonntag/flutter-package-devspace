

part of devspace;


class DefaultInfoBoxSmallBrick extends ArchBaseStatelessWidget<InfoBoxData> {

  DefaultInfoBoxSmallBrick({
    super.key,
    required super.data
  }) : super(allowCustomVariants: false);


  @override
  bool hasMinimumRequirements() => data.message != null;
    
  
  @override
  void checkUnsupportedFields()
  {
    unsupported(data.subtitle, 'onAction');
  }

  @override
  Widget build(BuildContext context)
  {
    Color titleColor = _titleColor(context);
    Color contentColor = _contentColor(context);
    Widget child = Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [

        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            if (_buildHeader(context)) _buildHeadline(context, titleColor),

            if (data.message != null) ...[
              if (_buildHeader(context)) context.spaceXS,

              Padding(
                padding: data.icon != null ? context.paddingXS_0.excludeRight() : EdgeInsets.zero,
                child: TextBody.small(data.message!,
                  color: contentColor,
                  shrinkIfNeeded: true,
                ),
              ),
            ],

          ],
        ).expand(),

        if (data.onAction != null) ...[
          context.spaceM,

          ArchButton(
            title: data.actionTitle ?? LibStrings.lib_general_actionRetry.tr(),
            size: kSize3.S,
            type: data.type == kInfoBoxType.info ? kButtonType.primary : kButtonType.regular,
            onSurface: data.type == kInfoBoxType.info ? data.onSurface : true,
            onPressed: data.onAction,
          ),
        ],
      ],
    );


    child = Padding(
      padding: context.paddingM,
      child: child,
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: context.dimensions.borderRadiusM,
        color: data.type == kInfoBoxType.info ? null : _backgroundColor(context),
        border: data.type != kInfoBoxType.info ? null : Border.all(
          color: _backgroundColor(context),
          width: context.dimensions.borderThicknessXS,
        ),
      ),
      child: child,
    );
  }

  bool _buildHeader(BuildContext context)
  {
    return data.icon != null || data.title != null;
  }

  Widget _buildHeadline(BuildContext context, Color color)
  {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [

        if (data.icon != null) ...[
          Icon(data.icon!,
            size: context.dimensions.iconSizeS,
            color: color,
          ),
          context.spaceXS,
        ],

        if (data.title != null) TextTitle.small(data.title!,
          color: color,
          maxLines: 1,
          shrinkIfNeeded: true,
        ),

      ],
    );
  }


  Color _backgroundColor(BuildContext context)
  {
    return switch (data.type)
    {
      kInfoBoxType.error => context.colors.error,
      kInfoBoxType.warning => context.colors.warning,
      kInfoBoxType.success => context.colors.success,
      kInfoBoxType.info => data.onSurface ? context.colors.onSurfaceLeastFocus : context.colors.onBackgroundLeastFocus,
      kInfoBoxType.congratulations => context.colors.congratulations,
    };
  }

  Color _titleColor(BuildContext context)
  {
    return switch (data.type)
    {
      kInfoBoxType.error => context.colors.onError,
      kInfoBoxType.warning => context.colors.onWarning,
      kInfoBoxType.success => context.colors.onSuccess,
      kInfoBoxType.info => data.onSurface ? context.colors.onSurface : context.colors.onBackground,
      kInfoBoxType.congratulations => context.colors.onCongratulations,
    };
  }

  Color _contentColor(BuildContext context)
  {
    return switch (data.type)
    {
      kInfoBoxType.error => context.colors.onError.withOpacity(0.7),
      kInfoBoxType.warning => context.colors.onWarning.withOpacity(0.7),
      kInfoBoxType.success => context.colors.onSuccess.withOpacity(0.7),
      kInfoBoxType.info => data.onSurface ? context.colors.onSurfaceLessFocus : context.colors.onBackgroundLessFocus,
      kInfoBoxType.congratulations => context.colors.onCongratulations.withOpacity(0.7),
    };
  }



}















