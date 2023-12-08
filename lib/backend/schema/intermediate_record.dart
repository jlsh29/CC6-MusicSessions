import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IntermediateRecord extends FirestoreRecord {
  IntermediateRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Amount" field.
  int? _amount;
  int get amount => _amount ?? 0;
  bool hasAmount() => _amount != null;

  // "AccountName" field.
  String? _accountName;
  String get accountName => _accountName ?? '';
  bool hasAccountName() => _accountName != null;

  // "ReferenceNum" field.
  String? _referenceNum;
  String get referenceNum => _referenceNum ?? '';
  bool hasReferenceNum() => _referenceNum != null;

  // "GcashVisa" field.
  String? _gcashVisa;
  String get gcashVisa => _gcashVisa ?? '';
  bool hasGcashVisa() => _gcashVisa != null;

  // "AccountNumber" field.
  int? _accountNumber;
  int get accountNumber => _accountNumber ?? 0;
  bool hasAccountNumber() => _accountNumber != null;

  // "studentRef" field.
  DocumentReference? _studentRef;
  DocumentReference? get studentRef => _studentRef;
  bool hasStudentRef() => _studentRef != null;

  void _initializeFields() {
    _amount = castToType<int>(snapshotData['Amount']);
    _accountName = snapshotData['AccountName'] as String?;
    _referenceNum = snapshotData['ReferenceNum'] as String?;
    _gcashVisa = snapshotData['GcashVisa'] as String?;
    _accountNumber = castToType<int>(snapshotData['AccountNumber']);
    _studentRef = snapshotData['studentRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('intermediate');

  static Stream<IntermediateRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IntermediateRecord.fromSnapshot(s));

  static Future<IntermediateRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => IntermediateRecord.fromSnapshot(s));

  static IntermediateRecord fromSnapshot(DocumentSnapshot snapshot) =>
      IntermediateRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IntermediateRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IntermediateRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IntermediateRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IntermediateRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIntermediateRecordData({
  int? amount,
  String? accountName,
  String? referenceNum,
  String? gcashVisa,
  int? accountNumber,
  DocumentReference? studentRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Amount': amount,
      'AccountName': accountName,
      'ReferenceNum': referenceNum,
      'GcashVisa': gcashVisa,
      'AccountNumber': accountNumber,
      'studentRef': studentRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class IntermediateRecordDocumentEquality
    implements Equality<IntermediateRecord> {
  const IntermediateRecordDocumentEquality();

  @override
  bool equals(IntermediateRecord? e1, IntermediateRecord? e2) {
    return e1?.amount == e2?.amount &&
        e1?.accountName == e2?.accountName &&
        e1?.referenceNum == e2?.referenceNum &&
        e1?.gcashVisa == e2?.gcashVisa &&
        e1?.accountNumber == e2?.accountNumber &&
        e1?.studentRef == e2?.studentRef;
  }

  @override
  int hash(IntermediateRecord? e) => const ListEquality().hash([
        e?.amount,
        e?.accountName,
        e?.referenceNum,
        e?.gcashVisa,
        e?.accountNumber,
        e?.studentRef
      ]);

  @override
  bool isValidKey(Object? o) => o is IntermediateRecord;
}
