@Entry
@Component
export struct LivingView {
  @State message: string = 'Hello LivingView'

  async aboutToAppear(){
  }
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