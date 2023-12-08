import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BeginnerRecord extends FirestoreRecord {
  BeginnerRecord._(
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
      FirebaseFirestore.instance.collection('beginner');

  static Stream<BeginnerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BeginnerRecord.fromSnapshot(s));

  static Future<BeginnerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BeginnerRecord.fromSnapshot(s));

  static BeginnerRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BeginnerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BeginnerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BeginnerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BeginnerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BeginnerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBeginnerRecordData({
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

class BeginnerRecordDocumentEquality implements Equality<BeginnerRecord> {
  const BeginnerRecordDocumentEquality();

  @override
  bool equals(BeginnerRecord? e1, BeginnerRecord? e2) {
    return e1?.amount == e2?.amount &&
        e1?.accountName == e2?.accountName &&
        e1?.referenceNum == e2?.referenceNum &&
        e1?.gcashVisa == e2?.gcashVisa &&
        e1?.accountNumber == e2?.accountNumber &&
        e1?.studentRef == e2?.studentRef;
  }

  @override
  int hash(BeginnerRecord? e) => const ListEquality().hash([
        e?.amount,
        e?.accountName,
        e?.referenceNum,
        e?.gcashVisa,
        e?.accountNumber,
        e?.studentRef
      ]);

  @override
  bool isValidKey(Object? o) => o is BeginnerRecord;
}
