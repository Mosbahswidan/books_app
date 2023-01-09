import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/functions/launch_url.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../data/models/book_model/book_model.dart';

class BookActions extends StatelessWidget {
  final BookModel bookModel;
  const BookActions({super.key, required this.bookModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.94.h),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              text: "Free",
              onPressed: () {},
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(1.88.h),
                bottomLeft: Radius.circular(1.88.h),
              ),
            ),
          ),
          Expanded(
              child: CustomButton(
            text: getText(bookModel),
            textSize: 1.88.h,
            onPressed: () {
              launchCustomUr(context, bookModel.volumeInfo.previewLink);
            },
            backgroundColor: const Color(0xFFEF8262),
            textColor: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(1.88.h),
              bottomRight: Radius.circular(1.88.h),
            ),
          )),
        ],
      ),
    );
  }

  String getText(BookModel bookModel) {
    if (bookModel.volumeInfo.previewLink == null) {
      return 'Not Avaliable';
    } else {
      return 'Preview';
    }
  }
}
