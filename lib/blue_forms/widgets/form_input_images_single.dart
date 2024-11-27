



part of devspace;



class _FormInputImagesWidgetSingle extends StatefulWidget {

  final FormInputImages definition;
  final Color? labelColor;
  final bool onBackground;
  final bool visuallyMarkRequired;
  final dynamic currentSavedValue;
  final String? externalError;
  final void Function(Uint8List? image) onSave;

  const _FormInputImagesWidgetSingle({
    // ignore: unused_element
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
  State<_FormInputImagesWidgetSingle> createState() => _FormInputImagesWidgetSingleState();
}

class _FormInputImagesWidgetSingleState extends State<_FormInputImagesWidgetSingle> {

  final ImagePicker _picker = ImagePicker();
  bool _isLoading = false;
  String? _internalError;
  MemoryImage? _imageProvider;

  
  CropController? _cropController;
  bool _inCroppingMode = false;
  bool _inCropDirectlyAfterChoosing = false;
  Uint8List? _imageToCrop;
  Uint8List? _croppedImage;


  @override
  void initState()
  {
    Uint8List? image = _getImageFromSavedOrInitialValue();

    if (image != null)
    {
      _imageProvider = MemoryImage(image);
    }

    if (widget.definition.fileSettings.editingOptions.cropMode != kCropingMode.disabled)
    {
      _cropController = CropController();
    }

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp)
    {
      if (widget.definition.fileSettings.editingOptions.cropMode == kCropingMode.forcedOnInitialAsWell)
      {
        if (hasInitialImageAndIsTheCurrentImage())
        {
          setState(()
          {
            _inCroppingMode = true;
            _imageToCrop = _imageProvider!.bytes;
          });
        }
      }
    });
  }

  bool hasInitialImageAndIsTheCurrentImage()
  {
    if (widget.currentSavedValue != null) return false;

    final list = widget.definition.initialValue;

    if (list != null)
    {
      if (list is List<Uint8List?> && list.isNotEmpty)
      {
        return true;
      }
      else if (list is List<Uint8List> && list.isNotEmpty)
      {
        return true;
      }
    }

    return false;
  }

  Uint8List? _getImageFromSavedOrInitialValue()
  {
    final list = widget.currentSavedValue ?? widget.definition.initialValue;

    if (list != null)
    {
      if (list is List<Uint8List?> && list.isNotEmpty)
      {
        return list[0];
      }
      else if (list is List<Uint8List> && list.isNotEmpty)
      {
        return list[0];
      }
    }

    return null;
  }

  @override
  Widget build(BuildContext context)
  {

    return _FormInputContainerWidget(
      description: widget.definition.description,
      extraButtons: widget.definition.extraButtons,
      hasLabel: widget.definition.label != null,
      onBackground: widget.onBackground,
      child: FormField<Uint8List?>(
        initialValue: _getImageFromSavedOrInitialValue(),
        onSaved: widget.onSave,
        validator: (image)
        {
          if (_isLoading || _inCroppingMode || _inCropDirectlyAfterChoosing)
          {
            return LibStrings.lib_blueForms_general_errorCompleteActionFirst.tr();
          }

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
    if (_inCroppingMode)
    {
      return Stack(
        children: [

          Crop(
            controller: _cropController!,
            aspectRatio: widget.definition.fileSettings.editingOptions.cropAspectRatio,
            image: _imageToCrop!,
            onCropped: (croppedImage)
            {
              if (!_inCropDirectlyAfterChoosing)
              {
                setState(()
                {
                  state.didChange(croppedImage);
                  widget.definition.onChange?.call([croppedImage], kImageChangeType.resizeOrCrop);
                  _imageProvider = MemoryImage(croppedImage);
                  _inCroppingMode = false;
                  _isLoading = false;
                });
                return;
              }

              setState(()
              {
                _croppedImage = croppedImage;
              });
            },
          ),

          Positioned(
            bottom: context.dimensions.spaceSValue,
            right: context.dimensions.spaceSValue,
            child: ArchButton(
              icon: Icons.check_rounded,
              size: kSize3.S,
              onPressed: () async
              {
                setState(()
                {
                  _isLoading = true;
                });

                await 100.delay();
                _cropController!.crop();
              }
            ),
          )
        ],
      );
    }

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

        if (widget.definition.fileSettings.editingOptions.cropMode != kCropingMode.disabled) Positioned(
          bottom: context.dimensions.spaceSValue,
          right: context.dimensions.spaceSValue,
          child: ArchButton(
            icon: Icons.crop_rounded,
            size: kSize3.S,
            onPressed: ()
            {
              setState(()
              {
                _inCroppingMode = true;
                _imageToCrop = _imageProvider!.bytes;
              });
            }
          ),
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

      if (_cropController != null && (widget.definition.fileSettings.editingOptions.cropMode == kCropingMode.forcedOnChange || widget.definition.fileSettings.editingOptions.cropMode == kCropingMode.forcedOnInitialAsWell))
      {
        image = await _cropImageDirectlyAfterChoosing(image);
      }
      
      image = await _imageProcessing(image, state);

      if (!context.mounted) return;

      setState(()
      {
        state.didChange(image);
        widget.definition.onChange?.call([image!], kImageChangeType.replace);
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

  Future<Uint8List> _cropImageDirectlyAfterChoosing(Uint8List imageToCrop) async
  {

    setState(()
    {
      _inCropDirectlyAfterChoosing = true;
      _inCroppingMode = true;
      _croppedImage = null;
      _imageToCrop = imageToCrop;
      _isLoading = false;
    });

    while (true)
    {
      await 100.delay();

      if (_croppedImage != null)
      {
        setState(()
        {
          _inCropDirectlyAfterChoosing = false;
          _inCroppingMode = false;
        });
        break;
      }
    }
    return _croppedImage!;
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
        minHeight = 1;
      }
    }
    else if (widget.definition.fileSettings.maxHeight != null)
    {
      minHeight = widget.definition.fileSettings.maxHeight!;
      minWidth = 1;
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
      widget.definition.onChange?.call([], kImageChangeType.replace);
      _imageProvider = null;
    });
  }

}