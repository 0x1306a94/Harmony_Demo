import { NewsZXModel } from '../bean/newsZXModel';
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
    List({ space: 20 }) {
      LazyForEach(DataSourceManager.getNewsZXDataSource(), (item: NewsZXModel) => {
        ListItem() {
          Row() {
            Text(item.title).fontSize(22)
              .onAppear(() => {
                console.info("appear:" + item)
              })
          }.margin({ left: 10, right: 10 })
          .backgroundColor(Color.Red)
        }
        .onClick(() => {

        })
      }, item => item)
    }.cachedCount(5)
  }
}