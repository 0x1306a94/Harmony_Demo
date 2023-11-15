import { BuildInfoModel } from '../bean/buildInfoModel';
import { HomeNewsInfoItem } from '../bean/homeNewsInfoModel'
import { NewsZXModel } from '../bean/newsZXModel';
import { DataSourceManager } from '../model/DataSourceManager';
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
export struct HomeListView {
  // 资讯
  // @Consume newsZxArray: Array<NewsZXModel>;


  // @Link cellType: number;

  // @State tempDataSource: Array<string> = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20'];

  build() {

    List({ space: 10 }) {
        LazyForEach(DataSourceManager.getNewsZXDataSource(), (item: NewsZXModel) => {
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
          .onClick(() => {

          })
        }, item => item)
      }.cachedCount(5).backgroundColor('#F7F7F7')

  }
}