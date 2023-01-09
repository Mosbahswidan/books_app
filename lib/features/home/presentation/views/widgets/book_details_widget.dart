import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'books_actions.dart';
import 'custom_book_item.dart';

class BookDetailsWdget extends StatelessWidget {
  final BookModel bookModel;
  const BookDetailsWdget({super.key, required this.bookModel});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: CustomBookImage(
              imageUrl: bookModel.volumeInfo.imageLinks.thumbnail),
        ),
        SizedBox(
          height: 5.05.h,
        ),
        Text(
          "${bookModel.volumeInfo.title}",
          style: Styles.textStyle30.copyWith(fontSize: 25),
        ),
        SizedBox(
          height: 0.7.h,
        ),
        Text(
          bookModel.volumeInfo.authors![0],
          style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 2.11.h,
        ),
        BookRating(
          rating: bookModel.volumeInfo.averageRating?.round() ?? 0,
          count: bookModel.volumeInfo.ratingsCount ?? 0,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        SizedBox(
          height: 4.34.h,
        ),
        BookActions(bookModel: bookModel),
      ],
    );
  }
}
