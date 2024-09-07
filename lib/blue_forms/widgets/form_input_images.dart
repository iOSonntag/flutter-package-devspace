



part of devspace;

class _FormInputImagesWidget extends StatelessWidget {

  final FormInputImages definition;
  final Color? labelColor;
  final bool visuallyMarkRequired;
  final dynamic currentSavedValue;
  final String? externalError;
  final void Function(List<Uint8List> images) onSave;

  const _FormInputImagesWidget({
    super.key,
    required this.definition,
    this.labelColor,
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
        visuallyMarkRequired: visuallyMarkRequired,
        currentSavedValue: currentSavedFile,
        onSave: (image) => onSave(image == null ? [] : [image]),
        externalError: externalError,
      );
    }

    return _FormInputImagesWidgetMulti(
      definition: definition,
      labelColor: labelColor,
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
  final bool visuallyMarkRequired;
  final dynamic currentSavedValue;
  final String? externalError;
  final void Function(List<Uint8List> images) onSave;

  const _FormInputImagesWidgetMulti({
    // ignore: unused_element
    super.key,
    required this.definition,
    required this.labelColor,
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
      extraButton: widget.definition.extraButton,
      hasLabel: widget.definition.label != null,
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








class _FormInputImagesWidgetSingle extends StatefulWidget {

  final FormInputImages definition;
  final Color? labelColor;
  final bool visuallyMarkRequired;
  final dynamic currentSavedValue;
  final String? externalError;
  final void Function(Uint8List? image) onSave;

  const _FormInputImagesWidgetSingle({
    // ignore: unused_element
    super.key,
    required this.definition,
    this.labelColor,
    required this.visuallyMarkRequired,
    required this.currentSavedValue,
    required this.onSave,
    this.externalError,
  });

  @override
  State<_FormInputImagesWidgetSingle> createState() => _FormInputImagesWidgetSingleState();
}

class _FormInputImagesWidgetSingleState extends State<_FormInputImagesWidgetSingle> {

  final ImagePicker _picker = ImagePicker();
  bool _isLoading = false;
  String? _internalError;
  ImageProvider? _imageProvider;

  @override
  void initState()
  {
    Uint8List? image = _getImageFromSavedOrInitialValue();

    if (image != null)
    {
      _imageProvider = MemoryImage(image);
    }

    super.initState();
  }

  Uint8List? _getImageFromSavedOrInitialValue()
  {
    List<Uint8List>? image = widget.currentSavedValue ?? widget.definition.initialValue;

    if (image != null && image.isNotEmpty)
    {
      return image[0];
    }

    return null;
  }

  @override
  Widget build(BuildContext context)
  {

    return _FormInputContainerWidget(
      description: widget.definition.description,
      extraButton: widget.definition.extraButton,
      hasLabel: widget.definition.label != null,
      child: FormField<Uint8List?>(
        initialValue: _getImageFromSavedOrInitialValue(),
        onSaved: widget.onSave,
        validator: (image)
        {
          if (_internalError == 'MIN_WIDTH')
          {
            return LibStrings.lib_blueForms_formInputImagesSingle_errorMinWidth.tr(args: [widget.definition.fileSettings.minWidth.toString()]);
          }

          if (_internalError == 'MIN_HEIGHT')
          {
            return LibStrings.lib_blueForms_formInputImagesSingle_errorMinHeight.tr(args: [widget.definition.fileSettings.minHeight.toString()]);
          }


          if (image == null)
          {
            return widget.definition.isRequired ? LibStrings.lib_blueForms_formInputImagesSingle_errorRequired.tr() : null;
          }

          return null;
        
        },
        builder: (state)
        { 
          bool hasError = state.hasError || widget.externalError != null;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
          
              // TODOLIB: this is actually wrong an internal error through validatyion
              // could still accour and thus the label should still be colored red
              // see archtextfield for reference (there it is done correctly)
              _buildLabel(context, hasError),
          
              Container(
                decoration: BoxDecoration(
                  borderRadius: context.dimensions.borderRadiusL,
                  border: hasError.then(Border.all(
                    color: context.colors.error,
                    width: context.dimensions.lineThicknessM,
                  )),
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
                child: AspectRatio(
                  aspectRatio: widget.definition.imagePreviewAspectRatio,
                  child: LoadableView(
                    isLoading: _isLoading,
                    child: _buildPreview(context, state)
                  ),
                ),
              ),

              if (hasError) Padding(
                padding: context.dimensions.paddingMOnly(left: true, top: true),
                child: TextLabel.small(
                  state.errorText ?? widget.externalError,
                  color: context.colors.error,
                ),
              ),
            ],
          );
        }
      ),
    );
  }


  Widget _buildPreview(BuildContext context, FormFieldState<Uint8List?> state)
  {
    if (_imageProvider == null)
    {
      return Container(
        margin: context.paddingL,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              TextBody.medium(LibStrings.lib_blueForms_formInputImages_noImageSelected.tr(),
                color: context.colors.onBackgroundLessFocus,
              ),

              context.spaceM,

              ArchButton(
                title: LibStrings.lib_blueForms_formInputImages_selectImage.tr(),
                onPressed: () => _addImage(ImageSource.gallery, state),
              ),

              // TODOLIB: add take photo button
              // if (context.isPortableDevice) context.spaceM,

            ],
          ),
        ),
      ).toCenter();
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          margin: context.paddingL,
          child: ArchImage(
            edgePreset: kImageEdgePreset.outerShadowM,
            image: _imageProvider!,
          ),
        ),
        Padding(
          padding: context.paddingXXL,
          child: ArchButton(
            title: LibStrings.lib_blueForms_formInputImages_changeImage.tr(),
            onPressed: () => _addImage(ImageSource.gallery, state),
          ).toBottom(),
        ),

        Padding(
          padding: context.paddingS,
          child: CircleButtonClose(
            onPressed: () => _deleteCurrentImage(state),
          ).toTopRight(),
        ),
      ],
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

