import { ThreadFormatter } from '@ohos/xlog/src/main/ets/components/formatter/ThreadFormatter'
import { MenuModel } from '../model/menuModel'
import { HomeNewsInfoItem } from '../bean/homeNewsInfoModel'
import { BaseResponse } from '../model/response/BasicResponse'
import { BLog } from '../utils/BLog'
import {TabLayout} from '../component/horizontalTabs'
import {SearchBar} from '../component/searchBar'
import {MenuLayout} from '../component/header'
import { TableView } from '../component/tabView'
import { ApiManager } from '../network/ApiManager'
import { BuildInfoModel } from '../bean/buildInfoModel'

@Entry
@Component
export struct HomeView {

  // 新房流
  @Provide('buildListDatas') buildListDatas: { [key: string]: BaseResponse.BuildingData } = {};
  @Provide buildFeedArry: Array<BuildInfoModel> =[]

  // 家居流
  @Provide('newsListDatas') newsListDatas: { [key: string]: BaseResponse.HomeNewsFeedData } = {};
  @Provide dataSource: Array<HomeNewsInfoItem> =[]

  // 顶部菜单栏
  @Provide('recommendMenuDatas') recommendMenuDatas: { [key: string]: BaseResponse.RecommendHeaderData } = {};
  @Provide menuArry: Array<MenuModel> =[]


  @State titleArr: string[] = ['新房', '咨询', '家居']

  @State currentIndex: number  = 0
  private swiperController: SwiperController = new SwiperController()
  // 头部banner高度
  @State  headerHeight: number = 180
  // tab标签栏的高度
  private tabHeight = 50
  // 搜索栏高度
  @State searchBarHeight: number = 50
  private scrollY: number = 0
  @State tabPosY: number = vp2px(this.headerHeight + this.searchBarHeight)



  @State tempDataSource: Array<string> = ['1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20'];
  scroller: Scroller = new Scroller()


  async aboutToAppear(){

    // 咨询feed流
    this.buildListDatas['build'] = await ApiManager.getInstance().getBuildingFeedData();
    // 咨询feed流
    this.newsListDatas['build'] = await ApiManager.getInstance().getNewsData();
    // 顶部菜单
    this.recommendMenuDatas['build'] = await ApiManager.getInstance().getBannerHeaderData();

    for (let i = 0; i < this.buildListDatas['build'].data.projectList.projectFeed.content.length ; i++) {
      let  buildInfoModel = new BuildInfoModel({
        pid:this.buildListDatas['build'].data.projectList.projectFeed.content[i].pid,
        projName:this.buildListDatas['build'].data.projectList.projectFeed.content[i].projName,
        projPhotoPath:this.buildListDatas['build'].data.projectList.projectFeed.content[i].projPhotoPath,
        districtNames:this.buildListDatas['build'].data.projectList.projectFeed.content[i].districtNames,
        circleDesc:this.buildListDatas['build'].data.projectList.projectFeed.content[i].circleDesc,
        constructTypesDesc:this.buildListDatas['build'].data.projectList.projectFeed.content[i].constructTypesDesc,
        projFeatureDesc:this.buildListDatas['build'].data.projectList.projectFeed.content[i].projFeatureDesc,
        propertyTypeDesc:this.buildListDatas['build'].data.projectList.projectFeed.content[i].propertyTypeDesc,
        saleStatus:this.buildListDatas['build'].data.projectList.projectFeed.content[i].saleStatus,
        openStartTime:this.buildListDatas['build'].data.projectList.projectFeed.content[i].openStartTime,
        priceDesc:this.buildListDatas['build'].data.projectList.projectFeed.content[i].priceDesc,
        priceType:this.buildListDatas['build'].data.projectList.projectFeed.content[i].priceType,
        marketingInfo:this.buildListDatas['build'].data.projectList.projectFeed.content[i].marketingInfo,
        maxBuildingArea:this.buildListDatas['build'].data.projectList.projectFeed.content[i].maxBuildingArea,
        minBuildingArea:this.buildListDatas['build'].data.projectList.projectFeed.content[i].minBuildingArea,
        welfareList:this.buildListDatas['build'].data.projectList.projectFeed.content[i].welfareList,
        vrUrl:this.buildListDatas['build'].data.projectList.projectFeed.content[i].vrUrl,
        kanfangtuanTitle:this.buildListDatas['build'].data.projectList.projectFeed.content[i].kanfangtuanTitle,
        liveStatus:this.buildListDatas['build'].data.projectList.projectFeed.content[i].liveStatus,
        previewLiveTitle:this.buildListDatas['build'].data.projectList.projectFeed.content[i].previewLiveTitle,
      });

      this.buildFeedArry.push(buildInfoModel)
    }

    for (let i = 0; i < this.newsListDatas['build'].data.homeNewsList.newsListData.list.length ; i++) {
      this.dataSource.push(new HomeNewsInfoItem({
        title: this.newsListDatas['build'].data.homeNewsList.newsListData.list[i].title,
        publishTime: this.newsListDatas['build'].data.homeNewsList.newsListData.list[i].publishTime,
        headImg:this.newsListDatas['build'].data.homeNewsList.newsListData.list[i].headImg,
        // headImg:getHeaderImgeurl(this.newsListDatas['build'].data.homeNewsList.newsListData.list[i].headImg),
        nickNameDisplay:this.newsListDatas['build'].data.homeNewsList.newsListData.list[i].userInfo.nickNameDisplay
      }))
    }

    // 这个是数据处理
    for (let index = 0; index < this.recommendMenuDatas['build'].data.houseCityDirectories.length; index++) {
      if (this.recommendMenuDatas['build'].data.houseCityDirectories[index].title !== '直播') {
        this.menuArry.push(new MenuModel({
          id: this.recommendMenuDatas['build'].data.houseCityDirectories[index].id,
          title:this.recommendMenuDatas['build'].data.houseCityDirectories[index].title,
          imageUrl:this.recommendMenuDatas['build'].data.houseCityDirectories[index].imageUrl,
          url:this.recommendMenuDatas['build'].data.houseCityDirectories[index].url,
          hot:this.recommendMenuDatas['build'].data.houseCityDirectories[index].hot,
        }))
      }
    }
    // 针对60行的封装方法
    // this.menuArry = await ApiManager.getInstance().getBannerHeaderDataNew();



    BLog.i('zm')

    function getHeaderImgeurl(originUrl:string): string {
      if (originUrl.startsWith("http")) {
        // 如果以 "http" 开头，则直接使用头像的 URL
        return originUrl
      } else {
        // 如果不以 "http" 开头，则拼接默认的 URL 前缀
        return "https://t4.focus-img.cn" + originUrl;
      }
    }
  }


