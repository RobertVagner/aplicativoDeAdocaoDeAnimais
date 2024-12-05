import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import 'editar_animal_widget.dart' show EditarAnimalWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class EditarAnimalModel extends FlutterFlowModel<EditarAnimalWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  Completer<List<AnimalRow>>? requestCompleter;
  // State field(s) for Nome_TextField widget.
  FocusNode? nomeTextFieldFocusNode;
  TextEditingController? nomeTextFieldTextController;
  String? Function(BuildContext, String?)? nomeTextFieldTextControllerValidator;
  // State field(s) for Data_TextField widget.
  FocusNode? dataTextFieldFocusNode;
  TextEditingController? dataTextFieldTextController;
  final dataTextFieldMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? dataTextFieldTextControllerValidator;
  // State field(s) for Cor_TextField widget.
  FocusNode? corTextFieldFocusNode;
  TextEditingController? corTextFieldTextController;
  String? Function(BuildContext, String?)? corTextFieldTextControllerValidator;
  // State field(s) for Raca_TextField widget.
  FocusNode? racaTextFieldFocusNode;
  TextEditingController? racaTextFieldTextController;
  String? Function(BuildContext, String?)? racaTextFieldTextControllerValidator;
  // State field(s) for Genero_TextField widget.
  FocusNode? generoTextFieldFocusNode;
  TextEditingController? generoTextFieldTextController;
  String? Function(BuildContext, String?)?
      generoTextFieldTextControllerValidator;
  // State field(s) for Tipo_TextField widget.
  FocusNode? tipoTextFieldFocusNode;
  TextEditingController? tipoTextFieldTextController;
  String? Function(BuildContext, String?)? tipoTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nomeTextFieldFocusNode?.dispose();
    nomeTextFieldTextController?.dispose();

    dataTextFieldFocusNode?.dispose();
    dataTextFieldTextController?.dispose();

    corTextFieldFocusNode?.dispose();
    corTextFieldTextController?.dispose();

    racaTextFieldFocusNode?.dispose();
    racaTextFieldTextController?.dispose();

    generoTextFieldFocusNode?.dispose();
    generoTextFieldTextController?.dispose();

    tipoTextFieldFocusNode?.dispose();
    tipoTextFieldTextController?.dispose();
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
