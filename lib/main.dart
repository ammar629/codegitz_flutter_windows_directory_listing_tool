import 'package:flutter/material.dart';
import 'util/drive_tool.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(child: DriveDisplayWidget()),
      ),
    );
  }
}

class DriveDisplayWidget extends StatefulWidget {
  const DriveDisplayWidget({
    super.key,
  });

  @override
  State<DriveDisplayWidget> createState() => _DriveDisplayWidgetState();
}

class _DriveDisplayWidgetState extends State<DriveDisplayWidget> {
  late List<String> driveList = [];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () => _fetchDriveList(),
              child: const Text("Fetch Drive List")),
          Column(
            children: List.generate(
              driveList.length,
              (index) => Text(driveList[index]),
            ),
          )
        ],
      ),
    );
  }

  void _fetchDriveList() {
    DriveTool.getDriveList().then((value) => setState(() {
          driveList = value;
        }));
  }
}
