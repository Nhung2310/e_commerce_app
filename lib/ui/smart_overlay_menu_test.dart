import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_overlay_menu/smart_overlay_menu.dart';

class SmartOverlayMenuTest extends StatefulWidget {
  const SmartOverlayMenuTest({super.key});

  @override
  State<SmartOverlayMenuTest> createState() => _SmartOverlayMenuTestState();
}

class _SmartOverlayMenuTestState extends State<SmartOverlayMenuTest> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test')),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0, right: 16.0),
              child: Builder(
                builder: (context) => SmartOverlayMenu(
                  openWithTap: true,
                  scaleDownWhenTooLarge: false,
                  topWidgetAlignment: Alignment.topRight,
                  bottomWidgetAlignment: Alignment.bottomRight,
                  repositionAnimationCurve: Curves.easeInOut,
                  repositionAnimationDuration: const Duration(
                    milliseconds: 200,
                  ),
                  duration: const Duration(milliseconds: 300),
                  pressFeedbackScale: 0.99,
                  blurSize: 2.0,
                  screenPadding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom,
                  ),

                  onClosed: () {},
                  topWidget: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.favorite, color: Colors.red, size: 24),
                        SizedBox(width: 8),
                        Text('👀😍🥺', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                  bottomWidget: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(16.0), // Giảm padding
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.paste),
                            SizedBox(width: 8),
                            Text('Copy message text'),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.delete, color: Colors.red),
                            SizedBox(width: 8),
                            Text(
                              'Delete for me',
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      border: Border.all(
                        color: Colors.black.withOpacity(0.1),
                        width: 1,
                      ),
                    ),
                    child: const Text(
                      'This widget is too tall!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
