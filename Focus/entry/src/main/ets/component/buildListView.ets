import { BuildInfoModel } from '../bean/buildInfoModel';
import { HomeNewsInfoItem } from '../bean/homeNewsInfoModel'
import { NewsZXModel } from '../bean/newsZXModel';
import { DataSourceManager } from '../model/DataSourceManager';
import { BaseResponse } from '../model/response/BasicResponse';
import { ApiManager } from '../network/ApiManager';
import { StringUtil } from '../utils/StringUtil';

enum StatusType {
  SUCCESS,
  FAIL
}



function checkString(originUrls: string[]): string {
  if (originUrls.length == 0 || originUrls == null) {
    // 如果以 "http" 开头，则直接使用头像的 URL
    return ''
  } else {
    // 如果不以 "http" 开头，则拼接默认的 URL 前缀
    return '·' + originUrls[0];
  }
}


//TODO: 这里不需要用column包装，不然和首页无法滚动联动
@Component
export struct BuildListView {
  private scrollerForList: Scroller = new Scroller();
  @Link cellType: number;
  @Link isEdn: boolean; // 当前列表尾部索引
  @State offsetY: number = 0 // 列表y坐标偏移量
  private downY: number = 0 // 按下的y坐标
  private lastMoveY: number = 0 // 上一次移动的坐标
  private endIndex: number = 0 // 当前列表尾部索引
  private loadMoreHeight = 100 // 触发上拉加载的阈值高度

  @State isLoadMore: boolean = false // 是否可以加载更多，上拉加载的布局是否显示
  private isLoading: boolean = false // 是否加载中，加载中不进入触摸逻辑
  @State isShowRetry: boolean = false // 点击重试 是否显示

  @State buildPageNumber: number = 2;
  /**
   * 处理onTouch事件
   */
  handleTouchEvent(event: TouchEvent) {
    switch (event.type) {
      case TouchType.Down: // 手指按下
        this.downY = event.touches[0].y; // 记录按下的y坐标
        this.lastMoveY = event.touches[0].y;
        break;

      case TouchType.Move: // 手指滑动
        if (this.isLoading) { // 更多数据加载中，不进入处理逻辑
          return;
        }
        if (event.touches[0].y - this.lastMoveY < 0) { // 手指上滑
          // 因为加载更多是在列表后面新增一个item，当一屏能够展示全部列表，endIndex 为 length+1
          // if (this.endIndex == this.tempDataSource.length - 1||this.endIndex == this.tempDataSource.length) {
          if (this.isEdn == true) {
            this.offsetY = event.touches[0].y - this.downY; // 滑动的偏移量
            if (Math.abs(this.offsetY) > this.loadMoreHeight) { // 数据加载的阈值
              this.isLoadMore = true // 可以刷新了
              this.offsetY = this.loadMoreHeight + this.offsetY * 0.1 // 偏移量缓慢增加
            }
          }
        }
        this.lastMoveY = event.touches[0].y;
        break;

      case TouchType.Up: // 手指抬起

      case TouchType.Cancel: // 事件取消
        if (this.isLoading) { // 更多数据加载中，不进入处理逻辑
          return;
        }
        this.touchUpLoadMore()
        break
    }
  }

  /**
   * 手指抬起，处理加载更多
   */
  private async touchUpLoadMore() {
    animateTo({
      duration: 300, // 动画时长
    }, () => {
      this.offsetY = 0 // 偏移量设置为0
    })

    if (this.isLoadMore) {
      this.isLoading = true // 加载中...
      this.loadMoreData()
      // setTimeout(() => { // 模拟耗时操作
      //   this.getData()
      //     .then(data => {
      //       if (data === StatusType.SUCCESS) { // 加载成功
      //         this.isShowRetry = false
      //         this.loadMoreData() // 加载数据
      //         this.isLoadMore = false // 关闭加载更多
      //         this.isLoading = false
      //       }
      //     })
      //     .catch(error => { // 加载失败
      //       this.isShowRetry = true // 展示“点击重试”
      //       console.info('error message ' + error)
      //     })
      // }, 2000)
    } else { // 关闭加载更多
      this.isLoadMore = false
      this.isLoading = false
    }
  }

  /**
   * mock 产生更多数据
   */
  private async loadMoreData() {
    console.info('mock=== 产生更多数据=============')
    await ApiManager.getInstance().getBuildingFeedDataManager(this.buildPageNumber)
      .then((data: BaseResponse.BuildingData) => {
        if (data.data.status == 1) {
          this.isShowRetry = true
        } else {
          this.buildPageNumber++;
          this.isShowRetry = false
          this.isLoadMore = false // 关闭加载更多
          this.isLoading = false
        }
      });
  }

  /**
   * 模拟数据加载结果
   */
  private getData(): Promise<StatusType> {
    return new Promise((resolve, reject) => {
      const randomNumber: number = Math.random();
      if (randomNumber >= 0.5) {
        resolve(StatusType.SUCCESS)
      } else {
        reject(StatusType.FAIL)
      }
    })
  }

