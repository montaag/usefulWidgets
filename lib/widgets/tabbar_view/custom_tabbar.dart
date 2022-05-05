import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:usefull_widgets/config/theme.dart';

class CustomTabbar extends StatefulWidget {
  const CustomTabbar({Key? key}) : super(key: key);

  @override
  _CustomTabbarState createState() => _CustomTabbarState();
}

class _CustomTabbarState extends State<CustomTabbar> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    setState(() {
      tabController = TabController(length: 3, vsync: this);
    });
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [
      "Lorem Ipsum",
      "Another Ipsum",
      "Other",
    ];
    const title = "Title";

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Container(
            width: 0,
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(color: Colors.grey.shade300),
              )),
              width: MediaQuery.of(context).size.width,
              height: kToolbarHeight * 1.5 + 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          title,
                          style: CustomTheme.title(context),
                        ),
                      ],
                    ),
                  ),
                  TabBar(
                    controller: tabController,
                    indicatorPadding: const EdgeInsets.only(left: 15, right: 5),
                    isScrollable: true,
                    labelPadding: const EdgeInsets.only(left: 10, top: 12),
                    labelColor: Colors.black,
                    indicator:
                        MaterialIndicator(topLeftRadius: 0, topRightRadius: 0, bottomLeftRadius: 5, bottomRightRadius: 5, color: Colors.orange),
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      for (final tab in tabs)
                        Tab(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              tab,
                              style: const TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            Scaffold(
              body: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Go Back"),
                ),
              ),
            ),
            Container(),
            Container(),
          ],
        ),
      ),
    );
    // },
    // );
    //     },
    //   ),
    // );
  }
}
