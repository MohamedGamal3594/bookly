import 'package:bookly/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  bool _isSearching = false;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Text(AppConstants.kAppName),
          _isSearching
              ? SizedBox()
              : IconButton(
                  onPressed: () => setState(() => _isSearching = true),
                  icon: Icon(Icons.search_rounded),
                ),
        ],
      ),
      bottom: _isSearching
          ? _SearchBar(
              onCancel: () {
                setState(() => _isSearching = false);
              },
            )
          : null,
      floating: true,
    );
  }
}

class _SearchBar extends StatelessWidget implements PreferredSizeWidget {
  const _SearchBar({required this.onCancel});
  final VoidCallback onCancel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .symmetric(
        horizontal: AppConstants.kPadding,
        vertical: AppConstants.kPadding * 0.5,
      ),
      child: TextField(
        autofocus: true,
        decoration: InputDecoration(
          hintText: 'Search by title',
          suffixIcon: IconButton(
            onPressed: onCancel,
            icon: Icon(FontAwesomeIcons.xmark),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(76);
}
