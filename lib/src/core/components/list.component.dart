import 'dart:ui';

import 'package:dj_flutter_app/src/core/components/centered_error.component.dart';
import 'package:dj_flutter_app/src/core/components/centered_loader.component.dart';
import 'package:dj_flutter_app/src/core/components/load_more_button.component.dart';
import 'package:dj_flutter_app/src/core/models/list.state.model.dart';
import 'package:flutter/material.dart';

class ListComponent<T> extends StatelessWidget {
  final ListState<T> state;
  final VoidCallback handleLoadMore;
  final Function() handleRefresh;
  final Function(T item) itemBuilder;
  final bool shrinkWrap;

  const ListComponent({
    super.key,
    required this.state,
    required this.handleLoadMore,
    required this.handleRefresh,
    required this.itemBuilder,
    this.shrinkWrap = false,
  });

  @override
  Widget build(BuildContext context) {
    if (state.error != null && state.results.isEmpty) {
      return CenteredErrorComponent(state.error!);
    }

    if (state.isLoading && state.results.isEmpty) {
      return CenteredLoaderComponent();
    }

    return RefreshIndicator(
      onRefresh: () async {
        await handleRefresh();
      },
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },
        ),
        child: ListView.builder(
          itemCount: state.results.length,
          shrinkWrap: shrinkWrap,
          itemBuilder: (context, index) {
            final isLast = index == state.results.length - 1;
            final item = state.results[index];

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                itemBuilder(item),
                if (isLast && state.paginationInfo.canLoadMore)
                  Builder(
                    builder: (context) {
                      if (state.error != null) {
                        return CenteredErrorComponent(state.error!);
                      }

                      if (state.isLoading) {
                        return CenteredLoaderComponent();
                      }

                      return LoadMoreButtonComponent(
                        onPressed: handleLoadMore,
                      );
                    },
                  )
              ],
            );
          },
        ),
      ),
    );
  }
}
