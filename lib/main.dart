import 'package:flutter/material.dart';

import 'nyl_tooltip.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = 'Temporary Coverage';
  String subTitle =
      'For specific details about this coverage, please contact your agent'
      'For specific details about this coverage, please contact your agent'
      'For specific details about this coverage, please contact your agent'
      'For specific details about this coverage, please contact your agent'
      'For specific details about this coverage, please contact your agent'
      'For specific details about this coverage, please contact your agent';
  ScrollController controller = ScrollController();
  NYLTooltip? toolTipVar;


  @override
  Widget build(BuildContext context) {
    final screenWidth  = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
        child: GestureDetector(
          onPanUpdate: (details) {
            print('Global position: ${details.globalPosition}');
            print('Local position: ${details.localPosition}');
            if (details.globalPosition.dy < screenHeight / 2) {
              if (details.globalPosition.dx < screenWidth / 2) {
                print('left side of screen');
              } else {
                print('right side of screen');
              }
            } else {
              if (details.globalPosition.dx < screenWidth / 2) {
                print('bottom left side of screen');
              } else {
                print('bottom right side of screen');
              }
            }
          },
          child: Scaffold(
              backgroundColor: Colors.grey.shade200,
              body: SingleChildScrollView(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (val) {
                    print(controller.position.pixels);
                    if (controller.position.pixels ==
                        controller.position.minScrollExtent) {
                      toolTipVar!.toolTipState?.hideOverlay();
                    }
                    return true;
                  },
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildNYLToolTip(context, longTailPosition: 'Left'),
                          buildNYLToolTip(context),
                          buildNYLToolTip(context, longTailPosition: 'Right'),
                        ],
                      ),
                      Tooltip(message: 'Data', child: Icon(Icons.dangerous)),
                      Text.rich(TextSpan(children: [
                        const TextSpan(
                            text:
                                'Contracts issued in any of these states will continue to receive premium notices by U.S Mail '
                                'Contracts issued in any of these states will continue to receive premium notices by U.S Mail                       '
                                '                                          able                     '
                                '                                              to                 '
                                '                                                  received          tomorrow    at         '
                                '                                                 10                  '
                                '                                                 10 ONE'),
                        WidgetSpan(
                            child: buildNYLToolTip(context, longTailPosition: 'Left'))
                      ])),

                      SizedBox(height: 80),
                      Text.rich(TextSpan(children: [
                        const TextSpan(
                            text:
                                'Contracts issued in any of these states will continue to receive premium notices by U.S Mail '
                                'Contracts issued in any of these states will continue to receive premium notices by U.S Mail                      '
                                '                                          able                     '
                                '                                              to                 '
                                '                                                                received          tomorrow    at         '
                                '      10                                                                               '
                                '      10           TWO         '),
                        WidgetSpan(
                            child: buildNYLToolTip(context, longTailPosition: 'Left'))
                      ])),

                      SizedBox(height: 100),
                      Text.rich(TextSpan(children: [
                        const TextSpan(
                            text:
                                'Contracts issued in any of these states will continue to receive premium notices by U.S Mail '
                                'Contracts issued in any of these states will continue to receive premium notices by U.S Mail                      '
                                '                                          able                     '
                                '                                              to                 '
                                '                                                  received          tomorrow    at         '
                                '      10                                               '),
                        WidgetSpan(
                            child: buildNYLToolTip(context, longTailPosition: 'Left'))
                      ])),

                      SizedBox(height: 50),
                      Text.rich(TextSpan(children: [
                        const TextSpan(
                            text:
                                'Contracts issued in any of these states will continue to receive premium notices by U.S Mail '
                                'Contracts issued in any of these states will continue to receive premium notices by U.S Mail                      '
                                '                                          able                     '
                                '                                              to                 '
                                '                                                  received          tomorrow    at         '
                                '      10     '),
                        WidgetSpan(
                            child: buildNYLToolTip(context))
                      ])),

                      SizedBox(height: 50),
                      Text.rich(TextSpan(children: [
                         TextSpan(
                          onEnter: (val) {
                            print(val);
                          },
                            text:
                                'Contracts issued in any of these states will continue to receive premium notices by U.S Mail '
                                'Contracts issued in any of these states will continue to receive premium notices by U.S Mail                      '
                                '                                          able                     '
                                '                                              to                 '
                                '                                                  received          tomorrow    at         '
                                '      10                           '
                                '      10             '
                                '      10             '
                                '      10      '
                                '      10   '),
                        WidgetSpan(
                            child: buildNYLToolTip(context, longTailPosition: 'Left'))
                      ])),

                      SizedBox(height: 50),
                      Text.rich(TextSpan(children: [
                        const TextSpan(
                            text:
                                'Contracts issued in any of these states will continue to receive premium notices by U.S Mail '
                                'Contracts issued in any of these states will continue to receive premium notices by U.S Mail                      '
                                '                                          able                     '
                                '                                              to                 '
                                '                                                  received          tomorrow    at         '
                                '      10                           '
                                '      10             '
                                '      10             '
                                '      10             '
                                '      10             '
                                '      10         '
                                '      10     '),
                        WidgetSpan(
                            child: buildNYLToolTip(context, longTailPosition: 'Right'))
                      ])),

                      SizedBox(height: 50),
                      Text.rich(TextSpan(children: [
                        const TextSpan(
                            text:
                            'Contracts issued in any of these states will continue to receive premium notices by U.S Mail '
                                'Contracts issued in any of these states will continue to receive premium notices by U.S Mail                      '
                                '                                          able                     '
                                '                                              to                 '
                                '                                                  received          tomorrow    at         '
                                '      10                           '
                                '      10             '
                                '      10  '
                                '      10  '
                                '      10             '
                                '      10             '
                                '      10             '
                                '      10     '),
                        WidgetSpan(
                            child: buildNYLToolTip(context, longTailPosition: 'Left'))
                      ])),
                      SizedBox(height: 50),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildNYLToolTip(context, longTailPosition: 'Left'),
                          buildNYLToolTip(context),
                          buildNYLToolTip(context, longTailPosition: 'Right'),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
    ));
  }

  buildInfo(context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: buildNYLToolTip(context,longTailPosition: "Left"),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 180.0),
                child: buildNYLToolTip(context,longTailPosition: "Right"),
              ),  
              buildNYLToolTip(context,
                  position: NYLTooltipPosition.bottomEnd,
                  longTailPosition: 'Right'),

            ],
          ),
        ),
        const SizedBox(height: 200),
      ],
    );
  }


  Widget buildNYLToolTip(context,{position, longTailPosition}) {

    return toolTipVar =  NYLTooltip(
      distance: 30,
      longTailPosition: longTailPosition ?? 'Center',
      position: position ?? NYLTooltipPosition.bottomStart,
      content: IntrinsicHeight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(subTitle),
            const SizedBox(height: 10),
            Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: () {
                      toolTipVar!.toolTipState?.hideOverlay();
                    },
                    child: const Text('Got it',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue)))),
          ],
        ),
      ),
      child: const Icon(Icons.info),
    );
  }
}