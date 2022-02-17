import 'package:admin/controllers/MenuController.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/components/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import '../../constants.dart';
import 'components/header.dart';
import 'components/my_fiels.dart';
import 'components/recent_files.dart';
import 'components/storage_details.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                // flex: 1, (default)
                child: SideMenu(),
              ),
            Expanded(
              flex: 5,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(defaultPadding),
                child: Column(
                  children: [
                    Header(),
                    SizedBox(height: defaultPadding),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Column(
                            children: [
                              MyFiels(),
                              SizedBox(height: defaultPadding),
                              RecentFiles(),
                              if (Responsive.isMobile(context))
                                SizedBox(height: defaultPadding),
                              if (Responsive.isMobile(context))
                                // Sorry for wrong spelling
                                StarageDetails(),
                            ],
                          ),
                        ),
                        SizedBox(width: defaultPadding),
                        if (!Responsive.isMobile(context))
                          Expanded(
                            flex: 2,
                            child: StarageDetails(),
                          ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
