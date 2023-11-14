import display from '@ohos.display';
import { BuildInfoModel } from '../bean/buildInfoModel';
import { HomeNewsInfoItem } from '../bean/homeNewsInfoModel'
import { NewsZXModel } from '../bean/newsZXModel';
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

function checkString(originUrls:string[]): string {
  if (originUrls.length == 0 || originUrls == null) {
    // 如果以 "http" 开头，则直接使用头像的 URL
    return ''
  } else {
    // 如果不以 "http" 开头，则拼接默认的 URL 前缀
    return '·'+originUrls[0];
  }
}

function zxCellisShowImageHeight(item:NewsZXModel): number {
  if (item.headImg == null) {
    return 80
  } else {
    return 100
  }
}
function jjCellisShowImageHeight(item:HomeNewsInfoItem): number {
  if (item.headImg == null) {
    return 80
  } else {
    return 100
  }
}


//TODO: 这里不需要用column包装，不然和首页无法滚动联动
@Component
export struct TableView {
  // 新房
  @Consume buildFeedArry: Array<BuildInfoModel>;
  // 资讯
  @Consume newsZxArray: Array<NewsZXModel>;
  // 家居
  @Consume dataSource: Array<HomeNewsInfoItem>;

  @Link cellType: number;

  // @State tempDataSource: Array<string> = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20'];

  build() {
    if (this.dataSource.length !== 0) {
      if (this.cellType == 0) { // 新房
        // 新房Item
        List({ space: 0, initialIndex: 0 }) {
          ForEach(this.buildFeedArry, (item: BuildInfoModel, index) => {
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
                  Image("https://t2.focus-img.cn/"+item.projPhotoPath) // 直接加载网络地址，请填写一个具体的网络图片地址
                    .alt($r('app.media.icon')) // 使用alt，在网络图片加载成功前使用占位图
                    .width(120)
                    .height(90)
                    .borderRadius(10)
                    .margin({ right: 20 })
                  Column() {

                    Row(){
                      //saleStatus：0：待售  1:在售
                      if(item.saleStatus == 0){
                        Text('待售')
                          .width('100%').height(18).width(32).fontSize(12)
                          .fontColor('#FFBB41').textAlign(TextAlign.Start)
                          .borderWidth(1).borderColor('#FFBB41').borderRadius(5)
                          .margin({ right: 5 }).textAlign(TextAlign.Center)
                      }else if (item.saleStatus == 1) {
                        Text('在售')
                          .width('100%').height(18).width(32).fontSize(12)
                          .fontColor('#558FFF').textAlign(TextAlign.Start)
                          .borderWidth(1).borderColor('#558FFF').borderRadius(5)
                          .margin({ right: 5 }).textAlign(TextAlign.Center)
                      }

                      Text(item.projName)
                        .height(18).fontSize(16).fontWeight(600).textAlign(TextAlign.Start)
                        .fontColor('#1f1f1f').textOverflow({overflow:TextOverflow.Ellipsis})
                        .width('50%').maxLines(1)
                    }.width('100%').alignItems(VerticalAlign.Bottom)

                    Row() {
                      Text(''+item.districtNames[0]+ checkString(item.circleDesc))
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
                      if(item.minBuildingArea !== null && item.maxBuildingArea !== null){
                        Text('建面'+item.minBuildingArea+'-'+item.maxBuildingArea+"\u33a1")
                          .height(12)
                          .fontSize(12)
                          .fontWeight(400)
                          .textAlign(TextAlign.Start)
                          .fontColor('#606060')
                      }

                    }.width('100%')


                    Row() {
                      ForEach(item.propertyTypeDesc, (item: string) => {
                        Text(''+item)
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
                      }else{
                        Text(item.priceDesc.substr( 0, item.priceDesc.length-3))
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
          }, item => item)
        }
      }
      if (this.cellType == 1) { // 资讯
        List({ space: 0, initialIndex: 0 }) {
          ForEach(this.newsZxArray, (item: NewsZXModel, index) => {
            ListItem() {
              Flex({
                direction: FlexDirection.Row,
                alignItems: ItemAlign.Center,
                alignContent: FlexAlign.Center,
                justifyContent: FlexAlign.SpaceBetween
              }) {
                Column() {
                  Text(item.title)
                    .fontColor('#1F1F1F')
                    .fontSize(16).fontWeight(600)
                    .maxLines(2).width('100%').padding({left:0,right:15})
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    // .backgroundColor(Color.Red)
                  Row() {
                    Text(item.userInfo.nickNameDisplay)
                      .fontColor('#BEBEBE').fontSize(12).fontWeight(400).margin({right:20})
                    Text(item.publishTime)
                      .fontColor('#BEBEBE').fontSize(12).fontWeight(400)
                  }.width('100%').margin({left:10})
                }.justifyContent(FlexAlign.SpaceBetween).height(zxCellisShowImageHeight(item)-20).margin({top:0,bottom:0})

                if (item.headImg !== null) {
                  Image("https://t4.focus-img.cn"+item.headImg) // 直接加载网络地址，请填写一个具体的网络图片地址
                    .alt($r('app.media.icon')) // 使用alt，在网络图片加载成功前使用占位图
                    .borderRadius(10)
                    .objectFit(ImageFit.Cover)
                    .width(110).height(80).flexShrink(0)
                }

              }
            }
            .borderRadius(20)
            .height(zxCellisShowImageHeight(item))
            .backgroundColor(Color.White)
            .margin({ left: 15, right: 15, top: 20 })
            .padding({ left: 10, right: 10 })
          }, item => item)
        }
      }
      if (this.cellType == 2) { // 家居
        List({ space: 0, initialIndex: 0 }) {
          ForEach(this.dataSource, (item: HomeNewsInfoItem, index) => {
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
                    .fontColor('#1F1F1F').fontSize(16).fontWeight(600)
                    .maxLines(2).margin({right:10})
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
                    .width(110).height(jjCellisShowImageHeight(item)-20).flexShrink(0)
                }

              }
            }
            .borderRadius(20)
            .height(jjCellisShowImageHeight(item))
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