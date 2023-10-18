library devspace;

import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:measure_size/measure_size.dart';
import 'package:provider/provider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

import 'lib_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart' as p_url_launcher;

// app_flow_systems

part 'app_flow_systems/app_flow_paged_steps.dart';
part 'app_flow_systems/steps_bar.dart';

// architect

part 'architect/defaults/buttons/button.dart';
part 'architect/defaults/buttons/button.regular.dart';
part 'architect/defaults/buttons/button.soft.dart';
part 'architect/defaults/buttons/button.special.dart';

part 'architect/defaults/input_decoration/input_decoration.dart';

part 'architect/defaults/default_stateless_widget.dart';
part 'architect/defaults/default_variant_switch.dart';

part 'architect/materials/arch_object.dart';
part 'architect/materials/dimensions.dart';

part 'architect/plans/button.dart';
part 'architect/plans/input_decoration.dart';
part 'architect/plans/plan_data.dart';

part 'architect/widgets/arch_button.dart';
part 'architect/widgets/arch_input_decoration.dart';
part 'architect/widgets/base.dart';

part 'architect/architect_plans.dart';
part 'architect/architect.dart';

// blue_forms

part 'blue_forms/blue_forms_controller.dart';
part 'blue_forms/blue_forms_input_container.dart';
part 'blue_forms/blue_forms_input_option_selection.dart';
part 'blue_forms/blue_forms_input_text.dart';
part 'blue_forms/blue_forms_page_form.dart';
part 'blue_forms/blue_forms_page_info.dart';
part 'blue_forms/blue_forms.dart';
part 'blue_forms/input_validators.dart';


// brixies

part 'brixies/edge_shadow.dart';
part 'brixies/hide_keyboard_on_tap.dart';
part 'brixies/intrinsic_height_page_view.dart';
part 'brixies/layout_builder.dart';
part 'brixies/line_divider.dart';
part 'brixies/smooth_swap.dart';
part 'brixies/steps_indicator.dart';

// cognito

part 'cognito/cognito_service.dart';

// config

part 'config/env.dart';

// context_steroids

part 'context_steroids/context_extension_url_launcher.dart';

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

// // phenomenal_grid

// part '../_excluded/phenomenal_grid/animated_phenomenal_grid.dart';
// part '../_excluded/phenomenal_grid/phenomenal_grid_animation_delegate.dart';
// part '../_excluded/phenomenal_grid/phenomenal_grid_layout.dart';
// part '../_excluded/phenomenal_grid/phenomenal_grid.dart';

// type_extensions

part 'type_extensions/alignment.dart';
part 'type_extensions/any.dart';
part 'type_extensions/bool.dart';
part 'type_extensions/color.dart';
part 'type_extensions/curve.dart';
part 'type_extensions/double.dart';
part 'type_extensions/int.dart';
part 'type_extensions/list.dart';
part 'type_extensions/offset.dart';
part 'type_extensions/string.dart';

