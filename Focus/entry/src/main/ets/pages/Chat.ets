import { NewsZXModel } from '../bean/newsZXModel';
import { MenuLayout } from '../component/header';
import { BuildListView } from '../component/buildListView';
import { SearchBar } from '../component/searchBar';

@Entry
@Component
export struct ChatView {
  scroller: Scroller = new Scroller()
  listscroller: Scroller = new Scroller()
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9,10, 11, 12, 13, 14, 15, 16, 17, 18, 19]

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      Scroll(this.scroller) {
        List({scroller:this.listscroller}) {
          ForEach(this.arr, (item) => {
            ListItem() {
              Text(item.toString())
                .width('100%')
                .height(150)
                .backgroundColor(0xFFFFFF)
                .borderRadius(15)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .margin({ top: 10 })
            }.onAppear(()=>{
              console.info('apper = chatitem 出现了' )
            })
          }, item => item)

        }.width('100%')
        .onScrollIndex((start: number, end: number) => {
          console.info('start===== ' + start.toString() + ' end = ' + end.toString())
        })
      }
      .scrollable(ScrollDirection.Vertical) // 滚动方向纵向
      .scrollBar(BarState.On) // 滚动条常驻显示
      .scrollBarColor(Color.Gray) // 滚动条颜色
      .scrollBarWidth(10) // 滚动条宽度
      .edgeEffect(EdgeEffect.None)
      .onScroll((xOffset: number, yOffset: number) => {
        console.info(xOffset + ' ' + yOffset)
      })

      .onScrollEdge((side: Edge) => {
        console.info('To the edge')
      })

      Button('scroll 150')
        .onClick(() => { // 点击后下滑指定距离150.0vp
          this.scroller.scrollBy(0, 150)
        })
        .margin({ top: 10, left: 20 })
      Button('scroll 100')
        .onClick(() => { // 点击后滑动到指定位置，即下滑100.0vp的距离
          this.scroller.scrollTo({ xOffset: 0, yOffset: this.scroller.currentOffset().yOffset + 100 })
        })
        .margin({ top: 60, left: 20 })
      Button('back top')
        .onClick(() => { // 点击后回到顶部
          this.scroller.scrollEdge(Edge.Top)
        })
        .margin({ top: 110, left: 20 })
      Button('next page')
        .onClick(() => { // 点击后滑到下一页
          this.scroller.scrollPage({ next: true })
        })
        .margin({ top: 170, left: 20 })
    }.width('100%').height('100%').backgroundColor(0xDCDCDC)
  }
}