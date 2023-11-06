import { BLog } from '../utils/BLog'
@Entry
@Component
export struct ChatView {
  @State message: string = 'Hello ChatView'

  onPageShow(){
    BLog.i('=====Chat-pageShow')
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