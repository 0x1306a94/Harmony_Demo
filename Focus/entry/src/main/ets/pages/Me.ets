import HomeBannerView from '../component/HomeBannerView'
@Entry
@Component
export struct MeView {
  @State message: string = 'Hello MyView'

  build() {

    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}