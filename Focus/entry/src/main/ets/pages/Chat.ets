import { NewsZXModel } from '../bean/newsZXModel';
import { HomeListView } from '../component/homeListView';
import { DataSourceManager } from '../model/DataSourceManager';
import { NewsZXDataSource } from '../model/NewsZXDataSource';
import { ApiManager } from '../network/ApiManager';
@Entry
@Component
export struct ChatView {
  @State message: string = 'ChatView'

  async aboutToAppear() {
    await ApiManager.getInstance().getZXNewsFeedDataManager();

  }

  build() {
    Row(){
      HomeListView()
    }.width('100%').height('100%').backgroundColor('#F7F7F7')

    // List({ space: 20 }) {
    //   LazyForEach(DataSourceManager.getNewsZXDataSource(), (item: NewsZXModel) => {
    //     ListItem() {
    //       Row() {
    //         Text(item.title).fontSize(22)
    //           .onAppear(() => {
    //             console.info("appear:" + item)
    //           })
    //       }.margin({ left: 10, right: 10 })
    //       .backgroundColor(Color.Red)
    //     }
    //     .onClick(() => {
    //
    //     })
    //   }, item => item)
    // }.cachedCount(5)
  }
}