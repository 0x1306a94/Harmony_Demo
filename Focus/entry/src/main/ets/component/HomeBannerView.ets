@Styles function allSize() {
  .width('100%')
  .height('100%')
}

@Component
export default struct HomeBannerView {

  build() {
    Row() {
      Column() {
        Text('HomeBannerView')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }.backgroundColor(Color.Red)
    .height('100%')
  }
}