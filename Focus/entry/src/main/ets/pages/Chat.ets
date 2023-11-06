import {WaterFallLayout} from '../component/waterfalllayout'
import {TabLayout} from '../component/horizontalTabs'
import {SearchBar} from '../component/searchBar'
import {MenuLayout} from '../component/header'


@Entry
@Component
export struct ChatView {
  @State titleArr: string[] = ['关注', '附近', '达人探店', '优惠', '家居生活', '美食', '遛娃', '医美', '宠物', '运动健康', '教培']
  @State currentIndex: number  = 1
  private swiperController: SwiperController = new SwiperController()
  // 头部banner高度
  @State @Watch("onHeaderHeightUpdated") headerHeight: number = 160
  // tab标签栏的高度
  private tabHeight = 50
  // 搜索栏高度
  @State searchBarHeight: number = 50
  private scrollY: number = 0
  @State tabPosY: number = vp2px(this.headerHeight + this.searchBarHeight)

  build() {
    Stack({ alignContent: Alignment.Top }) {
      SearchBar({ searchBarHeight: this.searchBarHeight })
      Row() {
        TabLayout({
          titleArr: $titleArr,
          currentIndex: $currentIndex,
          tabSelected: (position: number, title: string) => {
            this.currentIndex = position
            console.log('onTabSelected position = ' + position + ', title = ' + title)
            //            this.swiperController.showNext()
          },
        })
      }
      .width('100%')
      .height(this.tabHeight)
      .markAnchor({ x: 0, y: 0 })
      .position({ y: this.tabPosY + 'px', x: 0 })
      .zIndex(10)

      Scroll() {
        Column() {
          MenuLayout({ headerHeight: $headerHeight })

          Swiper(this.swiperController) {
            ForEach(this.titleArr, (item) => {
              Column() {
                Text('Page ' + item).fontSize(25).margin(10)
                WaterFallLayout()
              }
            }, item => item)
          }
          .index(0)
          .autoPlay(false)
          .indicator(false) // 默认开启指示点
          .loop(false) // 默认开启循环播放
          .vertical(false) // 默认横向切换
          .itemSpace(0)
          .index(this.currentIndex)
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
        this.scrollY += yOffset
        this.tabPosY = vp2px(this.headerHeight) - this.scrollY <= 0
          ? vp2px(this.searchBarHeight) : vp2px(this.headerHeight + this.searchBarHeight) - this.scrollY
      })


    }.width('100%')
  }

  onHeaderHeightUpdated() {
    this.tabPosY = vp2px(this.headerHeight + this.searchBarHeight)
  }
}