  build() {
    Stack({ alignContent: Alignment.Top }) {

      // 顶部搜索框
      SearchBar({ searchBarHeight: this.searchBarHeight })

      Row() {
        // tab栏
        TabLayout({
          titleArr: $titleArr,
          currentIndex: $currentIndex,
          tabSelected: (position: number, title: string) => {
            this.currentIndex = position
            console.log('onTabSelected position = ' + position + ', title = ' + title)
            //            this.swiperController.showNext()
          },
        }).width('100%').padding({left:15,right:15}).backgroundColor('#F7F7F7')
      }
      .width('100%')
      .height(this.tabHeight)
      .markAnchor({ x: 0, y: 0 })
      .position({ y: this.tabPosY + 'px', x: 0 })
      .zIndex(10)

      Scroll(this.scroller) {
        Column() {
          // 顶部菜单栏
          MenuLayout()

          Swiper(this.swiperController) {
            ForEach(this.titleArr, (item) => {
              Column() {
                TableView({cellType:$currentIndex})

                // List({ space: 0, initialIndex: 0 }) {
                //   ForEach(this.tempDataSource, (item:string,index) => {
                //     ListItem() {
                //       Column(){
                //         Text('这是第几行' +item)
                //           .width('100%').height(50).fontSize(22)
                //           .textAlign(TextAlign.Start).backgroundColor(0xFFFFFF)
                //         Text('这个是空数据的第几行' +item)
                //           .width('100%').height(50).fontSize(19)
                //           .textAlign(TextAlign.Start).backgroundColor(0xFFFFFF)
                //       }.height(100).backgroundColor(Color.Grey).borderRadius(20)
                //     }.borderRadius(20)
                //   }, item => item)
                // }.backgroundColor(Color.Green)
              }
            })
          }
          .index(0)
          .autoPlay(false)
          .indicator(false) // 默认开启指示点
          .loop(false) // 默认开启循环播放
          .vertical(false) // 默认横向切换
          .itemSpace(0)
          .index(this.currentIndex)
          .backgroundColor('#F7F7F7')
          .margin({ top: this.tabHeight })
          .flexGrow(1)
          .width('100%')
          .onChange((index: number) => {
            console.info(index.toString())
            this.currentIndex = index
          })

        }
      }
      .scrollBar(BarState.Off)
      .margin({ top: this.searchBarHeight })
      .backgroundColor('#F4F4F4')
      .onScroll((xOffset: number, yOffset: number) => {
        this.scrollY += this.scroller.currentOffset().yOffset
        this.tabPosY = vp2px(this.scroller.currentOffset().yOffset)  <  vp2px(this.headerHeight + this.searchBarHeight)?
        vp2px(this.headerHeight + this.searchBarHeight - this.scroller.currentOffset().yOffset): vp2px(this.searchBarHeight)
      })


    }.width('100%')
  }



}