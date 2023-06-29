// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:cnahr/screens/screens.dart';
import 'package:cnahr/widgets/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class RoomBooking extends StatefulWidget {
  RoomBooking({super.key});

  @override
  State<RoomBooking> createState() => _RoomBookingState();
}

class _RoomBookingState extends State<RoomBooking> {
  bool isAccept = false;

  bool showError = false;

  double value = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    value = 0;
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      cupertino: (_, __) => CupertinoPageScaffoldData(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Preview your room for booking'),
        ),
        body: Card(
          margin: const EdgeInsets.all(0),
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PreviewText(
                    title: 'Name',
                    subtitle: 'subtitle',
                  ),
                  PreviewText(
                    title: 'City',
                    subtitle: 'subtitle',
                  ),
                  PreviewText(
                    title: 'School',
                    subtitle: 'subtitle',
                  ),
                  PreviewText(
                    title: 'Hostel',
                    subtitle: 'subtitle',
                  ),
                  PreviewText(
                    title: 'Room name',
                    subtitle: 'subtitle',
                  ),
                  PreviewText(
                    title: 'Number in a room',
                    subtitle: 'subtitle',
                  ),
                  PreviewText(
                    title: 'Has inner kitchen',
                    subtitle: 'subtitle',
                  ),
                  PreviewText(
                    title: 'Has inner bathroom',
                    subtitle: 'subtitle',
                  ),
                  PreviewText(
                    title: 'Room size',
                    subtitle: 'subtitle',
                  ),
                  PreviewText(
                    title: 'Room availability',
                    subtitle: 'subtitle',
                  ),
                  PreviewText(
                    title: 'Cost',
                    subtitle: 'subtitle',
                  ),
                  Expanded(child: SizedBox()),
                  CustomSliderWidget(
                    booked: () async {
                      return await comfirmPickUp(context);
                    },
                    value: value,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> comfirmPickUp(BuildContext context) {
    return showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return CupertinoAlertDialog(
            title: const Text(
              "Order confirmation",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            content: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.2,
                  // color: Colors.amber,
                  child: const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Libero, molestiae quo illum sapiente saepe cupiditate id velit mollitia, numquam architecto eligendi odio. Nihil asperiores perspiciatis nostrum assumenda ratione iste architecto.,",
                    textAlign: TextAlign.left,
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 19,
                    ),
                  ),
                ),
                Card(
                  shadowColor: Colors.transparent,
                  color: Colors.white70,
                  child: CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const SizedBox(
                      height: 40,
                      width: 50,
                      child: Text(
                        "Accept our terms and conditions",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    value: isAccept,
                    onChanged: (checked) {
                      // print(isAccept.toString());
                      setState(() {
                        isAccept = !isAccept;
                      });
                    },
                  ),
                ),
                showError == true
                    ? const Text(
                        'You must accept our terms and conditions to proceed',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                        ),
                      )
                    : Container(),
              ],
            ),
            actions: [
              CupertinoDialogAction(
                isDestructiveAction: true,
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    value = 0;
                  });
                },
                child: const Text("close"),
              ),
              CupertinoDialogAction(
                isDestructiveAction: false,
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacement(
                    CupertinoPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
                child: const Text("Confirm"),
              ),
            ],
          );
        });
      },
    );
  }
}
