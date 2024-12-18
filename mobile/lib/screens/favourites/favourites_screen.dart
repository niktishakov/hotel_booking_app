import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_app/services/toast.service.dart';
import 'package:hotel_booking_app/utils/theme/export.dart';
import 'package:hotel_booking_app/widgets/hotel_card.dart';

import 'model/favourites_bloc.dart';
import 'model/favourites_event.dart';
import 'model/favourites_state.dart';

@RoutePage()
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.hbTheme;

    return Builder(
      builder: (context) {
        return BlocConsumer<FavouritesBloc, FavouritesState>(
          listener: (context, state) {
            state.status.when(
              initial: () {},
              success: (message) {
                ToastService.instance.showToast(message, context: context, status: ToastStatus.success);
              },
              error: (message) {
                ToastService.instance.showToast(message, context: context, status: ToastStatus.failure);
              },
            );
          },
          builder: (context, state) {
            if (state.favourites.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.favorite_border_rounded,
                      size: 64,
                      color: theme.iconSecondary,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'No favorites yet',
                      style: theme.body18M.copyWith(color: theme.textSecondary),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Start adding hotels to your favorites',
                      style: theme.body14.copyWith(color: theme.textSecondary),
                    ),
                  ],
                ),
              );
            }
            return Scaffold(
              body: CustomScrollView(
                slivers: [
                  const CupertinoSliverNavigationBar(
                    largeTitle: Text('Favorites'),
                    leading: SizedBox(),
                    stretch: true,
                  ),
                  SliverList.builder(
                    itemCount: state.favourites.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: HotelCard(
                          details: state.favourites[index],
                          onFavoritePressed: () {
                            context.read<FavouritesBloc>().add(ToggleFavorite(state.favourites[index]));
                          },
                          isFavorite: true,
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
