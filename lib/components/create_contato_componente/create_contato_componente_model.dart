import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import 'create_contato_componente_widget.dart'
    show CreateContatoComponenteWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateContatoComponenteModel
    extends FlutterFlowModel<CreateContatoComponenteWidget> {
  ///  Local state fields for this component.

  List<dynamic> apiResultado = [];
  void addToApiResultado(dynamic item) => apiResultado.add(item);
  void removeFromApiResultado(dynamic item) => apiResultado.remove(item);
  void removeAtIndexFromApiResultado(int index) => apiResultado.removeAt(index);
  void insertAtIndexInApiResultado(int index, dynamic item) =>
      apiResultado.insert(index, item);
  void updateApiResultadoAtIndex(int index, Function(dynamic) updateFn) =>
      apiResultado[index] = updateFn(apiResultado[index]);

  String? selecionarId;

  dynamic selecionarUserData;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for nomeConversa widget.
  FocusNode? nomeConversaFocusNode;
  TextEditingController? nomeConversaTextController;
  String? Function(BuildContext, String?)? nomeConversaTextControllerValidator;
  // State field(s) for BuscarUsuario widget.
  FocusNode? buscarUsuarioFocusNode;
  TextEditingController? buscarUsuarioTextController;
  String? Function(BuildContext, String?)? buscarUsuarioTextControllerValidator;
  // Stores action output result for [Backend Call - API (buscarUsuarios)] action in BuscarUsuario widget.
  ApiCallResponse? apiResultyu9;
  // Stores action output result for [Custom Action - verificaErro] action in NovoContato widget.
  bool? verificacao;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nomeConversaFocusNode?.dispose();
    nomeConversaTextController?.dispose();

    buscarUsuarioFocusNode?.dispose();
    buscarUsuarioTextController?.dispose();
  }
}
