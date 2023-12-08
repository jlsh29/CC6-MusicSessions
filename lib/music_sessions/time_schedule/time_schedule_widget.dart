import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/music_sessions/confirmation_schedule/confirmation_schedule_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'time_schedule_model.dart';
export 'time_schedule_model.dart';

class TimeScheduleWidget extends StatefulWidget {
  const TimeScheduleWidget({
    Key? key,
    required this.scheduleRef,
  }) : super(key: key);

  final DocumentReference? scheduleRef;

  @override
  _TimeScheduleWidgetState createState() => _TimeScheduleWidgetState();
}

class _TimeScheduleWidgetState extends State<TimeScheduleWidget> {
  late TimeScheduleModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimeScheduleModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return StreamBuilder<ScheduleRecord>(
      stream: ScheduleRecord.getDocument(widget.scheduleRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFFFDFBEE),
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0xFFFDFBEE),
                  ),
                ),
              ),
            ),
          );
        }
        final timeScheduleScheduleRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0xFFFDFBEE),
            appBar: AppBar(
              backgroundColor: Color(0xFFA89C70),
              automaticallyImplyLeading: false,
              leading: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed('Teachers');
                },
                child: Icon(
                  Icons.chevron_left,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  size: 40.0,
                ),
              ),
              title: Text(
                'Time Schedule',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.00, -1.00),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 40.0, 0.0, 20.0),
                            child: FlutterFlowCalendar(
                              color: Color(0xFF7C7352),
                              iconColor: Color(0xFF7C7352),
                              weekFormat: true,
                              weekStartsMonday: true,
                              initialDate: getCurrentTimestamp,
                              rowHeight: 64.0,
                              onChange: (DateTimeRange? newSelectedDate) {
                                setState(() => _model.calendarSelectedDay =
                                    newSelectedDate);
                              },
                              titleStyle:
                                  FlutterFlowTheme.of(context).headlineSmall,
                              dayOfWeekStyle:
                                  FlutterFlowTheme.of(context).labelLarge,
                              dateStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              selectedDateStyle:
                                  FlutterFlowTheme.of(context).titleSmall,
                              inactiveDateStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: StreamBuilder<List<DatabaseRecord>>(
                            stream: queryDatabaseRecord(
                              queryBuilder: (databaseRecord) =>
                                  databaseRecord.where(
                                'scheduleRef',
                                isEqualTo: widget.scheduleRef,
                              ),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Color(0xFFFDFBEE),
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<DatabaseRecord>
                                  choiceChipsDatabaseRecordList =
                                  snapshot.data!;
                              return FlutterFlowChoiceChips(
                                options: functions
                                    .getAvailableSlots(
                                        choiceChipsDatabaseRecordList
                                            .map((e) => e.scheduleTime)
                                            .withoutNulls
                                            .toList(),
                                        _model.calendarSelectedDay!.start,
                                        timeScheduleScheduleRecord.schedule
                                            .toList())!
                                    .map((e) => dateTimeFormat('Hm', e))
                                    .toList()
                                    .map((label) => ChipData(label))
                                    .toList(),
                                onChanged: (val) async {
                                  setState(() =>
                                      _model.choiceChipsValue = val?.first);
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return GestureDetector(
                                        onTap: () => _model
                                                .unfocusNode.canRequestFocus
                                            ? FocusScope.of(context)
                                                .requestFocus(
                                                    _model.unfocusNode)
                                            : FocusScope.of(context).unfocus(),
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: ConfirmationScheduleWidget(
                                            timeSelected:
                                                functions.stringtoTime(
                                                    _model.choiceChipsValue,
                                                    _model.calendarSelectedDay
                                                        ?.end)!,
                                            scheduleRef: widget.scheduleRef!,
                                            teacherRef:
                                                timeScheduleScheduleRecord
                                                    .teacherRef!,
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                selectedChipStyle: ChipStyle(
                                  backgroundColor: Color(0xFFA89C70),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                  iconColor: Color(0xFFFDFBEE),
                                  iconSize: 30.0,
                                  elevation: 4.0,
                                  borderColor: Color(0xFFF3E6B7),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                unselectedChipStyle: ChipStyle(
                                  backgroundColor: Color(0xFFF3E6B7),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                  iconColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  iconSize: 25.0,
                                  elevation: 0.0,
                                  borderColor: Color(0xFF7C7352),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                chipSpacing: 5.0,
                                rowSpacing: 30.0,
                                multiselect: false,
                                alignment: WrapAlignment.spaceEvenly,
                                controller:
                                    _model.choiceChipsValueController ??=
                                        FormFieldController<List<String>>(
                                  [],
                                ),
                                wrapped: true,
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.00, 1.00),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 30.0),
                              child: Container(
                                width: 354.0,
                                height: 56.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF7C7352),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33000000),
                                      offset: Offset(0.0, 4.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.00, 1.00),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.00, 0.00),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              FlutterFlowIconButton(
                                                borderColor: Color(0xFFA89C70),
                                                borderRadius: 20.0,
                                                borderWidth: 1.0,
                                                buttonSize: 40.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .noColor,
                                                icon: Icon(
                                                  Icons.home_filled,
                                                  color: Color(0xFFA89C70),
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  context.pushNamed('HomePage');
                                                },
                                              ),
                                              FlutterFlowIconButton(
                                                borderColor: Color(0xFFA89C70),
                                                borderRadius: 20.0,
                                                borderWidth: 1.0,
                                                buttonSize: 40.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .noColor,
                                                icon: Icon(
                                                  Icons.face,
                                                  color: Color(0xFFA89C70),
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  context
                                                      .pushNamed('ProfilePage');
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
