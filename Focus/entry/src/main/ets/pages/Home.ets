import { ThreadFormatter } from '@ohos/xlog/src/main/ets/components/formatter/ThreadFormatter'
import { NewsInfoItem } from '../bean/NewsInfo'
import { TableView } from '../component/tabView'
import { NewsBuilding } from '../model/NewsInfoModel'
import { BLog } from '../utils/BLog'
import NewsViewModel from '../viewModel/NewsViewModel'



@Entry
@Component
export struct HomeView {
  @State message: string = 'Hello HomeView'
  @State title: string = '我是标题'
  @Provide dataSource: Array<NewsInfoItem> =[]

  @Provide('buildListDataS') buildListDataS: { [key: string]: NewsBuilding.NewsBuildingData } = {};


  @Provide('recommendMenuDatas') recommendMenuDatas: { [key: string]: NewsBuilding.RecommendHeaderData } = {};
  async aboutToAppear(){
    this.title = 'aboutToAppear'

    let viewModel = new NewsViewModel();
    this.buildListDataS['build'] = await viewModel.getNewsData();
    this.recommendMenuDatas['build'] = await viewModel.getBannerHeaderData();

    for (let i = 0; i < this.buildListDataS['build'].data.homeNewsList.newsListData.list.length ; i++) {
      this.dataSource.push(new NewsInfoItem({ title: this.buildListDataS['build'].data.homeNewsList.newsListData.list[i].title,
        content: 'string', headImg:'string',nickNameDisplay:this.buildListDataS['build'].data.homeNewsList.newsListData.list[i].userInfo.nickNameDisplay
      }))
    }

    BLog.i('zm')
  }

  build() {
    Row() {
      Text('shouye')
      // TableView()
    //   Column() {
    //     List({ space: 0, initialIndex: 0 }) {
    //       ForEach(this.dataSource, (item:NewsInfoItem,index) => {
    //         ListItem() {
    //           Column(){
    //             Text('' +item.title)
    //               .width('100%').height(50).fontSize(22)
    //               .textAlign(TextAlign.Start).backgroundColor(0xFFFFFF)
    //             Text('' +item.userInfo.nickNameDisplay)
    //               .width('100%').height(50).fontSize(19)
    //               .textAlign(TextAlign.Start).backgroundColor(0xFFFFFF)
    //           }.height(100).backgroundColor(Color.Grey).borderRadius(20)
    //         }.borderRadius(20)
    //       }, item => item)
    //     }
    //   }.width('100%').height('100%').backgroundColor(0xDCDCDC).padding({ top: 10 })
    }
    .height('100%')
  }
}