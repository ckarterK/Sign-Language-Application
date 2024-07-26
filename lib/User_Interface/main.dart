import 'package:camera_application/User_Interface/dropDownUI.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../camera_view.dart';
// Import your VideoTextSignLanguageWidget

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Language Translator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Readex Pro',
      ),debugShowCheckedModeBanner: false,
      home: const HomePage(), // Set HomePage as the initial route
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: 743.5,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 150.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          'SignSpeak',
                          style: GoogleFonts.readexPro(
                            textStyle: const TextStyle(
                              fontSize: 64.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.0,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Text(
                          'Bridging Conversations Beyond Words',
                          style: TextStyle(
                            fontSize: 19.0,
                            letterSpacing: 0.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),  DropDownContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
