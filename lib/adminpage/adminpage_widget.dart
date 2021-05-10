import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminpageWidget extends StatefulWidget {
  AdminpageWidget({Key key}) : super(key: key);

  @override
  _AdminpageWidgetState createState() => _AdminpageWidgetState();
}

class _AdminpageWidgetState extends State<AdminpageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
    );
  }
}
