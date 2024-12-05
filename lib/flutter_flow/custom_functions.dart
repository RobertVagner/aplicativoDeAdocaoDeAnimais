import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

List<String> updateChatMembersUid(
  List<String> currentMembersUid,
  String userId,
) {
  currentMembersUid.remove(userId);
  return currentMembersUid;
}

String recebeCidade(String cidade) {
  if (cidade.isEmpty) {
    return ''; // Retorna uma string vazia ao invés de null
  }

  // Converte as palavras para maiúsculas, exceto as de exceção
  return cidade
      .split(' ') // Divide a string em palavras
      .map((palavra) {
    if (palavra.isEmpty) {
      return ''; // Garante que palavras vazias resultem em uma string vazia
    }

    // Caso contrário, converte toda a palavra para maiúscula
    return palavra.toUpperCase();
  }).join(' '); // Junta as palavras novamente em uma string
}
