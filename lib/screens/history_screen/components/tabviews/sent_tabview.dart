
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SentTabView extends StatelessWidget {
  const SentTabView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: Scrollbar(
          child: ListView.builder(
            itemCount: 15,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 16.0.h),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.arrow_circle_down),
                      SizedBox(width: 17.w),
                      Flexible(
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                        color:
                                            const Color(0xff171718),
                                      ),
                                  children: [
                                    const TextSpan(
                                        text:
                                            "Your package (154)  to be delivered at DHL Hub, Asaba, Delta State by Aladetimi Tolulope. "),
                                    TextSpan(
                                      text: "See Details",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4!
                                          .copyWith(
                                            color: const Color(
                                                0xff171718),
                                            decoration: TextDecoration
                                                .underline,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Row(children: [
                                Icon(
                                  Icons.shield,
                                  color: const Color(0xff06B248),
                                  size: 12.w,
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  "Package has been picked up at the delivery location",
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff06B248),
                                  ),
                                )
                              ])
                            ]),
                      )
                    ]),
              );
            },
          ),
        ),
      ),
    );
  }
}
