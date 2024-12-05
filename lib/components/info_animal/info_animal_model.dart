import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'info_animal_widget.dart' show InfoAnimalWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InfoAnimalModel extends FlutterFlowModel<InfoAnimalWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for editarTipo widget.
  FocusNode? editarTipoFocusNode;
  TextEditingController? editarTipoTextController;
  String? Function(BuildContext, String?)? editarTipoTextControllerValidator;
  // State field(s) for editarRaca widget.
  FocusNode? editarRacaFocusNode;
  TextEditingController? editarRacaTextController;
  String? Function(BuildContext, String?)? editarRacaTextControllerValidator;
  // State field(s) for editarDataNasc widget.
  FocusNode? editarDataNascFocusNode;
  TextEditingController? editarDataNascTextController;
  String? Function(BuildContext, String?)?
      editarDataNascTextControllerValidator;
  // State field(s) for editarCor widget.
  FocusNode? editarCorFocusNode;
  TextEditingController? editarCorTextController;
  String? Function(BuildContext, String?)? editarCorTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    editarTipoFocusNode?.dispose();
    editarTipoTextController?.dispose();

    editarRacaFocusNode?.dispose();
    editarRacaTextController?.dispose();

    editarDataNascFocusNode?.dispose();
    editarDataNascTextController?.dispose();

    editarCorFocusNode?.dispose();
    editarCorTextController?.dispose();
  }
}
