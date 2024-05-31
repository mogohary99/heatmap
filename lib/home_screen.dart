import 'package:first/app_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'custom_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int segmentedControlGroupValue = 0;
  final Map<int, Widget> myTabs = const <int, Widget>{
    0: Text("With Container"),
    1: Text("With RenderObject")
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Heatmap'),
      ),
      body: Column(
        children: [
          CupertinoSlidingSegmentedControl(
              groupValue: segmentedControlGroupValue,
              children: myTabs,
              onValueChanged: (x) {
                setState(() {
                  segmentedControlGroupValue = x!;
                });
              }),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              shrinkWrap: true,
              itemBuilder: (context, i) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context)
                            .colorScheme
                            .shadow
                            .withOpacity(0.15),
                        blurRadius: 5,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconCard(
                            icon: '',
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              'Playing',
                              style: Theme.of(context).textTheme.titleMedium,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      MyCustomHeatmap(
                        size: 11,
                        segmentedControlGroupValue: segmentedControlGroupValue,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MyCustomHeatmap extends StatelessWidget {
  final double? size;
  final double margin;
  final int segmentedControlGroupValue;

  const MyCustomHeatmap({
    super.key,
    this.size,
    this.margin = 2,
    required this.segmentedControlGroupValue,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (margin + (size ?? 12)) * 7,
      child: SingleChildScrollView(
        reverse: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Wrap(
          spacing: margin,
          runSpacing: margin,
          direction: Axis.vertical,
          children: [
            ...AppData.datasets().entries.map(
                  (e) => segmentedControlGroupValue == 0
                      ? ContainerBox(day: e.key.day)
                      : CustomBox(
                          width: size ?? 12,
                          height: size ?? 12,
                          color: Colors.red,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(3),
                          ),
                        ),
                ),
          ],
        ),
      ),
    );
  }
}

class ContainerBox extends StatelessWidget {
  final int day;

  const ContainerBox({
    super.key,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 12,
        width: 12,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(3)),
          color: Colors.red,
        ),
      ),
    );
  }
}

class IconCard extends StatelessWidget {
  final String icon;
  final double? size;
  final Color? color;

  const IconCard({
    super.key,
    required this.icon,
    this.size,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          Icons.accessibility_sharp,
          size: size ?? 35,
          // height: size ?? 40,
        ),
      ),
    );
  }
}
