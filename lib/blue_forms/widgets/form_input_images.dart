



part of devspace;

class _FormInputImagesWidget extends StatelessWidget {

  final FormInputImages definition;
  final Color? labelColor;
  final bool onBackground;
  final bool visuallyMarkRequired;
  final dynamic currentSavedValue;
  final String? externalError;
  final void Function(List<Uint8List> images) onSave;

  const _FormInputImagesWidget({
    super.key,
    required this.definition,
    this.labelColor,
    required this.onBackground,
    required this.visuallyMarkRequired,
    required this.currentSavedValue,
    required this.onSave,
    this.externalError,
  });

  @override
  Widget build(BuildContext context)
  {
    if (definition.max == 1)
    {
      img.Image? currentSavedFile;

      if (currentSavedValue != null && currentSavedValue is List<img.Image> && currentSavedValue.isNotEmpty)
      {
        currentSavedFile = currentSavedValue[0];
      }

      return _FormInputImagesWidgetSingle(
        definition: definition,
        labelColor: labelColor,
        onBackground: onBackground,
        visuallyMarkRequired: visuallyMarkRequired,
        currentSavedValue: currentSavedFile,
        onSave: (image) => onSave(image == null ? [] : [image]),
        externalError: externalError,
      );
    }

    return _FormInputImagesWidgetMulti(
      definition: definition,
      labelColor: labelColor,
      onBackground: onBackground,
      visuallyMarkRequired: visuallyMarkRequired,
      currentSavedValue: currentSavedValue,
      onSave: onSave,
      externalError: externalError,
    );
  }

}




class _FormInputImagesWidgetMulti extends StatefulWidget {

  final FormInputImages definition;
  final Color? labelColor;
  final bool onBackground;
  final bool visuallyMarkRequired;
  final dynamic currentSavedValue;
  final String? externalError;
  final void Function(List<Uint8List> images) onSave;

  const _FormInputImagesWidgetMulti({
    // ignore: unused_element
    super.key,
    required this.definition,
    required this.labelColor,
    required this.onBackground,
    required this.visuallyMarkRequired,
    required this.currentSavedValue,
    required this.onSave,
    this.externalError,
  });

  @override
  State<_FormInputImagesWidgetMulti> createState() => _FormInputImagesWidgetMultiState();
}

class _FormInputImagesWidgetMultiState extends State<_FormInputImagesWidgetMulti> {

  final PageController _pageController = PageController();
  final ImagePicker _picker = ImagePicker();
  final List<XFile> _images = [

    // XFile(TestData.urls.randomImage(keywords: ['event', 'art'])),
    // XFile(TestData.urls.randomImage(keywords: ['event', 'art'])),
    // XFile(TestData.urls.randomImage(keywords: ['event', 'art'])),
    // XFile(TestData.urls.randomImage(keywords: ['event', 'art'])),
  ];

  @override
  void initState()
  {
    _pageController.addListener(() => setState((){}));
    super.initState();

  }

