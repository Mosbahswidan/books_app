// import 'package:bookly/core/utils/app_router.dart';
// import 'package:bookly/features/home/data/models/book_model/book_model.dart';
// import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
// import 'package:bookly/features/home/presentation/views/widgets/custom_book_item.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// import '../../../../../core/utils/assets_data.dart';
// import '../../../../../core/utils/styles.dart';

// class BestSellerListViewItem extends StatelessWidget {
//   final BookModel book;
//   const BestSellerListViewItem({super.key, required this.book});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 250,
//       child: GestureDetector(
//         onTap: () {
//           GoRouter.of(context).push(AppRouter.kBookDetailsView);
//         },
//         child: Row(
//           children: [
//             //Image.asset(AssetsData.testBook),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: CustomBookImage(
//                   imageUrl: book.volumeInfo.imageLinks.thumbnail),
//             ),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   Text(
//                     "${book.volumeInfo.title}",
//                     style: Styles.textStyle30.copyWith(fontSize: 25),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     "${book.volumeInfo.authors}",
//                     style: Styles.textStyle14,
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         "${book.saleInfo!.saleability}",
//                         style: Styles.textStyle20.copyWith(
//                             fontWeight: FontWeight.bold, fontSize: 16),
//                       ),
//                       const Spacer(),
//                       const BookRating(rating: 4.5, count: 2000),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:bookly/constants.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/styles.dart';
import '../../../data/models/book_model/book_model.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key, required this.bookModel});

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          AppRouter.kBookDetailsView,
          extra: bookModel,
        );
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            CustomBookImage(
                imageUrl: bookModel.volumeInfo.imageLinks.thumbnail),
            SizedBox(
              width: 6.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 50.w,
                    child: Text(
                      bookModel.volumeInfo.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20.copyWith(
                        fontFamily: kSecrtaFine,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  bookModel.volumeInfo.authors != null
                      ? Text(
                          bookModel.volumeInfo.authors![0],
                          style: Styles.textStyle14
                              .copyWith(overflow: TextOverflow.ellipsis),
                        )
                      : const Text(
                          "null",
                          style: Styles.textStyle14,
                        ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      BookRating(
                        rating:
                            bookModel.volumeInfo.averageRating?.round() ?? 0,
                        count: bookModel.volumeInfo.ratingsCount ?? 0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
