import { NewsInfoItem } from '../bean/NewsInfo'


@Component
export struct TableView {
  @State message: string = 'Hello HomeView'
  @State title: string = '我是标题'
  @Consume dataSource: Array<NewsInfoItem>;
  build() {
    Row() {
      Column() {
        List({ space: 0, initialIndex: 0 }) {
          ForEach(this.dataSource, (item:NewsInfoItem,index) => {
            ListItem() {
              Column(){
                Text('' +item.title)
                  .width('100%').height(50).fontSize(22)
                  .textAlign(TextAlign.Start).backgroundColor(0xFFFFFF)
                Text('' +item.userInfo.nickNameDisplay)
                  .width('100%').height(50).fontSize(19)
                  .textAlign(TextAlign.Start).backgroundColor(0xFFFFFF)
              }.height(100).backgroundColor(Color.Grey).borderRadius(20)
            }.borderRadius(20)
          }, item => item)
        }
      }.width('100%').height('100%').backgroundColor(0xDCDCDC).padding({ top: 10 })
    }
    .height('100%')
  }
}