import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionsListView extends StatelessWidget {
  const TransactionsListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 7,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 12.h),
          child: Row(
            children: [
              const Icon(Icons.arrow_circle_down),
              SizedBox(width: 16.w),
              Flexible(
                child: Text(
                  "You paid ₦1,570 to send your package (023) with to Timi Akinlaja to DHL Hub, Asaba, Delta State at 12:02pm",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: const Color(0xff171718),
                      ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
