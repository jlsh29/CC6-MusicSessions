import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'payment_record_beginner_widget.dart' show PaymentRecordBeginnerWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaymentRecordBeginnerModel
    extends FlutterFlowModel<PaymentRecordBeginnerWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for number widget.
  FocusNode? numberFocusNode1;
  TextEditingController? numberController1;
  String? Function(BuildContext, String?)? numberController1Validator;
  // State field(s) for number widget.
  FocusNode? numberFocusNode2;
  TextEditingController? numberController2;
  String? Function(BuildContext, String?)? numberController2Validator;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  // State field(s) for number widget.
  FocusNode? numberFocusNode3;
  TextEditingController? numberController3;
  String? Function(BuildContext, String?)? numberController3Validator;
  // State field(s) for adress widget.
  FocusNode? adressFocusNode;
  TextEditingController? adressController;
  String? Function(BuildContext, String?)? adressControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in ButtonPrimary widget.
  BeginnerRecord? beginner;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    numberFocusNode1?.dispose();
    numberController1?.dispose();

    numberFocusNode2?.dispose();
    numberController2?.dispose();

    nameFocusNode?.dispose();
    nameController?.dispose();

    numberFocusNode3?.dispose();
    numberController3?.dispose();

    adressFocusNode?.dispose();
    adressController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
