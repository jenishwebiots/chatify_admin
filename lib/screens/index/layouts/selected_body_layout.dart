import '../../../config.dart';


class SelectedIndexBodyLayout extends StatelessWidget {
  const SelectedIndexBodyLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IndexController>(builder: (indexCtrl) {
      return Expanded(
          child: SelectionArea(
              child: CustomScrollView(
                  controller: indexCtrl.scrollController,
                  slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              Container(

                  padding: const EdgeInsets.symmetric(horizontal: Insets.i24),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (Responsive.isDesktop(context))
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start  ,
                                  children: [

                                    Text(indexCtrl.pageName.tr,
                                        style: AppCss.poppinsblack18.textColor(appCtrl.appTheme.blackColor)),
                                    const VSpace(Sizes.s8),
                                    Row(children: [
                                       InkWell(
                                          mouseCursor: SystemMouseCursors.click,
                                          child: Text(fonts.admin.tr,style: AppCss.poppinsMedium14.textColor(appCtrl.appTheme.blackColor))),
                                       Text('  /  ',style: AppCss.poppinsMedium14.textColor(appCtrl.appTheme.blackColor)),
                                      Text(indexCtrl.pageName.tr,style: AppCss.poppinsMedium14.textColor(appCtrl.appTheme.blackColor))
                                    ])
                                  ]),
                              GetBuilder<AppController>(
                                  builder: (context) {
                                    return CustomSnackBar(isAlert: appCtrl.isAlert);
                                  }
                              )
                            ]
                          ).marginOnly(top: Insets.i20),
                        const VSpace(Sizes.s20),
                        indexCtrl.widgetOptions
                            .elementAt(indexCtrl.selectedIndex)
                      ]))
            ])),
            SliverFillRemaining(
                hasScrollBody: false,
                fillOverscroll: true,
                child: Column(children: const <Widget>[
                  Expanded(child: SizedBox.shrink())
                ]))
          ])));
    });
  }
}
