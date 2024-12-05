import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'vacina_cadastro_widget.dart' show VacinaCadastroWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class VacinaCadastroModel extends FlutterFlowModel<VacinaCadastroWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Nome_TextField widget.
  FocusNode? nomeTextFieldFocusNode;
  TextEditingController? nomeTextFieldTextController;
  String? Function(BuildContext, String?)? nomeTextFieldTextControllerValidator;
  // State field(s) for Data_TextField widget.
  FocusNode? dataTextFieldFocusNode;
  TextEditingController? dataTextFieldTextController;
  final dataTextFieldMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? dataTextFieldTextControllerValidator;
  // State field(s) for Veterinario_TextField widget.
  FocusNode? veterinarioTextFieldFocusNode;
  TextEditingController? veterinarioTextFieldTextController;
  String? Function(BuildContext, String?)?
      veterinarioTextFieldTextControllerValidator;
  // State field(s) for Peso_TextField widget.
  FocusNode? pesoTextFieldFocusNode;
  TextEditingController? pesoTextFieldTextController;
  String? Function(BuildContext, String?)? pesoTextFieldTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for DataProxima_TextField widget.
  FocusNode? dataProximaTextFieldFocusNode;
  TextEditingController? dataProximaTextFieldTextController;
  final dataProximaTextFieldMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)?
      dataProximaTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nomeTextFieldFocusNode?.dispose();
    nomeTextFieldTextController?.dispose();

    dataTextFieldFocusNode?.dispose();
    dataTextFieldTextController?.dispose();

    veterinarioTextFieldFocusNode?.dispose();
    veterinarioTextFieldTextController?.dispose();

    pesoTextFieldFocusNode?.dispose();
    pesoTextFieldTextController?.dispose();

    dataProximaTextFieldFocusNode?.dispose();
    dataProximaTextFieldTextController?.dispose();
  }
}
