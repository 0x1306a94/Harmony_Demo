import {getFirstMenuList, getSecondMenuList, MenuData} from '../model/menuListDataModel'
import display from '@ohos.display';

@Component
export struct MenuLayout {
  // 第一页九宫格数据
  private firstMenuList = getFirstMenuList()
  // 第二页九宫格数据
  private secondMenuList = getSecondMenuList()
  // 指示器的高度
  private indicatorHeight = 0
  // 页面滑动的百分比
  private slidPercent: number = 0
  private scroller: Scroller = new Scroller()
  // 容器的高度
  // @Link headerHeight: number
  private headerHeight: number = 180
  // 容器的高度因为headerHeight在滑动时会不断变化，所以放在aboutToAppear中初始化
  private pageHeight: number = 180
  // 上次手指按下的位置
  private lastX: number;

  // 滑动监听
  private onSlidChange: (slidPercent: number) => void = (slidPercent: number) => {
    console.log('onSlidChange slidPercent = ' + slidPercent)
  }

  // aboutToAppear() {
  //   this.pageHeight = this.headerHeight
  // }

  @Builder genMenuLayout(menuList: MenuData[]) {
    Flex({ direction: FlexDirection.Row, wrap: FlexWrap.Wrap }) {
      ForEach(menuList, (item: MenuData) => {
        Column() {
          Image(item.src).width(40).height(40).objectFit(ImageFit.Cover).borderRadius(20)
          Text(item.name).height(20).fontSize(14).margin({top:10})
        }.width('20%').backgroundColor('#F7F7F7')
        .height((this.pageHeight - this.indicatorHeight) / 2)
        .onClick(() => {
          console.log('=======onClick  item.name ===' + item.name)
        })
        .alignItems(HorizontalAlign.Center)
        .justifyContent(FlexAlign.Center)
      }, item => item.id)
    }.width('100%').backgroundColor('#F7F7F7')
  }

  build() {
    Flex({ direction: FlexDirection.Row, wrap: FlexWrap.NoWrap }) {
      this.genMenuLayout(this.secondMenuList)
    }.height(this.pageHeight)
    // Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {
    //   Scroll(this.scroller) {
    //     Flex({ direction: FlexDirection.Row, wrap: FlexWrap.NoWrap }) {
    //       this.genMenuLayout(this.firstMenuList)
    //       this.genMenuLayout(this.secondMenuList)
    //     }.height('100%')
    //   }
    //   .scrollable(ScrollDirection.Horizontal)
    //   .height(this.headerHeight - this.indicatorHeight)
    //   .onScroll((xOffset: number, yOffset: number) => {
    //
    //     // console.log('这是啥 =====xxx ' + this.scroller.currentOffset().xOffset)
    //     // console.log('当前屏幕尺寸告诉我 =====xxx ' + display.getDefaultDisplaySync().width)
    //     // 计算当前滑动的距离百分比
    //     this.slidPercent = this.scroller.currentOffset().xOffset / display.getDefaultDisplaySync().width/2
    //     // this.headerHeight = this.pageHeight
    //     // this.headerHeight = this.pageHeight + (this.pageHeight - this.indicatorHeight) * this.slidPercent
    //     if (this.onSlidChange instanceof Function) {
    //       this.onSlidChange(this.slidPercent)
    //     }
    //   })
    //
    //   // 指示器
    //   // Row() {
    //   //   Column()
    //   //     .width(10)
    //   //     .height(10)
    //   //     .backgroundColor(Color.Orange)
    //   //     .borderRadius(5)
    //   //     .opacity((1 - this.slidPercent) < 0.3 ? 0.3 : (1 - this.slidPercent))
    //   //
    //   //   Progress({ value: this.slidPercent * 100, total: 100, style: ProgressStyle.Linear })
    //   //     .color(Color.Orange)
    //   //     .value(this.slidPercent * 100)
    //   //     .width(30)
    //   //     .height(10)
    //   //     .borderRadius(5)
    //   //       //          .backgroundColor(Color.Grey)
    //   //     .margin({ left: 5 })
    //   // }.height(this.indicatorHeight)
    // }.onTouch((event: TouchEvent) => {
    //   this.handTouchEvent(event)
    // }).width('100%')
  }

  // 处理手势，在手指抬起时处理展示页面
  handTouchEvent(event: TouchEvent): void{
    if (event.type === TouchType.Down) {
      this.lastX = event.touches[0].x
    } else if (event.type === TouchType.Move) {

    } else if (event.type === TouchType.Up || event.type === TouchType.Cancel) {
      // 滑动的距离
      let dis: number = px2vp(event.touches[0].x - this.lastX)

      let needChangePage: boolean = Math.abs(dis) > 120

      if (needChangePage) { // 需要切换
        this.scroller.scrollTo({
          xOffset: dis > 0 ? 0 : display.getDefaultDisplaySync().width/2,
          yOffset: 0,
          animation: { duration: 200, curve: Curve.EaseOut }
        })
      } else { // 不需切换页面
        let showFirstPage: boolean = this.scroller.currentOffset().xOffset < display.getDefaultDisplaySync().width/6
        this.scroller.scrollTo({
          xOffset: showFirstPage ? 0 : display.getDefaultDisplaySync().width/2,
          yOffset: 0,
          animation: { duration: 200, curve: Curve.EaseOut }
        })
      }
    }
  }
}