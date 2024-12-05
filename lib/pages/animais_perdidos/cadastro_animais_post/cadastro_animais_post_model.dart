import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'cadastro_animais_post_widget.dart' show CadastroAnimaisPostWidget;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CadastroAnimaisPostModel
    extends FlutterFlowModel<CadastroAnimaisPostWidget> {
  ///  Local state fields for this page.

  List<FFUploadedFile> fotos = [];
  void addToFotos(FFUploadedFile item) => fotos.add(item);
  void removeFromFotos(FFUploadedFile item) => fotos.remove(item);
  void removeAtIndexFromFotos(int index) => fotos.removeAt(index);
  void insertAtIndexInFotos(int index, FFUploadedFile item) =>
      fotos.insert(index, item);
  void updateFotosAtIndex(int index, Function(FFUploadedFile) updateFn) =>
      fotos[index] = updateFn(fotos[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for Descricao_TextField widget.
  FocusNode? descricaoTextFieldFocusNode;
  TextEditingController? descricaoTextFieldTextController;
  String? Function(BuildContext, String?)?
      descricaoTextFieldTextControllerValidator;
  String? _descricaoTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Obrigatório';
    }

    return null;
  }

  // State field(s) for NomeAnimal_TextField widget.
  FocusNode? nomeAnimalTextFieldFocusNode;
  TextEditingController? nomeAnimalTextFieldTextController;
  String? Function(BuildContext, String?)?
      nomeAnimalTextFieldTextControllerValidator;
  // State field(s) for DropDownEstado widget.
  String? dropDownEstadoValue;
  FormFieldController<String>? dropDownEstadoValueController;
  // State field(s) for Cidade_TextField widget.
  FocusNode? cidadeTextFieldFocusNode;
  TextEditingController? cidadeTextFieldTextController;
  String? Function(BuildContext, String?)?
      cidadeTextFieldTextControllerValidator;
  String? _cidadeTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  Completer<List<VwCidadesEstadosRow>>? requestCompleter;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue;
  bool isDataUploading2 = false;
  List<FFUploadedFile> uploadedLocalFiles2 = [];
  List<String> uploadedFileUrls2 = [];

  @override
  void initState(BuildContext context) {
    descricaoTextFieldTextControllerValidator =
        _descricaoTextFieldTextControllerValidator;
    cidadeTextFieldTextControllerValidator =
        _cidadeTextFieldTextControllerValidator;
  }

  @override
  void dispose() {
    descricaoTextFieldFocusNode?.dispose();
    descricaoTextFieldTextController?.dispose();

    nomeAnimalTextFieldFocusNode?.dispose();
    nomeAnimalTextFieldTextController?.dispose();

    cidadeTextFieldFocusNode?.dispose();
    cidadeTextFieldTextController?.dispose();
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
