part of '../../pages/_views.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomePageController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Movies',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GetBuilder(
        init: HomePageController(),
        builder: (_) => !controller.isLoading
            ? GridView.builder(
                padding: EdgeInsets.all(16),
                controller: ScrollController(),
                itemCount: controller.getItemCount,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, i) => _card(
                  data: controller.getGenreList[i],
                  controller: controller,
                ),
              )
            : const LoadingWidget(),
      ),
    );
  }

  Widget _card({
    required GenreElement data,
    required HomePageController controller,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () => controller.cardOnClick(data),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.center,
        child: Text(data.name),
      ),
    );
  }
}
