part of '../../pages/_views.dart';

class DetailReviewPageView extends StatelessWidget {
  const DetailReviewPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailReviewPageController());

    return Scaffold(
      appBar: AppBar(
        title: Text(controller.getMovie!.title),
      ),
      body: SingleChildScrollView(
        controller: controller.scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: const Text(
                'Reviews',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GetBuilder(
              init: DetailReviewPageController(),
              builder: (_) => !controller.isLoading
                  ? ListView.builder(
                    cacheExtent: controller.getItemCount.toDouble(),
                    shrinkWrap: true,
                    controller: ScrollController(),
                    itemCount: controller.getItemCount,
                    itemBuilder: (context, i) => _card(
                      controller.getReviews!.reviews[i],
                    ),
                  )
                  : const LoadingWidget(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _card(ReviewElement data) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    data.author,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '${data.createdAt.day}-${data.createdAt.month}-${data.createdAt.year}',
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(data.content),
          ],
        ),
      ),
    );
  }
}
