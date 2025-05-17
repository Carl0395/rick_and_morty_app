import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty_app/features/characters/presentation/pages/widgets/card_box.dart';
import 'package:rick_and_morty_app/features/characters/presentation/pages/widgets/card_loading.dart';
import 'package:rick_and_morty_app/features/characters/presentation/providers/characters_list.dart';

class CharactersPage extends ConsumerStatefulWidget {
  const CharactersPage({super.key});

  @override
  CharacterPageState createState() => CharacterPageState();
}

class CharacterPageState extends ConsumerState<CharactersPage> {
  final scrollController = ScrollController();
  double heightAppBar = 200;
  double topPosition = 160;
  bool hasMoreItems = true;
  int currentPage = 1;

  @override
  void initState() {
    super.initState();

    initScrollListener();
  }

  @override
  Widget build(BuildContext context) {
    final characters = ref.watch(charactersListProvider);

    return Scaffold(
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 0),
            curve: Curves.linear,
            height: heightAppBar,
            color: Color(0xFF02AFCA),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/rick_and_morty_label.svg',
              height: 80,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: topPosition),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: characters.when(
              data:
                  (list) => NotificationListener(
                    onNotification: (notification) {
                      if (notification is ScrollUpdateNotification) {
                        heightAppBar = (200 - scrollController.offset).clamp(
                          0,
                          200,
                        );
                        topPosition = (160 - scrollController.offset).clamp(
                          0,
                          160,
                        );
                        setState(() {});
                      }
                      return true;
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: MasonryGridView.builder(
                        // gridDelegate:
                        //     const SliverGridDelegateWithFixedCrossAxisCount(
                        //       crossAxisCount: 2,
                        //       crossAxisSpacing: 4,
                        //       childAspectRatio: 0.66,
                        //     ),
                        gridDelegate:
                            SliverSimpleGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                        controller: scrollController,
                        padding: const EdgeInsets.only(
                          left: 4,
                          right: 4,
                          top: 4,
                          bottom: 50,
                        ),
                        itemCount: list.length + (hasMoreItems ? 2 : 0),
                        itemBuilder: (context, index) {
                          if (index < list.length) {
                            final character = list[index];
                            return CardBox(character: character);
                          }
                          // FOOTER LOADER QUE OCUPA TODA LA FILA
                          return CardLoading();
                        },
                      ),
                    ),
                  ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
            ),
          ),
        ],
      ),
    );
  }

  initScrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 200) {
        // Si estás cerca del final (a 200px)
        if (hasMoreItems) {
          loadMoreItems(); // Tu función para cargar más datos
        }
      }
    });
  }

  void loadMoreItems() {
    ref.read(charactersListProvider.notifier).loadMore();
  }
}
