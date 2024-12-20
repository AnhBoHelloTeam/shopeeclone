import 'package:flutter/material.dart';
import 'package:shopeeclone/services/assets_manager.dart';
import 'package:shopeeclone/widgets/empty_widget_bag.dart';
import 'package:shopeeclone/widgets/titles_text.dart';
import 'orders_widget.dart';

class OrdersScreenFree extends StatefulWidget {
  static const routeName = '/OrderScreen';

  const OrdersScreenFree({super.key});

  @override
  State<OrdersScreenFree> createState() => _OrdersScreenFreeState();
}

class _OrdersScreenFreeState extends State<OrdersScreenFree> {
    bool isEmptyOrders = false;
    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: const TitleTextWidget(
              label: 'Placed orders',
            ),
          ),
          body: isEmptyOrders
              ? EmptyBagWidget(
                  imagePath: AssetsManager.orderBag,
                  title: "No orders has been placed yet",
                  subtitles: "ferfaces", buttonText: '',
                )
              : ListView.separated(
                  itemCount: 15,
                  itemBuilder: (ctx, index) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                      child: OrdersWidgetFree(),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider();
                  },
                ));
    }
  }
