import {ItemData, ImageData, getImageList} from '../model/imageListDataModel'
import router from '@system.router'

@Entry
@Component
export struct WaterFallLayout {
  @State itemDataList: ItemData[] = getImageList().map((imageData: ImageData) => {
    let itemData: ItemData = new ItemData()
    itemData.id = imageData.id
    itemData.name = imageData.name
    itemData.src = imageData.src
    return itemData
  })

  // 一行展示的列数
  private columnsCount: number = 2
  // 每张图片间的间距
  private gap: number = 8
  // 每张图片的宽度
  private imageWidth = (360 - (this.columnsCount + 1) * this.gap) / this.columnsCount
  // 已加载完毕图片的数量
  private loadCount: number= 0

  build() {
    Stack() {
      ForEach(this.itemDataList, (item: ItemData) => {
        Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, alignContent: FlexAlign.Start }) {
          Image(item.src)
            .width('100%')
            .objectFit(ImageFit.Contain)
            .onComplete((msg: {
              width: number,
              height: number,
              componentWidth: number,
              componentHeight: number
            }) => {
              this.loadCount++
              // 图片宽高比
              let picRatio: number = msg.width / msg.height
              // 屏幕密度比
              let densityRatio = msg.componentWidth / this.imageWidth
              // 图片占用的宽度
              item.width = msg.componentWidth
              // 图片应该占用的高度
              item.height = (msg.componentWidth / picRatio / densityRatio) + 30
              this.calcPositionWhenLoadComplete()
            })
            .border({ radius: 5 })
            .margin({ top: -15 })
          Text(item.name)
            .height(20)
            .width('100%')
            .textAlign(TextAlign.Center)
            .fontSize(15)
            .margin({ top: -10 })
            .fontColor(Color.Black)
        }
        .border({ radius: 5 })
        .padding(0)
        .backgroundColor(Color.White)
        .width(this.imageWidth)
        .height(item.height)
        .position({ x: item.left, y: item.top })
        .onClick(() => {
          console.log('=============stack click')
          router.push({
            uri: 'pages/preview',
            params: { shareId: item.id, index: item.id }
          })
        })
      }, item => item.id)
    }
    .width('100%')
    .margin({ bottom: 100 })
    .backgroundColor('#F4F4F4')
  }

  calcPositionWhenLoadComplete(): void{
    if (this.loadCount == this.itemDataList.length) {
      let colHeightArry: number[] = [];
      for (let i = 0;i < this.itemDataList.length; i++) {
        if (i < this.columnsCount) {
          // 确定第一行
          this.itemDataList[i].top = this.gap;
          this.itemDataList[i].left = (this.imageWidth + this.gap) * i + this.gap
          colHeightArry.push(this.itemDataList[i].height + this.gap);
        } else {
          // 其它行 先找到数组中的最小高度以及它的索引
          let minHeight = colHeightArry[0]; // 定义最小的高度
          let index = 0; // 定义最小高度的下标
          for (let j = 0;j < this.columnsCount; j++) {
            if (minHeight > colHeightArry[j]) {
              minHeight = colHeightArry[j];
              index = j;
            }
          }

          //  设置下一行的第一个盒子的位置
          //  top的值就是最小列的高度 + gap
          this.itemDataList[i].top = colHeightArry[index] + this.gap
          //  left的值就是最小距离左边的距离
          this.itemDataList[i].left = this.itemDataList[index].left

          // 修改最小列的高度
          // 最小列的高度 = 当前的高度 + 拼接的高度 + 间隙的高度
          colHeightArry[index] = colHeightArry[index] + this.itemDataList[i].height + this.gap;
        }
      }
      let str = JSON.stringify(this.itemDataList)
      this.itemDataList = JSON.parse(str)
    }
  }
}