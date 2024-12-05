import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/custompageview_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextFieldPesquisaCidade widget.
  FocusNode? textFieldPesquisaCidadeFocusNode;
  TextEditingController? textFieldPesquisaCidadeTextController;
  String? Function(BuildContext, String?)?
      textFieldPesquisaCidadeTextControllerValidator;
  // Models for custompageview dynamic component.
  late FlutterFlowDynamicModels<CustompageviewModel> custompageviewModels1;
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
    textFieldPesquisaCidadeFocusNode?.dispose();
    textFieldPesquisaCidadeTextController?.dispose();

    custompageviewModels1.dispose();
    custompageviewModels2.dispose();
  }
}