  build() {
    List({ space: 0, scroller: this.scrollerForList }) {
      LazyForEach(DataSourceManager.getBuildingDataSource(), (item: BuildInfoModel, index: number) => {
        ListItem() {
          Column() {
            Text('' + item.marketingInfo)
              .width('100%')
              .height(30)
              .fontSize(12)
              .fontColor('#FFB093')
              .textAlign(TextAlign.Start)
              .margin({ bottom: 5 })

            Row() {
              Image("https://t2.focus-img.cn/" + item.projPhotoPath) // 直接加载网络地址，请填写一个具体的网络图片地址
                .alt($r('app.media.placeholder')) // 使用alt，在网络图片加载成功前使用占位图
                .width(120)
                .height(90)
                .borderRadius(10)
                .margin({ right: 20 })
              Column() {

                Row() {
                  //saleStatus：0：待售  1:在售
                  if (item.saleStatus == 0) {
                    Text('待售')
                      .width('100%')
                      .height(18)
                      .width(32)
                      .fontSize(12)
                      .fontColor('#FFBB41')
                      .textAlign(TextAlign.Start)
                      .borderWidth(1)
                      .borderColor('#FFBB41')
                      .borderRadius(5)
                      .margin({ right: 5 })
                      .textAlign(TextAlign.Center)
                  } else if (item.saleStatus == 1) {
                    Text('在售')
                      .width('100%')
                      .height(18)
                      .width(32)
                      .fontSize(12)
                      .fontColor('#558FFF')
                      .textAlign(TextAlign.Start)
                      .borderWidth(1)
                      .borderColor('#558FFF')
                      .borderRadius(5)
                      .margin({ right: 5 })
                      .textAlign(TextAlign.Center)
                  }

                  Text(item.projName)
                    .height(18)
                    .fontSize(16)
                    .fontWeight(600)
                    .textAlign(TextAlign.Start)
                    .fontColor('#1f1f1f')
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .width('50%')
                    .maxLines(1)
                }.width('100%').alignItems(VerticalAlign.Bottom)

                Row() {
                  Text('' + item.districtNames[0] + checkString(item.circleDesc))
                    .height(12)
                    .fontSize(12)
                    .fontWeight(400)
                    .textAlign(TextAlign.Start)
                    .fontColor('#606060')
                  Text('｜')
                    .height(12)
                    .fontSize(12)
                    .fontWeight(400)
                    .textAlign(TextAlign.Start)
                    .fontColor('#606060')
                    .margin({ left: 5, right: 5 })
                  if (item.minBuildingArea !== null && item.maxBuildingArea !== null) {
                    Text('建面' + item.minBuildingArea + '-' + item.maxBuildingArea + "\u33a1")
                      .height(12)
                      .fontSize(12)
                      .fontWeight(400)
                      .textAlign(TextAlign.Start)
                      .fontColor('#606060')
                  }

                }.width('100%')


                Row() {
                  ForEach(item.propertyTypeDesc, (item: string) => {
                    Text('' + item)
                      .height(18)
                      .fontSize(12)
                      .fontWeight(400)
                      .borderRadius(4)
                      .textAlign(TextAlign.Center)
                      .fontColor('#606060')
                      .backgroundColor('#F0F0F0')
                      .opacity(0.5)
                      .padding({ left: 5, right: 5 })
                      .margin({ right: 5 })
                  }, (item: number) => item.toString())
                }.width('100%')

                Row() {
                  if (item.priceDesc == '价格待定') {
                    Text('价格待定')
                      .height(20)
                      .fontSize(20)
                      .fontWeight(600)
                      .textAlign(TextAlign.Start)
                      .fontColor('#FD4D39')
                  } else {
                    Text(item.priceDesc.substr(0, item.priceDesc.length - 3))
                      .height(20)
                      .fontSize(20)
                      .fontWeight(600)
                      .textAlign(TextAlign.Start)
                      .fontColor('#FD4D39')
                    Text('元/平')
                      .height(12)
                      .fontSize(11)
                      .fontWeight(400)
                      .textAlign(TextAlign.Center)
                      .fontColor('#FD4D39')
                      .margin({ left: 5 })
                  }

                }.width('100%').alignItems(VerticalAlign.Bottom)
              }
              .height(90)
              .justifyContent(FlexAlign.SpaceBetween)
            }.alignItems(VerticalAlign.Center)
          }.padding({ bottom: 10 })
        }
        .borderRadius(20)
        .height(140)
        .backgroundColor(Color.White)
        .margin({ left: 15, right: 15, top: 20 })
        .padding({ left: 10, right: 10 })
        .onClick(() => {
        })
      }, item => item)

      ListItem() { // 加载更多布局
        Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
          if (this.isShowRetry) {
            Text('加载失败，点击重试');
          } else {
            LoadingProgress().width(30).height(30)
            Text('正在加载...').margin({ left: 10 })
          }
        }.width('100%').height(40)

      }.visibility(this.isLoadMore ? Visibility.Visible : Visibility.None)

    }.cachedCount(5).backgroundColor('#F7F7F7')
    .onScrollIndex((start: number, end: number) => {
      console.info('start = ' + start.toString() + ' end = ' + end.toString())
      this.endIndex = end
    })
    .onTouch((event: TouchEvent) => {
      this.handleTouchEvent(event)
    })

  }
}