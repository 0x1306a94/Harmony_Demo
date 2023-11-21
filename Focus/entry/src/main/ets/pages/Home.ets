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
import { NewsZXModel } from '../bean/newsZXModel'
import { HomeListView } from '../component/homeListView'

@Entry
@Component
export struct HomeView {


  // 顶部菜单栏
  @Provide menuArry: Array<MenuModel> =[]


  @State titleArr: string[] = ['新房', '资讯', '家居']

  @State currentIndex: number  = 0
  private swiperController: SwiperController = new SwiperController()
  // 头部banner高度
  @State  headerHeight: number = 180
  // tab标签栏的高度
  private tabHeight = 50
  // 搜索栏高度
  @State searchBarHeight: number = 50
  private scrollY: number = 0
  // @State tabPosY: number = vp2px(this.headerHeight + this.searchBarHeight)
  // 固定tab是否显示
  @State showTabPostison:boolean = false

  // 新房列表是否滑到底
  @State buildFeedisEnd:boolean = false
  @State zxFeedisEnd:boolean = false
  @State newFeedisEnd:boolean = false



  @State tempDataSource: Array<string> = ['1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20'];
  scroller: Scroller = new Scroller()


  async aboutToAppear(){

    await ApiManager.getInstance().getBuildingFeedDataManager(1); //新房
    await ApiManager.getInstance().getZXNewsFeedDataManager();   //资讯
    await ApiManager.getInstance().getHomeNewsFeedManager();     //家居



    // 这个是数据处理
    this.menuArry = await ApiManager.getInstance().getBannerHeaderDataNew();



    BLog.i('xxxx')

  }


  build() {
    Stack({ alignContent: Alignment.Top }) {

      // 顶部搜索框
      SearchBar({ searchBarHeight: this.searchBarHeight })
      // 固定tab栏
      Row() {
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
      .width('100%').height(this.tabHeight)
      .position({ y: 50, x: 0 })
      .zIndex(10).visibility(this.showTabPostison ? Visibility.Visible : Visibility.None)

      // Row() {
      //   // tab栏
      //   TabLayout({
      //     titleArr: $titleArr,
      //     currentIndex: $currentIndex,
      //     tabSelected: (position: number, title: string) => {
      //       this.currentIndex = position
      //       console.log('onTabSelected position = ' + position + ', title = ' + title)
      //       //            this.swiperController.showNext()
      //     },
      //   }).width('100%').padding({left:15,right:15}).backgroundColor('#F7F7F7')
      // }
      // .width('100%')
      // .height(this.tabHeight)
      // .markAnchor({ x: 0, y: 0 })
      // .position({ y: this.tabPosY + 'px', x: 0 })
      // .zIndex(10)

      Scroll(this.scroller) {
        Column() {
          // 顶部菜单栏
          MenuLayout().onVisibleAreaChange([0.0, 1.0], (isVisible: boolean, currentRatio: number) => {
            if (isVisible && currentRatio >= 0.0) {
              console.info('menu===  刚要显示:' + currentRatio)
              this.showTabPostison = false
            }
            if (!isVisible && currentRatio <= 0.0) {
              console.info('menu===  完全消失')
              this.showTabPostison = true
            }
          })
          // 滚动tab栏
          Row() {
            TabLayout({
              titleArr: $titleArr,
              currentIndex: $currentIndex,
              tabSelected: (position: number, title: string) => {
                this.currentIndex = position
              },
            }).width('100%').padding({left:15,right:15}).backgroundColor('#F7F7F7')
              .visibility(this.showTabPostison ? Visibility.None : Visibility.Visible)
          }
          .width('100%')
          .height(this.tabHeight)


          Swiper(this.swiperController) {
            ForEach(this.titleArr, (item) => {
              Column() {

                HomeListView({cellType:$currentIndex,isEdn:$buildFeedisEnd})

                // TableView({cellType:$currentIndex})

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
          // .margin({ top: 0 })
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
        this.buildFeedisEnd = false
        // this.scrollY += this.scroller.currentOffset().yOffset
        // this.tabPosY = vp2px(this.scroller.currentOffset().yOffset)  <  vp2px(this.headerHeight + this.searchBarHeight)?
        // vp2px(this.headerHeight + this.searchBarHeight - this.scroller.currentOffset().yOffset): vp2px(this.searchBarHeight)
      })
      .onScrollEdge((side: Edge) => {
        console.info('To the edge')
        if(this.currentIndex == 0){
          this.buildFeedisEnd = true
        }
      })




    }.width('100%').height('100%')
  }



}