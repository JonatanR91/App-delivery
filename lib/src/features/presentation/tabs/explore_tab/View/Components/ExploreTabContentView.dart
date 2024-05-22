import 'package:flutter/material.dart';
import 'package:yes_no_app/src/features/presentation/tabs/explore_tab/View/Components/CollectionsContentView.dart';
import 'package:yes_no_app/src/features/presentation/tabs/explore_tab/View/Components/NoveltyPlacesContentView.dart';
import 'package:yes_no_app/src/features/presentation/tabs/explore_tab/View/Components/PopularPlacesContentView.dart';
import 'package:yes_no_app/src/features/presentation/tabs/explore_tab/View/Components/SearchTopBar.dart';
import 'package:yes_no_app/src/features/presentation/tabs/explore_tab/ViewModel/ExploreTabViewModel.dart';

class ExploreTabContentView extends StatelessWidget {

  final ExploreViewModel viewModel;

  const ExploreTabContentView({ Key? key, required this.viewModel }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverList(
          delegate: SliverChildListDelegate([
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    const SearchTopBar(),
                    NoveltyPlacesContentView(noveltyPlaces: viewModel.noveltyPlaces),
                    const SizedBox(
                      height: 16.0,
                    ),
                    PopularPlacesContentView(popularPlaces: viewModel.popularPlaces),
                    const SizedBox(
                      height: 16.0,
                    ),
                    CollectionsContentView(collections: viewModel.collections)
                  ],
                ))
          ]))
    ]);
  }
}


