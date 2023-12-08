import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DatabaseRecord extends FirestoreRecord {
  DatabaseRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "scheduleRef" field.
  DocumentReference? _scheduleRef;
  DocumentReference? get scheduleRef => _scheduleRef;
  bool hasScheduleRef() => _scheduleRef != null;

  // "scheduleTime" field.
  DateTime? _scheduleTime;
  DateTime? get scheduleTime => _scheduleTime;
  bool hasScheduleTime() => _scheduleTime != null;

  // "studentRef" field.
  DocumentReference? _studentRef;
  DocumentReference? get studentRef => _studentRef;
  bool hasStudentRef() => _studentRef != null;

  // "teacherRef" field.
  DocumentReference? _teacherRef;
  DocumentReference? get teacherRef => _teacherRef;
  bool hasTeacherRef() => _teacherRef != null;

  void _initializeFields() {
    _scheduleRef = snapshotData['scheduleRef'] as DocumentReference?;
    _scheduleTime = snapshotData['scheduleTime'] as DateTime?;
    _studentRef = snapshotData['studentRef'] as DocumentReference?;
    _teacherRef = snapshotData['teacherRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('database');

  static Stream<DatabaseRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DatabaseRecord.fromSnapshot(s));

  static Future<DatabaseRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DatabaseRecord.fromSnapshot(s));

  static DatabaseRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DatabaseRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DatabaseRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DatabaseRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DatabaseRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DatabaseRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDatabaseRecordData({
  DocumentReference? scheduleRef,
  DateTime? scheduleTime,
  DocumentReference? studentRef,
  DocumentReference? teacherRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'scheduleRef': scheduleRef,
      'scheduleTime': scheduleTime,
      'studentRef': studentRef,
      'teacherRef': teacherRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class DatabaseRecordDocumentEquality implements Equality<DatabaseRecord> {
  const DatabaseRecordDocumentEquality();

  @override
  bool equals(DatabaseRecord? e1, DatabaseRecord? e2) {
    return e1?.scheduleRef == e2?.scheduleRef &&
        e1?.scheduleTime == e2?.scheduleTime &&
        e1?.studentRef == e2?.studentRef &&
        e1?.teacherRef == e2?.teacherRef;
  }

  @override
  int hash(DatabaseRecord? e) => const ListEquality()
      .hash([e?.scheduleRef, e?.scheduleTime, e?.studentRef, e?.teacherRef]);

  @override
  bool isValidKey(Object? o) => o is DatabaseRecord;
}
