import display from '@ohos.display';
import { NewsInfoItem } from '../bean/newsInfoModel'
import { StringUtil } from '../utils/StringUtil';


function getHeaderImgeurl(originUrl:string): string {
  if (originUrl.startsWith("http")) {
    // 如果以 "http" 开头，则直接使用头像的 URL
    return originUrl
  } else {
    // 如果不以 "http" 开头，则拼接默认的 URL 前缀
    return "https://t4.focus-img.cn" + originUrl;
  }
}


//TODO: 这里不需要用column包装，不然和首页无法滚动联动
@Component
export struct TableView {
  @Consume dataSource: Array<NewsInfoItem>;
  @Link cellType: number;

  // @State tempDataSource: Array<string> = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20'];

  build() {
    if (this.dataSource.length !== 0) {
      if (this.cellType == 0) { // 新房
        // 新房Item
        List({ space: 0, initialIndex: 0 }) {
          ForEach(this.dataSource, (item: string, index) => {
            ListItem() {
              Column() {
                Text('合景寰汇公寓，江边海景房，大卧室送车位' + item)
                  .width('100%')
                  .height(30)
                  .fontSize(12)
                  .fontColor('#FFB093')
                  .textAlign(TextAlign.Start)
                  .margin({ bottom: 5 })
                Row() {
                  Image("https://p9.itc.cn/q_70,c_lfill,w_688,h_384,g_face/images03/20231108/427f85734b7945ecb5c24405a89eda99.jpeg") // 直接加载网络地址，请填写一个具体的网络图片地址
                    .alt($r('app.media.icon')) // 使用alt，在网络图片加载成功前使用占位图
                    .width(120)
                    .height(90)
                    .borderRadius(10)
                    .margin({ right: 20 })
                  Column() {
                    Text('双清苑')
                      .width('100%')
                      .height(16)
                      .fontSize(16)
                      .fontWeight(600)
                      .textAlign(TextAlign.Start)
                      .fontColor('#1f1f1f')
                    Row() {
                      Text('大兴')
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
                      Text('建面 77-144m2')
                        .height(12)
                        .fontSize(12)
                        .fontWeight(400)
                        .textAlign(TextAlign.Start)
                        .fontColor('#606060')
                    }.width('100%')

                    Row() {
                      Text('VR寻宝')
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
                      Text('VR寻宝')
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
                      Text('VR寻宝')
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
                    }.width('100%')

                    Row() {
                      Text('38000')
                        .height(20)
                        .fontSize(20)
                        .fontWeight(600)
                        .textAlign(TextAlign.Start)
                        .fontColor('#FD4D39')
                      Text('万/套')
                        .height(12)
                        .fontSize(11)
                        .fontWeight(400)
                        .textAlign(TextAlign.Center)
                        .fontColor('#FD4D39')
                        .margin({ left: 5 })
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
          }, item => item)
        }
      }
      if (this.cellType == 1) { // 咨询
        List({ space: 0, initialIndex: 0 }) {
          ForEach(this.dataSource, (item: NewsInfoItem, index) => {
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
                    .textOverflow({ overflow: TextOverflow.Ellipsis })

                  Row() {
                    Text('搜狐焦点考点')
                      .fontColor('#BEBEBE').fontSize(12).fontWeight(400).margin({right:20})
                    Text('5小小时前')
                      .fontColor('#BEBEBE').fontSize(12).fontWeight(400)
                  }.width('100%').margin({left:10})
                }.justifyContent(FlexAlign.SpaceBetween).height('80').margin({top:0,bottom:0})

                Image("https://p9.itc.cn/q_70,c_lfill,w_688,h_384,g_face/images03/20231108/427f85734b7945ecb5c24405a89eda99.jpeg") // 直接加载网络地址，请填写一个具体的网络图片地址
                  .alt($r('app.media.icon')) // 使用alt，在网络图片加载成功前使用占位图
                  .borderRadius(10)
                  .objectFit(ImageFit.Cover)
                  .width(110).height(80).flexShrink(0)

              }
            }
            .borderRadius(20)
            .height(100)
            .backgroundColor(Color.White)
            .margin({ left: 15, right: 15, top: 20 })
            .padding({ left: 10, right: 10 })
          }, item => item)
        }
      }
      if (this.cellType == 2) { // 家居
        List({ space: 0, initialIndex: 0 }) {
          ForEach(this.dataSource, (item: NewsInfoItem, index) => {
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
                    .textOverflow({ overflow: TextOverflow.Ellipsis })

                  Row() {
                    Text(item.userInfo.nickNameDisplay)
                      .fontColor('#BEBEBE').fontSize(12).fontWeight(400).margin({right:20})
                    Text(StringUtil.timeStampToAgoHours(parseInt(item.publishTime,10)))
                      .fontColor('#BEBEBE').fontSize(12).fontWeight(400)
                  }.width('100%').margin({left:10})
                }.justifyContent(FlexAlign.SpaceBetween).height('80').margin({top:0,bottom:0})

                // 判断用户头像的 URL 是否为空字符串
                if (item.headImg === null) {
                }else {
                  Image(getHeaderImgeurl(item.headImg)) // 直接加载网络地址，请填写一个具体的网络图片地址
                    .alt($r('app.media.icon')) // 使用alt，在网络图片加载成功前使用占位图
                    .borderRadius(10)
                    .objectFit(ImageFit.Cover)
                    .width(110).height(80).flexShrink(0)
                }

              }
            }
            .borderRadius(20)
            .height(100)
            .backgroundColor(Color.White)
            .margin({ left: 15, right: 15, top: 20 })
            .padding({ left: 10, right: 10 })
          }, item => item)
        }
      }

    } else {
      Text('内容为空')
    }
    // 这样无联动
    // Row() {
    //   Column() {
    //     if(this.dataSource.length == 0){
    //       List({ space: 0, initialIndex: 0 }) {
    //         ForEach(this.tempDataSource, (item:string,index) => {
    //           ListItem() {
    //             Column(){
    //               Text('这是第几行' +item)
    //                 .width('100%').height(50).fontSize(22)
    //                 .textAlign(TextAlign.Start).backgroundColor(0xFFFFFF)
    //               Text('这个是空数据的第几行' +item)
    //                 .width('100%').height(50).fontSize(19)
    //                 .textAlign(TextAlign.Start).backgroundColor(0xFFFFFF)
    //             }.height(100).backgroundColor(Color.Grey).borderRadius(20)
    //           }.borderRadius(20)
    //         }, item => item)
    //       }
    //     }else {
    //       List({ space: 0, initialIndex: 0 }) {
    //       ForEach(this.dataSource, (item:NewsInfoItem,index) => {
    //         ListItem() {
    //           Column(){
    //             Text('' +item.title)
    //               .width('100%').height(50).fontSize(22)
    //               .textAlign(TextAlign.Start).backgroundColor(0xFFFFFF)
    //             Text('' +item.userInfo.nickNameDisplay)
    //               .width('100%').height(50).fontSize(19)
    //               .textAlign(TextAlign.Start).backgroundColor(0xFFFFFF)
    //           }.height(100).backgroundColor(Color.Grey).borderRadius(20)
    //         }.borderRadius(20)
    //       }, item => item)
    //     }
    //     }
    //   }.width('100%').height('100%').backgroundColor(0xDCDCDC).padding({ top: 0 })
    // }
    // .height('100%')
  }
}