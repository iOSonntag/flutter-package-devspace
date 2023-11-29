library devspace;

import 'dart:async';
import 'dart:io';
import 'dart:math' as math;
import 'dart:ui';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart' as widgets;

import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:measure_size/measure_size.dart';
import 'package:provider/provider.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:super_tooltip/super_tooltip.dart';

import 'lib_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart' as p_url_launcher;
import 'dart:ui' as ui;

// animations

part 'animations/helpers.dart';

// app_flow_systems

part 'app_flow_systems/app_flow_paged_steps.dart';
part 'app_flow_systems/paginated_list_view.dart';
part 'app_flow_systems/steps_bar.dart';

// app_scaffolds

part 'app_scaffolds/app_loader.dart';
part 'app_scaffolds/app_router.dart';
part 'app_scaffolds/app.dart';



// architect

// part 'architect/plans/XXX/arch.dart';
// part 'architect/plans/XXX/data.dart';
// part 'architect/plans/XXX/default.dart';
// part 'architect/plans/XXX/default.regular.dart';


part 'architect/materials/arch_base_stateless_widget.dart';
part 'architect/materials/arch_base_variant_switch.dart';
part 'architect/materials/arch_base.dart';
part 'architect/materials/arch_object.dart';
part 'architect/materials/plan_data.dart';

part 'architect/plans/bonus_info/arch.dart';
part 'architect/plans/bonus_info/data.dart';
part 'architect/plans/bonus_info/default.dart';
part 'architect/plans/bonus_info/default.regular.dart';

part 'architect/plans/button/arch.dart';
part 'architect/plans/button/data.dart';
part 'architect/plans/button/default.dart';
part 'architect/plans/button/default.regular.dart';
part 'architect/plans/button/default.soft.dart';
part 'architect/plans/button/default.special.dart';

part 'architect/plans/card/arch.dart';
part 'architect/plans/card/data.dart';
part 'architect/plans/card/default.background.dart';
part 'architect/plans/card/default.dart';
part 'architect/plans/card/default.regular.dart';

part 'architect/plans/image/arch.dart';
part 'architect/plans/image/data.dart';
part 'architect/plans/image/default.dart';
part 'architect/plans/image/default.regular.dart';

part 'architect/plans/info_box/arch.dart';
part 'architect/plans/info_box/data.dart';
part 'architect/plans/info_box/default.content_placeholder.dart';
part 'architect/plans/info_box/default.dart';
part 'architect/plans/info_box/default.regular.dart';

part 'architect/plans/input_decoration/arch.dart';
part 'architect/plans/input_decoration/data.dart';
part 'architect/plans/input_decoration/default.dart';

part 'architect/plans/label/arch.dart';
part 'architect/plans/label/data.dart';
part 'architect/plans/label/default.dart';
part 'architect/plans/label/default.regular.dart';

part 'architect/plans/labeled_content/arch.dart';
part 'architect/plans/labeled_content/data.dart';
part 'architect/plans/labeled_content/default.dart';
part 'architect/plans/labeled_content/default.regular.dart';

part 'architect/plans/list_item/arch.dart';
part 'architect/plans/list_item/data.dart';
part 'architect/plans/list_item/default.dart';
part 'architect/plans/list_item/default.regular.dart';
part 'architect/plans/list_item/default.standalone.dart';

part 'architect/plans/loading_indicator/arch.dart';
part 'architect/plans/loading_indicator/data.dart';
part 'architect/plans/loading_indicator/default.dart';
part 'architect/plans/loading_indicator/default.regular.dart';
part 'architect/plans/loading_indicator/default.special.dart';

part 'architect/plans/text_field/arch.dart';
part 'architect/plans/text_field/data.dart';
part 'architect/plans/text_field/default.dart';
part 'architect/plans/text_field/default.regular.dart';


part 'architect/architect_plans.dart';
part 'architect/architect.dart';

// blue_forms

part 'blue_forms/models/elements/base.dart';
part 'blue_forms/models/elements/form_custom_widget.dart';
part 'blue_forms/models/elements/form_input_group.dart';
part 'blue_forms/models/elements/form_input_images.dart';
part 'blue_forms/models/elements/form_input_pick_option.dart';
part 'blue_forms/models/elements/form_input_text.dart';

