// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Função simples para verificar erro em uma ação
Future<bool> verificaErro() async {
  try {
    // Coloque a ação ou função assíncrona que você quer verificar
    await Future.delayed(Duration(seconds: 2)); // Exemplo de ação assíncrona
    return false; // Retorna false se a execução for bem-sucedida
  } catch (e) {
    print('Erro: $e');

    return true; // Retorna true em caso de erro
  }
}
