import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'teacher_avaialbility_widget.dart' show TeacherAvaialbilityWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TeacherAvaialbilityModel
    extends FlutterFlowModel<TeacherAvaialbilityWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for instrument widget.
  FocusNode? instrumentFocusNode;
  TextEditingController? instrumentController;
  String? Function(BuildContext, String?)? instrumentControllerValidator;
  // State field(s) for teacherName widget.
  FocusNode? teacherNameFocusNode;
  TextEditingController? teacherNameController;
  String? Function(BuildContext, String?)? teacherNameControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ScheduleRecord? teacherOutput;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    instrumentFocusNode?.dispose();
    instrumentController?.dispose();

    teacherNameFocusNode?.dispose();
    teacherNameController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
