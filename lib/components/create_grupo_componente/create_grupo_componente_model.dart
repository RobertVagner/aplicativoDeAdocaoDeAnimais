import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'create_grupo_componente_widget.dart' show CreateGrupoComponenteWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateGrupoComponenteModel
    extends FlutterFlowModel<CreateGrupoComponenteWidget> {
  ///  Local state fields for this component.

  List<dynamic> apiResultado = [];
  void addToApiResultado(dynamic item) => apiResultado.add(item);
  void removeFromApiResultado(dynamic item) => apiResultado.remove(item);
  void removeAtIndexFromApiResultado(int index) => apiResultado.removeAt(index);
  void insertAtIndexInApiResultado(int index, dynamic item) =>
      apiResultado.insert(index, item);
  void updateApiResultadoAtIndex(int index, Function(dynamic) updateFn) =>
      apiResultado[index] = updateFn(apiResultado[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for NomeDoGrupo widget.
  FocusNode? nomeDoGrupoFocusNode;
  TextEditingController? nomeDoGrupoTextController;
  String? Function(BuildContext, String?)? nomeDoGrupoTextControllerValidator;
  String? _nomeDoGrupoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for DescricaoDoGrupo widget.
  FocusNode? descricaoDoGrupoFocusNode;
  TextEditingController? descricaoDoGrupoTextController;
  String? Function(BuildContext, String?)?
      descricaoDoGrupoTextControllerValidator;
  String? _descricaoDoGrupoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for BuscarUsuario widget.
  FocusNode? buscarUsuarioFocusNode;
  TextEditingController? buscarUsuarioTextController;
  String? Function(BuildContext, String?)? buscarUsuarioTextControllerValidator;
  // Stores action output result for [Backend Call - API (buscarUsuarios)] action in BuscarUsuario widget.
  ApiCallResponse? apiResultyu9;
  // State field(s) for Checkbox widget.
  Map<dynamic, bool> checkboxValueMap = {};
  List<dynamic> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  @override
  void initState(BuildContext context) {
    nomeDoGrupoTextControllerValidator = _nomeDoGrupoTextControllerValidator;
    descricaoDoGrupoTextControllerValidator =
        _descricaoDoGrupoTextControllerValidator;
  }

  @override
  void dispose() {
    nomeDoGrupoFocusNode?.dispose();
    nomeDoGrupoTextController?.dispose();

    descricaoDoGrupoFocusNode?.dispose();
    descricaoDoGrupoTextController?.dispose();

    buscarUsuarioFocusNode?.dispose();
    buscarUsuarioTextController?.dispose();
  }
}
