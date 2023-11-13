
import axios, { AxiosError, AxiosResponse } from '@ohos/axios';
import { DataSourceManager } from '../model/DataSourceManager';
import { FeedHomeDataSource } from '../model/FeedHomeDataSource';
import { MenuModel } from '../model/menuModel';
import { BaseResponse } from '../model/response/BasicResponse';
import { BLog } from '../utils/BLog';


export class ApiManager {
  private constructor() {
    DataSourceManager.initData();
  }

  public static getInstance(): ApiManager {
    if (globalThis.instance == null) {
      globalThis.instance = new ApiManager();
    }
    return globalThis.instance;
  }


  // 请求咨询feed流
  public async getNewsData(): Promise<BaseResponse.NewsBuildingData> {
    const url = 'https://graphql.focus.cn/alias/query'
    let data: BaseResponse.NewsBuildingData;

    await axios.get<string, AxiosResponse<string>, null>(url, { params: {
      "name":'/home/feed/household',
      "graphProjectId":11,
      "param": "cityId=1&category=2&pageNo=1&pageSize=20"} })
      .then((res: AxiosResponse) => {
        if (res.status == 200 ) {
          try {
            BLog.i(`get weather info hourly, response: ${JSON.stringify(res)}`)
            data = JSON.parse(JSON.stringify(res.data))
            DataSourceManager.getFeedHomeDataSource().setData(res.data);
          }catch (error){
            BLog.e('首页列表数据：网络请求成功但是数据解析格式错误'+ error)
          }
        }
      })
      .catch((error: AxiosError) => {
        console.error("error--首页列表数据" + error.message);
      });
    return data;
  }

  // 请求header头部菜单
  public async getBannerHeaderData(): Promise<BaseResponse.RecommendHeaderData>{

    const url = 'https://kanfang-app.focus.cn/api/recommend/directory/list?cityId=1'
    let data: BaseResponse.RecommendHeaderData;

    await axios.get<string, AxiosResponse<string>, null>(url, { params: {
      "cityId":1,} })
      .then((res: AxiosResponse) => {
        if (res.status == 200 ) {
          try {
            BLog.i(`get weather info hourly, response: ${JSON.stringify(res)}`)
            data = JSON.parse(JSON.stringify(res.data))

          }catch (error){
            BLog.e('首页列表数据：网络请求成功但是数据解析格式错误'+ error)
          }
        }
      })
      .catch((error: AxiosError) => {
        console.error("error--首页列表数据" + error.message);
      });
    return data;
  }


}