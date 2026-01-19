import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/features/home/presentation/view_models/relevant_books_bloc/relevant_books_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key, required this.floating});
  final bool floating;
  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  bool _searching = false;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      forceElevated: widget.floating,
      title: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Text(AppConstants.kAppName),
          _searching
              ? SizedBox()
              : IconButton(
                  onPressed: () => setState(() => _searching = true),
                  icon: Icon(Icons.search_rounded),
                ),
        ],
      ),
      bottom: _searching
          ? _SearchBar(
              onCancel: () {
                context.read<RelevantBooksBloc>().searchText = '';
                setState(() => _searching = false);
                context.read<RelevantBooksBloc>().add(
                  FetchRelevantBooksEvent(),
                );
              },
            )
          : null,
      floating: widget.floating,
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
      child: TextFormField(
        initialValue: context.read<RelevantBooksBloc>().searchText,
        onChanged: (value) {
          context.read<RelevantBooksBloc>().searchText = value;
          context.read<RelevantBooksBloc>().add(
            FetchRelevantBooksEvent(
              query: value == '' ? AppConstants.defaultQuery : 'intitle:$value',
            ),
          );
        },
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
