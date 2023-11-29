

part of devspace;


class DefaultListItemStandalone extends ArchBaseStatelessWidget<ListItemData> {

  DefaultListItemStandalone({
    super.key,
    required super.data
  }) : super(allowCustomVariants: false);


  @override
  bool hasMinimumRequirements() => true;
    
  
  @override
  void checkUnsupportedFields()
  {
    unsupportedIf(data.type != kListItemType.regular, 'type', 'only regular type is supported');
    unsupported(data.onSecondaryAction, 'onSecondaryAction');
    unsupported(data.onTertiaryAction, 'onTertiaryAction');
    
  }

  @override
  Widget build(BuildContext context)
  {
    double height = _height(context);

    return SizedBox(
      height: height,
      child: HoverBuilder(
        onTap: data.onPrimaryAction,
        builder: (context, hovered) => ArchCard(
          color: hovered.then(Color.lerp(context.colors.surface, context.colors.onSurface, 0.03)!),
          child: Padding(
            padding: context.paddingL,
            child: Row(
              children: [
      
                if (data.image != null) ...[

                  ArchImage(
                    image: data.image!,
                    aspectRatio: 1.0,
                  ),

                  context.spaceL,

                ],
      
                Expanded(
                  child: _buildTitle(context),
                ),
      
                Icon(
                  Icons.arrow_forward_ios_rounded, 
                  size: height * 0.5,
                  color: context.colors.onBackground.withOpacity(0.03)
                )
          
              ],
            ),
          ),
        ),
      ),
    );
  }

  double _height(BuildContext context)
  {
    return switch (data.size)
    {
      kSize3.S => context.dimensions.listItemHeightS,
      kSize3.M => context.dimensions.listItemHeightM,
      kSize3.L => context.dimensions.listItemHeightL,
    };
  }

  Widget _buildTitle(BuildContext context)
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextTitle.medium(data.title),

        if (data.subtitle != null) ...[

          context.spaceS,

          TextBody.medium(data.subtitle!,
            italic: true,
            color: context.colors.onBackgroundLessFocus,
          ),

        ]
      ],
    );
  }

}















