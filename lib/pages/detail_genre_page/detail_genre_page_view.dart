part of '../../pages/_views.dart';

class DetailGenrePageView extends StatelessWidget {
  const DetailGenrePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailGenrePageController());

    return Scaffold(
      appBar: AppBar(
        title: Text(controller.genre.name),
      ),
      body: GetBuilder(
        init: DetailGenrePageController(),
        builder: (_) => !controller.isLoading
            ? ListView.builder(
                cacheExtent: 9999,
                controller: controller.scrollController,
                padding: const EdgeInsets.symmetric(vertical: 16),
                itemCount: controller.getItemCount,
                itemBuilder: (context, i) => _card(
                  data: controller.getItemList[i],
                  controller: controller,
                ),
              )
            : const LoadingWidget(),
      ),
    );
  }

  Widget _card({
    required Result data,
    required DetailGenrePageController controller,
  }) {
    return InkWell(
      onTap:()=> controller.movieOnClick(data.id),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://image.tmdb.org/t/p/original${data.posterPath}',
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.title),
                  const SizedBox(height: 8),
                  Text(
                    data.overview,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: -1,
             child: Row(
                children: [
                  Icon(
                    Icons.star_outlined,
                    color: Colors.amber[700],size: 16,
                  ),
                  const SizedBox(width: 3),
                  Text(
                    data.voteAverage.toString(),
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