  @override
  Widget build(BuildContext context)
  {
    // TODOLIB: handle file settings correctly
    // TODOLIB: change to img.Image

    return _FormInputContainerWidget(
      description: widget.definition.description,
      extraButtons: widget.definition.extraButtons,
      hasLabel: widget.definition.label != null,
      onBackground: widget.onBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [

          // TODOLIB: this is actually wrong an internal error through validatyion
          // could still accour and thus the label should still be colored red
          // see archtextfield for reference (there it is done correctly)
          _buildLabel(context, widget.externalError != null),

          Container(
            decoration: BoxDecoration(
              borderRadius: context.dimensions.borderRadiusL,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                ),
                BoxShadow(
                  color: Theme.of(context).colorScheme.surface,
                  spreadRadius: -1.0,
                  blurRadius: 3.0,
                ),
              ]
            ),
            child: Column(
              children: [

                _buildContentRow(context),

                _buildThumbnailRow(context),
                
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentRow(BuildContext context)
  {
    return Row(
      children: [

        Expanded(
          child: _buildPreview(context),
        ),
        
        _buildActionColumn(context),

      ],
    );
  }

  Widget _buildPreview(BuildContext context)
  {
    return AspectRatio(
      aspectRatio: widget.definition.imagePreviewAspectRatio,
      child: Stack(
        fit: StackFit.expand,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _images.length,
            itemBuilder: (context, index)
            {
              return Container(
                decoration: BoxDecoration(  
                  boxShadow: [context.highlights.boxShadowM],
                ),
                margin: context.paddingL,
                child: ArchImage(
                  image: _getImageFromFile(_images[index]),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildActionColumn(BuildContext context)
  {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: context.dimensions.borderRadiusL,
        boxShadow: [context.highlights.boxShadowM],
      ),
      margin: context.paddingL.excludeLeft(),
      child: SpacedColumn.M(
        children: [
    
          ArchButton(
            icon: Icons.add_rounded,
            onPressed: _addImages,
          ),
    
          ArchButton(
            icon: Icons.keyboard_arrow_left_rounded,
            type: kButtonType.regular,
            size: kSize3.S,
            onPressed: _moveCurrentImageLeft,
          ),
    
          ArchButton(
            icon: Icons.keyboard_arrow_right_rounded,
            type: kButtonType.regular,
            size: kSize3.S,
            onPressed: _moveCurrentImageRight,
          ),
    
          ArchButton(
            icon: Icons.delete_outline_rounded,
            type: kButtonType.destructive,
            size: kSize3.S,
            onPressed: _deleteCurrentImage,
          ),
    
        ],
      ),
    );
  }

  Widget _buildThumbnailRow(BuildContext context)
  {
    int currentPage = _pageController.currentPage;

    return Padding(
      padding: context.paddingL.excludeTop(),
      child: Row(
        children: [
    
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _images.length,
              itemBuilder: (context, index) =>  _buildThumbnail(context, index, index == currentPage),
            ),
          ),
    
        ],
      ),
    );
  }

  Widget _buildThumbnail(BuildContext context, int index, bool isCurrentPage)
  {
    return Padding(
      padding: index == 0 ? EdgeInsets.zero : context.dimensions.paddingLOnly(left: true),
      child: GestureDetector(
        onTap: () => _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOutCubic,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: context.dimensions.borderRadiusL,
            color: context.colors.surface,
            border: Border.all(
              color: isCurrentPage ? context.colors.primary : context.colors.surface,
              width: context.dimensions.borderThicknessM,
            ),
            boxShadow: [
              if (isCurrentPage) context.highlights.boxShadowM,
            ],
          ),
          child: AspectRatio(
            aspectRatio: 4 / 3,
            child: ArchImage(
              borderRadius: context.dimensions.borderRadiusL.insetBy(context.dimensions.borderThicknessM),
              image: _getImageFromFile(_images[index]),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(BuildContext context, bool hasError)
  {
    return Padding(
      padding: context.dimensions.paddingMOnly(left: true, bottom: true),
      child: Row(
        children: [
          TextLabel.small(
            widget.definition.label,
            color: hasError ? context.colors.error : widget.labelColor ?? context.colors.onBackgroundLessFocus,
          ),

          if (widget.visuallyMarkRequired && widget.definition.isRequired) TextLabel.small(
            ' *',
            color: context.colors.primary,
          )
        ],
      ),
    );
  }

  ImageProvider _getImageFromFile(XFile file)
  {
    if (kIsWeb)
    {
      return NetworkImage(file.path);
    }

    return FileImage(File(file.path));
  }

  Future<void> _addImages() async
  {
    List<XFile> images = await _picker.pickMultiImage();

    if (_images.length + images.length > widget.definition.max)
    {
      images = images.sublist(0, widget.definition.max - _images.length);

      if (!mounted) return;
      await DialogCenter.showNotice(context, message: 'dfhbsiadbfiandsfli');
    }


    setState(()
    {
      _images.addAll(images);
    });
  }


  void _deleteCurrentImage()
  {
    if (_pageController.currentPage >= _images.length)
    {
      return;
    }


    setState(()
    {
      _images.removeAt(_pageController.currentPage);
    });
  }

  void _moveCurrentImageLeft()
  {
    if (_pageController.currentPage == 0)
    {
      return;
    }

    setState(()
    {
      _images.insert(_pageController.currentPage - 1, _images.removeAt(_pageController.currentPage));
      _pageController.jumpToPage(_pageController.currentPage - 1);
    });
  }

  void _moveCurrentImageRight()
  {
    if (_pageController.currentPage >= _images.length - 1)
    {
      return;
    }

    setState(()
    {
      _images.insert(_pageController.currentPage + 1, _images.removeAt(_pageController.currentPage));
      _pageController.jumpToPage(_pageController.currentPage + 1);
    });
  }

  @override
  void dispose()
  {
    _pageController.dispose();

    super.dispose();
  }
}







