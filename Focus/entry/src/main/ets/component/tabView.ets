import { NewsInfoItem } from '../bean/NewsInfo'

//TODO: 这里不需要用column包装，不然和首页无法滚动联动
@Component
export struct TableView {
  @State message: string = 'Hello HomeView'
  @State title: string = '我是标题'
  @Consume dataSource: Array<NewsInfoItem>;
  @State tempDataSource: Array<string> = ['1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20'];
  build() {
    if(this.dataSource.length == 0){
      List({ space: 0, initialIndex: 0 }) {
        ForEach(this.tempDataSource, (item:string,index) => {
          ListItem() {
            Column(){
              Text('这是第几行' +item)
                .width('100%').height(50).fontSize(22)
                .textAlign(TextAlign.Start).backgroundColor(0xFFFFFF)
              Text('这个是空数据的第几行' +item)
                .width('100%').height(50).fontSize(19)
                .textAlign(TextAlign.Start).backgroundColor(0xFFFFFF)
            }.height(100).backgroundColor(Color.Grey).borderRadius(20)
          }.borderRadius(20)
        }, item => item)
      }
    }else {
      List({ space: 0, initialIndex: 0 }) {
        ForEach(this.dataSource, (item:NewsInfoItem,index) => {
          ListItem() {
            Column(){
              Text('' +item.title)
                .width('100%').height(50).fontSize(22)
                .textAlign(TextAlign.Start).backgroundColor(0xFFFFFF)
              Text('' +item.userInfo.nickNameDisplay)
                .width('100%').height(50).fontSize(19)
                .textAlign(TextAlign.Start).backgroundColor(0xFFFFFF)
            }.height(100).backgroundColor(Color.Grey).borderRadius(20)
          }.borderRadius(20)
        }, item => item)
      }
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