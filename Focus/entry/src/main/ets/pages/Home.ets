import { ThreadFormatter } from '@ohos/xlog/src/main/ets/components/formatter/ThreadFormatter'
import { MenuModel } from '../model/menuModel'
import { NewsInfoItem } from '../bean/newsInfoModel'
import { TableView } from '../component/tabView'
import { NewsBuilding } from '../model/NewsInfoModel'
import { BLog } from '../utils/BLog'
import NewsViewModel from '../viewModel/NewsViewModel'



@Entry
@Component
export struct HomeView {

  @Provide('buildListDataS') buildListDataS: { [key: string]: NewsBuilding.NewsBuildingData } = {};
  @Provide dataSource: Array<NewsInfoItem> =[]

  // 顶部菜单栏
  @Provide('recommendMenuDatas') recommendMenuDatas: { [key: string]: NewsBuilding.RecommendHeaderData } = {};
  @Provide menuArry: Array<MenuModel> =[]


  async aboutToAppear(){

    let viewModel = new NewsViewModel();
    // 咨询feed流
    this.buildListDataS['build'] = await viewModel.getNewsData();
    // 顶部菜单
    this.recommendMenuDatas['build'] = await viewModel.getBannerHeaderData();

    for (let i = 0; i < this.buildListDataS['build'].data.homeNewsList.newsListData.list.length ; i++) {
      this.dataSource.push(new NewsInfoItem({
        title: this.buildListDataS['build'].data.homeNewsList.newsListData.list[i].title,
        content: 'string',
        headImg:'string',
        nickNameDisplay:this.buildListDataS['build'].data.homeNewsList.newsListData.list[i].userInfo.nickNameDisplay
      }))
    }

    for (let index = 0; index < this.recommendMenuDatas['build'].data.houseCityDirectories.length; index++) {
      this.menuArry.push(new MenuModel({
        id: this.recommendMenuDatas['build'].data.houseCityDirectories[index].id,
        title:this.recommendMenuDatas['build'].data.houseCityDirectories[index].title,
        imageUrl:this.recommendMenuDatas['build'].data.houseCityDirectories[index].imageUrl,
        url:this.recommendMenuDatas['build'].data.houseCityDirectories[index].url,
        hot:this.recommendMenuDatas['build'].data.houseCityDirectories[index].hot,
      }))
    }

    BLog.i('zm')
  }

  build() {
    Row() {
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