part of '../../../pages/_views.dart';

class DetailMoviePageAppBarComponent extends StatelessWidget {
  final bool innerBoxIsScrolled;

  const DetailMoviePageAppBarComponent({
    Key? key,
    required this.innerBoxIsScrolled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailMoviePageController());

    return SliverAppBar(
      title: innerBoxIsScrolled ? Text(controller.getData!.title) : null,
      leading: IconButton(
        padding: const EdgeInsets.all(0),
        splashRadius: 20,
        icon: const Icon(
          Icons.arrow_back_outlined,
        ),
        onPressed: controller.backOnCLick,
      ),
      floating: true,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              ApiServices.imageURL + controller.getData!.posterPath,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black87, Colors.transparent],
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                ),
              ),
            ),
          ],
        ),
      ),
      expandedHeight: MediaQuery.of(context).size.height * 0.7,
    );
  }
}
