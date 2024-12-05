import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'add_membros_componentes_widget.dart' show AddMembrosComponentesWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddMembrosComponentesModel
    extends FlutterFlowModel<AddMembrosComponentesWidget> {
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
  // State field(s) for BuscarUsuario widget.
  FocusNode? buscarUsuarioFocusNode;
  TextEditingController? buscarUsuarioTextController;
  String? Function(BuildContext, String?)? buscarUsuarioTextControllerValidator;
  // Stores action output result for [Backend Call - API (AddMembros)] action in BuscarUsuario widget.
  ApiCallResponse? apiResultyu9;
  // State field(s) for Checkbox widget.
  Map<dynamic, bool> checkboxValueMap = {};
  List<dynamic> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    buscarUsuarioFocusNode?.dispose();
    buscarUsuarioTextController?.dispose();
  }
}
