import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/custompageview_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'feed_adotante_widget.dart' show FeedAdotanteWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FeedAdotanteModel extends FlutterFlowModel<FeedAdotanteWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - verificaErro] action in Button widget.
  bool? verificacao;
  // Models for custompageview dynamic component.
  late FlutterFlowDynamicModels<CustompageviewModel> custompageviewModels1;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Models for custompageview dynamic component.
  late FlutterFlowDynamicModels<CustompageviewModel> custompageviewModels2;

  @override
  void initState(BuildContext context) {
    custompageviewModels1 =
        FlutterFlowDynamicModels(() => CustompageviewModel());
    custompageviewModels2 =
        FlutterFlowDynamicModels(() => CustompageviewModel());
  }

  @override
  void dispose() {
    custompageviewModels1.dispose();
    tabBarController?.dispose();
    custompageviewModels2.dispose();
  }
}
