import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  TextEditingController destinationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      cupertino: (_, __) => CupertinoPageScaffoldData(
        navigationBar: CupertinoNavigationBar(
          middle: Text('maps'),
        ),
        body: Card(
          elevation: 0,
          margin: EdgeInsets.zero,
          child: Column(
            children: [
              Expanded(
                child: destinationController.text.isEmpty
                    ? Container(
                        color: Colors.blue,
                        child: Center(
                          child: Text('maps'),
                        ),
                      )
                    : Container(
                        color: Colors.green,
                        child: Center(
                          child: Text('search'),
                        ),
                      ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 10,
                  ),
                  child: Column(
                    children: [
                      CupertinoTextField(
                        padding: EdgeInsets.all(15),
                        placeholder: 'Enter Destination',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
