@Component
export struct SearchBar {
  @Prop searchBarHeight: number
  private hotSearchKeywords: string[] = ['烤肉', '火锅', '海底捞', '东北菜']

  build() {
    Row() {
      Text('西安').fontSize(16).padding({ left: 15 }).height('100%')
      Image($r('app.media.ico_arrow_down')).width(20).height('100%').padding(3).objectFit(ImageFit.ScaleDown)
      // 搜索框
      Swiper() {
        ForEach(this.hotSearchKeywords, item => {
          Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center, }) {
            // 搜索图标
            Image($r('app.media.ico_search'))
              .width(15).height(15)

            Text(item)
              .height('100%')
              .fontSize(12)
              .fontColor('#505050')
              .margin({ left: 10 })
          }.width('100%')

        }, item => item)
      }
      .layoutWeight(1)
      .height('60%')
      .margin({ left: 15, right: 15 })
      .backgroundColor('#F1F1F1')
      .borderRadius(15)
      .vertical(true) // 方向：纵向
      .autoPlay(true) // 自动播放
      .indicator(false) // 隐藏指示器
      .interval(3000) // 切换间隔时间3秒

      Image($r('app.media.dot')).height('100%').width(30).margin({right:40}).padding(3).objectFit(ImageFit.ScaleDown)

    }.width('100%').height(this.searchBarHeight)
  }
}