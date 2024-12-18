import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_app/screens/favourites/model/favourites_bloc.dart';
import 'package:hotel_booking_app/screens/favourites/model/favourites_event.dart';
import 'package:hotel_booking_app/services/toast.service.dart';
import 'package:hotel_booking_app/widgets/hb.sliver_app_bar.dart';
import 'package:hotel_booking_app/widgets/hotel_card.dart';

import 'model/overview_cubit.dart';
import 'model/overview_state.dart';

@RoutePage()
class OverviewScreen extends StatefulWidget {
  const OverviewScreen({super.key});

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    print('initState');
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        context.read<OverviewCubit>().loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    if (value.length < 3) return;
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      context.read<OverviewCubit>().searchHotels(query: value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          const HbSliverAppBar(
            titleText: "Find Hotel",
            leading: SizedBox(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CupertinoSearchTextField(
                controller: _searchController,
                placeholder: 'Hotels in Bali',
                onChanged: _onSearchChanged,
              ),
            ),
          ),
          CupertinoSliverRefreshControl(
            onRefresh: () {
              return context.read<OverviewCubit>().getHotels(silent: true);
            },
          ),
          SliverToBoxAdapter(
            child: _buildSearchResult(),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResult() {
    return Builder(
      builder: (context) {
        final favoriteHotels = context.watch<FavouritesBloc>().state.favourites;

        return BlocConsumer<OverviewCubit, OverviewState>(
          listener: (context, state) {
            if (state.error.isNotEmpty) {
              ToastService.instance.showToast(
                state.error,
                status: ToastStatus.failure,
                context: context,
              );
            }
          },
          builder: (context, state) {
            if (state.isLoading && state.hotels.isEmpty) {
              return const Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CupertinoActivityIndicator(
                      radius: kLoadingIndicatorRadius,
                    ),
                  ],
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  ...state.hotels.map(
                    (hotel) => HotelCard(
                      details: hotel,
                      onFavoritePressed: () {
                        context.read<FavouritesBloc>().add(ToggleFavorite(hotel));
                      },
                      isFavorite: favoriteHotels.contains(hotel),
                    ),
                  ),
                  if (state.isLoadingMore)
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CupertinoActivityIndicator(),
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