  Future<void> _addImage(ImageSource source, FormFieldState<Uint8List?> state) async
  {

    

    try
    {
      XFile? imageFile = await _picker.pickImage(source: source);

      setState(()
      {
        _isLoading = true;
        _internalError = null;
      });

      Uint8List? image;

      if (imageFile != null)
      {
        image = await imageFile.readAsBytes();

        // check if is HEIC & platform is web
        if (kIsWeb)
        {
          final minmeType = imageFile.mimeType;

          if (minmeType == 'image/heic' || minmeType == 'image/heif')
          {
            image = await App.events.onWorkaround_web_convertHeicToPng(image);
          }
        }
      }

      if (image == null) return;

      image = await _imageProcessing(image, state);

      if (!context.mounted) return;

      setState(()
      {
        state.didChange(image);
        widget.definition.onChange?.call([image!]);
        _imageProvider = MemoryImage(image!);
      });
    }
    catch (e)
    {
      if (!mounted) return;

      if (e is PlatformException)
      {
        if (e.code == 'photo_access_denied')
        {
          DialogCenter.showCommon(context, kCommonDialog.permissionDeniedGallery);
          return;
        }

        if (e.code == 'camera_access_denied')
        {
          DialogCenter.showCommon(context, kCommonDialog.permissionDeniedCamera);
          return;
        }
        
        return;
      }

      context.showError(e);
    }
    finally
    {
      setState(()
      {
        _isLoading = false;
      });
    }

  }

  Future<Uint8List> _imageProcessing(Uint8List image, FormFieldState<Uint8List?> state) async
  {
    final codec = await ui.instantiateImageCodec(image);
    final frame = await codec.getNextFrame();


    if (widget.definition.fileSettings.minWidth != null && frame.image.width < widget.definition.fileSettings.minWidth!)
    {
      _internalError = 'MIN_WIDTH';
      state.validate();

      throw Exception('Image width is smaller than min width');
    }

    if (widget.definition.fileSettings.minHeight != null && frame.image.height < widget.definition.fileSettings.minHeight!)
    {
      _internalError = 'MIN_HEIGHT';
      state.validate();

      throw Exception('Image height is smaller than min height');
    }

    int minHeight = frame.image.height;
    int minWidth = frame.image.width;

    if (widget.definition.fileSettings.maxWidth != null)
    {
      if (widget.definition.fileSettings.maxHeight != null)
      {
        throw UnimplementedError('Max width and max height are not yet supported');
      }
      else
      {
        minWidth = widget.definition.fileSettings.maxWidth!;
      }
    }
    else if (widget.definition.fileSettings.maxHeight != null)
    {
      minHeight = widget.definition.fileSettings.maxHeight!;
    }

    return await FlutterImageCompress.compressWithList(image,
      minHeight: minHeight,
      minWidth: minWidth,
      quality: (widget.definition.fileSettings.conversionQuality * 100).round(),
      format: switch (widget.definition.fileSettings.conversion)
      {
        kImageConversionType.jpeg => CompressFormat.jpeg,
        kImageConversionType.png => CompressFormat.png,
      },
    );
    

  }


  void _deleteCurrentImage(FormFieldState<Uint8List?> state)
  {
    if (state.value == null)
    {
      return;
    }

    setState(()
    {
      _internalError = null;
      state.didChange(null);
      widget.definition.onChange?.call([]);
      _imageProvider = null;
    });
  }

}