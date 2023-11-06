import { HomeView } from './Home';
import { ChatView } from './Chat';
import { LivingView } from './Living';
import { MeView } from './Me';
import axios, { AxiosError, AxiosResponse } from '@ohos/axios';
import { BLog } from '../utils/BLog';
import { XLog } from '@ohos/xlog/src/main/ets/components/XLog';
import hilog from '@ohos.hilog';
import ArrayList from '@ohos.util.ArrayList';
@Entry
@Component
struct Index {
  private tabsController: TabsController = new TabsController();
  @State currentIndex: number = 0;

  @Builder TabBuilder(title: string | Resource, targetIndex: number, imgPath: Resource, selectImgPath: Resource) {
    Column() {
      Image(this.currentIndex === targetIndex ? selectImgPath : imgPath)
        .fillColor(this.currentIndex === targetIndex ? '#1698CE' : '#6B6B6B')
        .size({ width: 22,
          height: 22 })
      Text(title)
        .margin({ top: 6 })
        .fontSize(14)
        .fontColor(this.currentIndex === targetIndex ? Color.Red : '#6B6B6B')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    // .border({width: {top: 0.5}, color: '#cccccc'})
  }

  build() {
    Tabs({barPosition: BarPosition.End, controller: this.tabsController}){
      TabContent(){
        HomeView()
      }
      .tabBar(this.TabBuilder($r('app.string.home'),0,$r('app.media.tab_home_normal'),$r('app.media.tab_home_select')))

      TabContent(){
        LivingView()
      }
      .tabBar(this.TabBuilder($r('app.string.live'), 1, $r('app.media.tab_living_normal'),$r('app.media.tab_living_select')))

      TabContent(){
        ChatView()
      }
      .tabBar(this.TabBuilder($r('app.string.chat'), 2, $r('app.media.tab_chat_normal'),$r('app.media.tab_chat_select')))

      TabContent(){
        MeView()
      }
      .tabBar(this.TabBuilder($r('app.string.my'), 3, $r('app.media.tab_me_normal'),$r('app.media.tab_me_select')))

    }.scrollable(false).barWidth('320')
    .barMode(BarMode.Fixed)
    .onChange((index) => {
      this.currentIndex = index
      if(index == 0){
        // HomeView({title:'改变了'})
      }
    })
  }

  // onPageShow(){
  //   // 网络请求
  //   // console.log('======result0');
  //   // let url = 'https://graphql.focus.cn/alias/query'
  //   // let url1 = 'https://kanfang-app.focus.cn/api/recommend/ad/list'
  //   // axios.get<string, AxiosResponse<string>, null>(url1, { params: {
  //   //   "cityId": 1} })
  //   //   .then((response: AxiosResponse) => {
  //   //     // console.error("======result1:" + response.data);
  //   //     console.log(JSON.stringify(response.data));
  //   //     // BLog.i("======result1:"+JSON.stringify(response.data));
  //   //   })
  //   //   .catch((error: AxiosError) => {
  //   //     console.log("======result2:" + error.message);
  //   //   });
  //   let url = 'https://graphql.focus.cn/alias/query'
  //   axios.get<string, AxiosResponse<string>, null>(url, { params: {
  //     "name":'/home/feed/household',
  //     "graphProjectId":11,
  //     "param": "cityId=1&category=2&pageNo=1&pageSize=20"} })
  //     .then((res: AxiosResponse) => {
  //       var  newsDataList = []
  //       if (res.status == 200 ) {
  //         // BLog.i("======result1:"+JSON.stringify(res.data));
  //         try {
  //           newsDataList = res.data.data.homeNewsList.newsListData.list
  //           let  listt   = (res as ResponseData).data.homeNewsList.newsListData.list;
  //
  //           BLog.e('')
  //
  //         }catch (error){
  //           BLog.e('首页列表数据：网络请求成功但是数据解析格式错误')
  //         }
  //       }
  //     })
  //     .catch((error: AxiosError) => {
  //       console.error("error--首页列表数据" + error.message);
  //     });
  // }
}