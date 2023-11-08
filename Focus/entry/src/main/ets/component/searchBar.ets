@Component
export struct SearchBar {
  @Prop searchBarHeight: number
  private hotSearchKeywords: string[] = ['请输入楼盘名称', '请输入直播间名称']

  build() {
    Row() {
      Text('北京').fontSize(16).padding({ left: 15 }).height('100%')
      Image($r('app.media.ico_arrow_down')).width(20).height('100%').padding(3).objectFit(ImageFit.ScaleDown)
      // 搜索框
      Swiper() {
        ForEach(this.hotSearchKeywords, item => {
          Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center, }) {
            // 搜索图标
            Image($r('app.media.ico_search'))
              .width(15).height(15).margin({left:20})
            Text(item)
              .height('100%')
              .fontSize(13)
              .fontColor('#ADADAD')
              .margin({ left: 10 })
          }.width('100%')

        }, item => item)
      }
      .layoutWeight(1)
      .height('60%')
      .margin({ left: 15, right: 15 })
      .backgroundColor('#F7F7F7')
      .borderRadius(15)
      .vertical(true) // 方向：纵向
      .autoPlay(true) // 自动播放
      .indicator(false) // 隐藏指示器
      .interval(3000) // 切换间隔时间3秒
    }.width('100%').height(this.searchBarHeight)
  }
}