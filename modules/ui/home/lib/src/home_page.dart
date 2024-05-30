import 'package:common_dependencies/common_dependencies.dart';
import 'package:common_ui/common_ui.dart';
import 'package:home/src/home_controller.dart';

class HomePage extends GetView<HomeController> {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
        appBar: AppBar(
            title: Text("flutterWorkshop".tr),
            leading: IconButton(
                onPressed: controller.onSettingsPressed,
                icon: const Icon(Icons.settings)),
            actions: [
              IconButton(
                  onPressed: controller.switchTheme,
                  icon: Icon(isLight ? Icons.light_mode : Icons.dark_mode))
            ]),
        body: Scaffold(
            body: DefaultTabController(
          length: 2,
          child: Scaffold(
            body: RefreshIndicator(
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 1));
              },
              child: LayoutBuilder(builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TabBarView(
                            // physics:
                            //     const NeverScrollableScrollPhysics(), // Keep here
                            children: [
                              ListView.builder(
                                // Remove NeverScrollableScrollPhysics
                                itemCount: 100,
                                itemBuilder: (context, index) => ListTile(
                                  title: Text('list1 $index'),
                                ),
                              ),
                              ListView.builder(
                                // Remove NeverScrollableScrollPhysics
                                itemCount: 100,
                                itemBuilder: (context, index) => ListTile(
                                  title: Text('list2 $index'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        )

            // DefaultTabController(
            //     length: 2,
            //     child: LayoutBuilder(builder: (context, constraints) {
            //       return RefreshIndicator(
            //         triggerMode: RefreshIndicatorTriggerMode.anywhere,
            //         onRefresh: () async {
            //           await Future.delayed(const Duration(seconds: 1));
            //         },
            //         child: SingleChildScrollView(
            //           // primary: true,
            //           // physics: const AlwaysScrollableScrollPhysics(
            //           //   parent: BouncingScrollPhysics(),
            //           // ),
            //           physics: const AlwaysScrollableScrollPhysics(
            //             parent: BouncingScrollPhysics(),
            //           ),
            //           child: ConstrainedBox(
            //             constraints: constraints,
            //             child: Column(
            //               mainAxisSize: MainAxisSize.max,
            //               children: [
            //                 Expanded(
            //                   child: TabBarView(
            //                     // physics: const NeverScrollableScrollPhysics(),
            //                     children: [
            //                       ListView.builder(
            //                         physics: NeverScrollableScrollPhysics(),
            //                         itemCount: 100,
            //                         itemBuilder: (context, index) => ListTile(
            //                           title: Text('list1 $index'),
            //                         ),
            //                       ),
            //                       ListView.builder(
            //                         physics: NeverScrollableScrollPhysics(),
            //                         //   parent: BouncingScrollPhysics(),
            //                         // ),
            //                         itemCount: 100,
            //                         itemBuilder: (context, index) => ListTile(
            //                           title: Text('list2 $index'),
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       );
            //     })),
            )

        // Center(
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.start,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           /// Loading image asset from ThemeData with layout from ThemeData extension
        //           Image.asset(
        //             Get.theme.assets.images.flutterBird,
        //             height: Get.theme.layout.smallLogoSize.height,
        //             width: Get.theme.layout.smallLogoSize.width,
        //           ).marginSymmetric(horizontal: Get.theme.layout.smallPadding),
        //           Obx(
        //             () => Text(
        //               controller.toTheMoon.value
        //                   ? 'toTheMoon'.tr
        //                   : 'toTheGround'.tr,
        //               textAlign: TextAlign.center,
        //               style: Get.textTheme.displayMedium
        //                   // custom color used from ThemeData extension
        //                   ?.copyWith(color: Get.theme.colors.customColor),
        //             ),
        //           ),
        //         ],
        //       ).marginSymmetric(vertical: Get.theme.layout.mediumPadding),

        //       /// Loading animation asset from ThemeData
        //       Obx(
        //         () => AnimatedRotation(
        //             turns: controller.toTheMoon.value ? 0.0 : 1 / 2,
        //             duration: const Duration(milliseconds: 350),
        //             child: LottieBuilder.asset(
        //                 Get.theme.assets.animations.flyingRocket)),
        //       ),

        //       Obx(
        //         () => FilledButton(
        //             onPressed: controller.switchFlightDirection,
        //             child: Text(controller.toTheMoon.value
        //                 ? "crashToGround".tr
        //                 : "flyToMoon".tr)),
        //       ).marginOnly(bottom: Get.theme.layout.mediumPadding),
        //     ],
        //   ),
        // ),
        );
  }
}
