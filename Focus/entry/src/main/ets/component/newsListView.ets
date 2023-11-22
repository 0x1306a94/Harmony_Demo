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

function getHeaderImgeurl(originUrl: string): string {
  if (originUrl.startsWith("http")) {
    // 如果以 "http" 开头，则直接使用头像的 URL
    return originUrl
  } else {
    // 如果不以 "http" 开头，则拼接默认的 URL 前缀
    return "https://t4.focus-img.cn" + originUrl;
  }
}


function jjCellisShowImageHeight(item: HomeNewsInfoItem): number {
  if (item.headImg == null) {
    return 80
  } else {
    return 100
  }
}


//TODO: 这里不需要用column包装，不然和首页无法滚动联动
@Component
export struct NewsListView {
  @Link newsIsEdn: boolean; // 当前列表尾部索引
  @State offsetY: number = 0 // 列表y坐标偏移量
  private downY: number = 0 // 按下的y坐标
  private lastMoveY: number = 0 // 上一次移动的坐标
  private endIndex: number = 0 // 当前列表尾部索引
  private loadMoreHeight = 100 // 触发上拉加载的阈值高度

  @State isLoadMore: boolean = false // 是否可以加载更多，上拉加载的布局是否显示
  private isLoading: boolean = false // 是否加载中，加载中不进入触摸逻辑
  @State isShowRetry: boolean = false // 点击重试 是否显示


  @State newsPageNumber: number = 2;
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
          if (this.newsIsEdn == true) {
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
    } else { // 关闭加载更多
      this.isLoadMore = false
      this.isLoading = false
    }
  }

  /**
   * mock 产生更多数据
   */
  private async loadMoreData() {
    await ApiManager.getInstance().getHomeNewsFeedManager(this.newsPageNumber)
      .then((data: BaseResponse.HomeNewsFeedData) => {
        if (data.data.status == 1) {
          this.isShowRetry = true
        } else {
          this.newsPageNumber++;
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

    List({ space: 0 }) { //家居
      LazyForEach(DataSourceManager.getFeedHomeDataSource(), (item: HomeNewsInfoItem) => {
        ListItem() {
          Flex({
            direction: FlexDirection.Row,
            alignItems: ItemAlign.Center,
            alignContent: FlexAlign.Center,
            justifyContent: FlexAlign.SpaceBetween
          }) {
            Column() {
              Text(item.title)
                .textOverflow({ overflow: TextOverflow.Clip })
                .fontColor('#1F1F1F')
                .fontSize(16)
                .fontWeight(600)
                .maxLines(2)
                .margin({ right: 10 })
                .textOverflow({ overflow: TextOverflow.Ellipsis })

              Row() {
                Text(item.userInfo.nickNameDisplay)
                  .fontColor('#BEBEBE').fontSize(12).fontWeight(400).margin({ right: 20 })
                Text(StringUtil.timeStampToAgoHours(parseInt(item.publishTime, 10)))
                  .fontColor('#BEBEBE').fontSize(12).fontWeight(400)
              }.width('100%').margin({ left: 10 })
            }.justifyContent(FlexAlign.SpaceBetween).height('80').margin({ top: 0, bottom: 0 })

            // 判断用户头像的 URL 是否为空字符串
            if (item.headImg === null) {
            } else {
              Image(getHeaderImgeurl(item.headImg)) // 直接加载网络地址，请填写一个具体的网络图片地址
                .alt($r('app.media.placeholder')) // 使用alt，在网络图片加载成功前使用占位图
                .borderRadius(10)
                .objectFit(ImageFit.Cover)
                .width(110)
                .height(jjCellisShowImageHeight(item) - 20)
                .flexShrink(0)
            }

          }
        }
        .borderRadius(20)
        .height(jjCellisShowImageHeight(item))
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
            Text('正在加载...').margin({left:10})
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