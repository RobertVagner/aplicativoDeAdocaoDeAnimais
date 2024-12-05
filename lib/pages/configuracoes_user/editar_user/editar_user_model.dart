import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import 'editar_user_widget.dart' show EditarUserWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class EditarUserModel extends FlutterFlowModel<EditarUserWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  Completer<List<UsuarioRow>>? requestCompleter;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for Nome_TextField widget.
  FocusNode? nomeTextFieldFocusNode;
  TextEditingController? nomeTextFieldTextController;
  String? Function(BuildContext, String?)? nomeTextFieldTextControllerValidator;
  // State field(s) for Email_TextField widget.
  FocusNode? emailTextFieldFocusNode;
  TextEditingController? emailTextFieldTextController;
  String? Function(BuildContext, String?)?
      emailTextFieldTextControllerValidator;
  // State field(s) for telefone_TextField widget.
  FocusNode? telefoneTextFieldFocusNode;
  TextEditingController? telefoneTextFieldTextController;
  final telefoneTextFieldMask = MaskTextInputFormatter(mask: '(##)#####-####');
  String? Function(BuildContext, String?)?
      telefoneTextFieldTextControllerValidator;
  // State field(s) for cnpj_TextField widget.
  FocusNode? cnpjTextFieldFocusNode;
  TextEditingController? cnpjTextFieldTextController;
  final cnpjTextFieldMask = MaskTextInputFormatter(mask: '##.###.###/####-## ');
  String? Function(BuildContext, String?)? cnpjTextFieldTextControllerValidator;
  // State field(s) for cpf_TextField widget.
  FocusNode? cpfTextFieldFocusNode;
  TextEditingController? cpfTextFieldTextController;
  final cpfTextFieldMask = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? cpfTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nomeTextFieldFocusNode?.dispose();
    nomeTextFieldTextController?.dispose();

    emailTextFieldFocusNode?.dispose();
    emailTextFieldTextController?.dispose();

    telefoneTextFieldFocusNode?.dispose();
    telefoneTextFieldTextController?.dispose();

    cnpjTextFieldFocusNode?.dispose();
    cnpjTextFieldTextController?.dispose();

    cpfTextFieldFocusNode?.dispose();
    cpfTextFieldTextController?.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
