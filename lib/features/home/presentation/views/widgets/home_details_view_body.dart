import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/core/widgets/cover_container.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_details_app_bar.dart';
import 'package:flutter/material.dart';

class HomeDetailsViewBody extends StatelessWidget {
  const HomeDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        const HomeDetailsAppBar(),
        SliverPadding(
          padding: .symmetric(horizontal: AppConstants.kPadding),
          sliver: SliverToBoxAdapter(
            child: CoverView(
              imageUrl:
                  'https://m.media-amazon.com/images/I/71NAPiptyjL._AC_SL1500_.jpg',
            ),
          ),
        ),
      ],
    );
  }
}
