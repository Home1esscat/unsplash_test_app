import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:sandbox/api/models/photos_model.dart';
import 'package:sandbox/api/photos_api.dart';
import 'package:sandbox/screens/details_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static const _page = 1;

  final PagingController<int, PhotosModel> _pagingController =
      PagingController(firstPageKey: _page);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  void _selectItem(BuildContext context, String image) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (c, a1, a2) => DetailsScreen(image: image),
        transitionsBuilder: (c, anim, a2, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: const Duration(milliseconds: 200),
      ),
    );
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await PhotosApi().getPhotos(pageKey);
      final nextPageKey = pageKey + 1;
      _pagingController.appendPage(newItems, nextPageKey);
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PagedListView<int, PhotosModel>(
          addAutomaticKeepAlives: true,
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<PhotosModel>(
            itemBuilder: ((context, item, index) => InkWell(
                  onTap: () => _selectItem(context, item.urls.full),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Image.network(
                      item.urls.smallS3,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return Stack(
                            alignment: AlignmentDirectional.bottomStart,
                            children: [
                              child,
                              Container(
                                color: Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.user.username,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                        '${item.description ?? 'no description'}')
                                  ],
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
