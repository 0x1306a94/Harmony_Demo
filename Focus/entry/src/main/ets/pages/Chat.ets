@Entry
@Component
export struct ChatView {
  @State message: string = 'ChatView'

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