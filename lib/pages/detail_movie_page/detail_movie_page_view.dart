part of '../../pages/_views.dart';

class DetailMoviePageView extends StatelessWidget {
  const DetailMoviePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailMoviePageController());

    return Scaffold(
      body: GetBuilder(
        init: DetailMoviePageController(),
        builder: (_) => !controller.isLoading
            ? NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  DetailMoviePageAppBarComponent(
                    innerBoxIsScrolled: innerBoxIsScrolled,
                  ),
                ],
                body: _body(controller, context),
              )
            : const LoadingWidget(),
      ),
    );
  }

  Widget _body(DetailMoviePageController controller, context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  controller.getData!.title +
                      ' ' +
                      controller.getData!.releaseDate.year.toString(),
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.star_outlined,
                      color: Colors.amber[700],
                    ),
                    const SizedBox(width: 3),
                    Text(
                      controller.getData!.voteAverage.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 18),
                Text(controller.getData!.overview),
                const SizedBox(height: 8),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  child: const Text(
                    'Genres',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const SizedBox(width: 8),
                      Row(
                        children: List.generate(
                          controller.getData!.genres.length,
                          (i) => Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.only(
                              left: 8,
                              top: 0,
                              right: 8,
                              bottom: 16,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: Text(controller.getData!.genres[i].name),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            color: Colors.white,
            // padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  child: const Text(
                    'Trailer',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                YoutubePlayerBuilder(
                  player: YoutubePlayer(
                    controller: YoutubePlayerController(
                      initialVideoId: controller.getVideos![0].key,
                      flags: const YoutubePlayerFlags(
                        autoPlay: false,
                        mute: false,
                      ),
                    ),
                  ),
                  builder: (context, player) => Column(
                    children: [player],
                  ),
                ),

                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     children: [
                //       const SizedBox(width: 8),
                //       Row(
                //         children: List.generate(
                //           controller.getVideos!.length,
                //           (index) => Container(
                //             margin: const EdgeInsets.only(
                //               left: 8,
                //               right: 8,
                //               bottom: 16,
                //             ),
                //             width: MediaQuery.of(context).size.width * 0.6,
                //             child: YoutubePlayer(
                //               controller: YoutubePlayerController(
                //                 initialVideoId:
                //                     controller.getVideos![index].key,
                //                 flags: const YoutubePlayerFlags(
                //                   autoPlay: false,
                //                   mute: false,
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //       const SizedBox(width: 8),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
