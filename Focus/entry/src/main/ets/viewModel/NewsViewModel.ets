// import axios, { AxiosError, AxiosResponse } from '@ohos/axios';
// import { NewsInfoItem } from '../bean/newsInfoModel'
// import { BLog } from '../utils/BLog';
// import { BaseResponse } from '../model/response/BasicResponse'
// import { BasicDataSource } from '../model/BasicDataSource';
//
// export class NewsDataSource extends BasicDataSource {
//   private list: Array<NewsInfoItem> = [];
//
//   totalCount(): number {
//     return this.list.length;
//   }
//
//   getData(index: number) {
//     return this.list[index];
//   }
//
//   public getAllData(): NewsInfoItem[] {
//     return this.list;
//   }
//
//   public addData(index: number, data: NewsInfoItem): void {
//     this.list.splice(index, 0, data);
//     this.notifyDataAdd(index);
//   }
//
//   public setData(data: NewsInfoItem[]): void {
//     this.list.splice(0);
//     this.addAllData(data);
//   }
//
//   public addAllData(data: NewsInfoItem[]): void {
//     data.forEach(item => {
//       this.list.push(item);
//     })
//     this.notifyDataReload();
//   }
//
//   public pushData(data: NewsInfoItem): void {
//     this.list.push(data);
//     this.notifyDataAdd(this.list.length - 1);
//   }
//
// }
//
//
// export default class NewsViewModel {
//   public newsDataSource:NewsDataSource = new NewsDataSource();
//
//   public setCityDataSource(newsInfo: NewsInfoItem[]) {
//     this.newsDataSource.setData(newsInfo);
//   }
//
//   public getCityDataSource(): NewsDataSource {
//     return this.newsDataSource;
//   }
//
//   // 请求咨询feed流
//   public async getNewsData(): Promise<BaseResponse.NewsBuildingData> {
//     const url = 'https://graphql.focus.cn/alias/query'
//     let data: BaseResponse.NewsBuildingData;
//
//     await axios.get<string, AxiosResponse<string>, null>(url, { params: {
//       "name":'/home/feed/household',
//       "graphProjectId":11,
//       "param": "cityId=1&category=2&pageNo=1&pageSize=20"} })
//       .then((res: AxiosResponse) => {
//         if (res.status == 200 ) {
//           try {
//             BLog.i(`get weather info hourly, response: ${JSON.stringify(res)}`)
//             data = JSON.parse(JSON.stringify(res.data))
//           }catch (error){
//             BLog.e('首页列表数据：网络请求成功但是数据解析格式错误'+ error)
//           }
//         }
//       })
//       .catch((error: AxiosError) => {
//         console.error("error--首页列表数据" + error.message);
//       });
//     return data;
//   }
//
//
//   // 请求header头部菜单
//   public async getBannerHeaderData(): Promise<BaseResponse.RecommendHeaderData>{
//
//     const url = 'https://kanfang-app.focus.cn/api/recommend/directory/list?cityId=1'
//     let data: BaseResponse.RecommendHeaderData;
//
//     await axios.get<string, AxiosResponse<string>, null>(url, { params: {
//       "cityId":1,} })
//       .then((res: AxiosResponse) => {
//         if (res.status == 200 ) {
//           try {
//             BLog.i(`get weather info hourly, response: ${JSON.stringify(res)}`)
//             data = JSON.parse(JSON.stringify(res.data))
//           }catch (error){
//             BLog.e('首页列表数据：网络请求成功但是数据解析格式错误'+ error)
//           }
//         }
//       })
//       .catch((error: AxiosError) => {
//         console.error("error--首页列表数据" + error.message);
//       });
//     return data;
//   }
// }