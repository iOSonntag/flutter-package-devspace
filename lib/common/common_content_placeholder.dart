


part of devspace;

abstract class CommonContentPlaceholder {

  CommonContentPlaceholder._();

  static Widget featureInDevelopment()
  {
    return ArchInfoBox.info(
      variant: kInfoBoxVariant.contentPlaceholder,
      icon: Symbols.construction_rounded,
      title: LibStrings.lib_commonContentPlaceholder_featureInDevelopment_title.tr(),
      message: LibStrings.lib_commonContentPlaceholder_featureInDevelopment_message.tr(),
    );
  }

}