part 'blue_forms/models/pages/base.dart';
part 'blue_forms/models/pages/form_page_info.dart';
part 'blue_forms/models/pages/form_page.dart';

part 'blue_forms/models/general.dart';

part 'blue_forms/util/common_form_inputs.dart';
part 'blue_forms/util/input_validators.dart';

part 'blue_forms/widgets/form_element.dart';
part 'blue_forms/widgets/form_input_container.dart';
part 'blue_forms/widgets/form_input_group.dart';
part 'blue_forms/widgets/form_input_images.dart';
part 'blue_forms/widgets/form_input_pick_option.dart';
part 'blue_forms/widgets/form_input_text.dart';
part 'blue_forms/widgets/form_page_info.dart';
part 'blue_forms/widgets/form_page.dart';

part 'blue_forms/blue_forms.dart';


// brixies

part 'brixies/controller_holder.dart';
part 'brixies/edge_shadow.dart';
part 'brixies/empty_widget.dart';
part 'brixies/golden_center.dart';
part 'brixies/hide_keyboard_on_tap.dart';
part 'brixies/hover_builder.dart';
part 'brixies/intrinsic_height_page_view.dart';
part 'brixies/layout_builder.dart';
part 'brixies/line_divider.dart';
part 'brixies/loadable_view.dart';
part 'brixies/smooth_swap.dart';
part 'brixies/spaced_flex.dart';
part 'brixies/steps_indicator.dart';

// cognito

part 'cognito/cognito_service.dart';

// config

part 'config/env.dart';

// context_steroids

part 'context_steroids/context_extension_url_launcher.dart';

// core

part 'core/dialog/default_dialog.dart';
part 'core/dialog/dialog.dart';
part 'core/dialog/text_dialog.dart';
part 'core/dialog/dialog_action.dart';

// extended_theme

part 'extended_theme/extensions/context_extension.dart';
part 'extended_theme/extensions/edge_insets_extension.dart';
part 'extended_theme/extensions/theme_data_extension.dart';

part 'extended_theme/widgets/texts.dart';

part 'extended_theme/additional_color_theme_data.dart';
part 'extended_theme/animations_theme_data.dart';
part 'extended_theme/colors_access.dart';
part 'extended_theme/dimensions_theme_data.dart';
part 'extended_theme/highlights_theme_data.dart';

// glue_provider

part 'glue_provider/context_extension.dart';
part 'glue_provider/dependency_resolver.dart';
part 'glue_provider/glue_component.dart';
part 'glue_provider/glue.dart';
part 'glue_provider/insert_glues.dart';

// models

part 'models/network/paginated_list.dart';

part 'models/result/common/cognito.dart';
part 'models/result/result.dart';
part 'models/result/service_result.dart';

part 'models/action_result.dart';
part 'models/builder.dart';
part 'models/financials.dart';
part 'models/futures.dart';
part 'models/geometry.dart';

// my_service

part 'my_service/my_service.dart';

// test_data

part 'test_data/test_data.dart';

// // phenomenal_grid

// part '../_excluded/phenomenal_grid/animated_phenomenal_grid.dart';
// part '../_excluded/phenomenal_grid/phenomenal_grid_animation_delegate.dart';
// part '../_excluded/phenomenal_grid/phenomenal_grid_layout.dart';
// part '../_excluded/phenomenal_grid/phenomenal_grid.dart';

// type_extensions

part 'type_extensions/alignment.dart';
part 'type_extensions/any.dart';
part 'type_extensions/bool.dart';
part 'type_extensions/border_radius.dart';
part 'type_extensions/color.dart';
part 'type_extensions/controller.dart';
part 'type_extensions/curve.dart';
part 'type_extensions/double.dart';
part 'type_extensions/enum.dart';
part 'type_extensions/int.dart';
part 'type_extensions/list.dart';
part 'type_extensions/offset.dart';
part 'type_extensions/string.dart';

// utils

part 'utils/random.dart';

