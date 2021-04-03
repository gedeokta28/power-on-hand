import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:power_on_hand/core/controllers/kasus_controller.dart';
import 'package:power_on_hand/core/utils/helper_utils.dart';
import 'package:power_on_hand/ui/screens/kasus_detail_screen.dart';
import 'package:power_on_hand/ui/widgets/dashboard/dashboard_history_item_widget.dart';
import 'package:power_on_hand/ui/widgets/dashboard/dashboard_history_list_title_widget.dart';

class DashboardKasusHistoryWidget extends StatefulWidget {
  @override
  _DashboardKasusHistoryWidgetState createState() => _DashboardKasusHistoryWidgetState();
}

class _DashboardKasusHistoryWidgetState extends State<DashboardKasusHistoryWidget> {
  String choosenDate = "";

  @override
  Widget build(BuildContext context) {
    return ListBody(
      children: [
        DashboardHistoryListTitleWidget(
          title: 'History Kasus',
          date: choosenDate.isNotEmpty ? choosenDate : DateFormat("dd MMMM yyyy").format(DateTime.now()),
          onTapDate: () async {
            var res = await HelperUtils.getDatePicker();
            if (res != null) {
              setState(() {
                choosenDate = DateFormat("dd MMMM yyyy").format(res);
              });
              KasusController.to.getKasusHistoryList(date: res);
            }
          },
        ),
        SizedBox(height: 24),
        GetBuilder<KasusController>(
          builder: (_) {
            if (_.listKasusHistory == null || _.isLoading == true) {
              return Center(child: CircularProgressIndicator());
            }
            return SizedBox(
              height: 200,
              child: _.listKasusHistory.isEmpty
                  ? Center(
                      child: Text('No history found '),
                    )
                  : ListView.separated(
                      separatorBuilder: (_, __) => Divider(height: 1),
                      itemCount: _.listKasusHistory.length,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return DashboardHistoryItemWidget(
                          title: _.listKasusHistory[index].description,
                          onTap: () {
                            Get.to(() => KasusDetailScreen(_.listKasusHistory[index].id));
                          },
                        );
                      },
                    ),
            );
          },
        ),
      ],
    );
  }
}
