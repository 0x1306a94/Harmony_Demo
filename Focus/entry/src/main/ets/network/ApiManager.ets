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


  /*
   * 请求新房feed流
   */
  public async getBuildingFeedData(): Promise<BaseResponse.BuildingData> {
    const url = 'https://graphql.focus.cn/alias/query'
    let data: BaseResponse.BuildingData;
    let paramsMap = {}
    paramsMap["cityId"] = 1;
    paramsMap["page"] = 1;
    let params: string = "params=" + encodeURIComponent(JSON.stringify(paramsMap));

    //params=%7B%22cityId%22%3A1%2C%22page%22%3A1%7D

    await axios.get<string, AxiosResponse<string>, null>(url, { params: {
      "name": '/home/feed/house',
      "graphProjectId": 11,
      "param": params } })
      .then((res: AxiosResponse) => {
        if (res.status == 200) {
          try {
            BLog.i(`get weather info hourly, response: ${JSON.stringify(res)}`)
            data = JSON.parse(JSON.stringify(res.data))
          } catch (error) {
            BLog.e('首页列表数据：网络请求成功但是数据解析格式错误' + error)
          }
        }
      })
      .catch((error: AxiosError) => {
        console.error("error--首页列表数据" + error.message);
      });
    return data;
  }

  /*
 * 请求新房feed流
 */
  public async getBuildingFeedDataManager(pageNumber: number): Promise<BaseResponse.BuildingData> {
    const url = 'https://graphql.focus.cn/alias/query'
    let data: BaseResponse.BuildingData;
    let paramsMap = {}
    paramsMap["cityId"] = 1;
    paramsMap["page"] = pageNumber;
    let params: string = "params=" + encodeURIComponent(JSON.stringify(paramsMap));

    //params=%7B%22cityId%22%3A1%2C%22page%22%3A1%7D

    await axios.get<string, AxiosResponse<string>, null>(url, { params: {
      "name": '/home/feed/house',
      "graphProjectId": 11,
      "param": params } })
      .then((res: AxiosResponse) => {
        if (res.status == 200) {
          try {
            BLog.i(`get weather info hourly, response: ${JSON.stringify(res)}`)
            data = JSON.parse(JSON.stringify(res.data))
            if (pageNumber == 1) {
              DataSourceManager.getBuildingDataSource().setData(data)
            } else {
              if (data.data.projectList.projectFeed.content.length == 0) {
                let buildingData: BaseResponse.BuildingData = {
                  data: {
                    projectList: null,
                    status: 1 // 这里给 status 赋值
                  }
                };
                data = buildingData
              } else {
                DataSourceManager.getBuildingDataSource().addAllData(data)
              }
            }
          } catch (error) {
            BLog.e('首页列表数据：网络请求成功但是数据解析格式错误' + error)
          }
        }
      })
      .catch((error: AxiosError) => {
        console.error("error--首页列表数据" + error.message);
      });
    return data;
  }

  /*
   * 请求资讯feed流
   */
  public async getZXNewsFeedData(): Promise<BaseResponse.NewsZXFeedData> {
    const url = 'https://graphql.focus.cn/alias/query'
    let data: BaseResponse.NewsZXFeedData;

    await axios.get<string, AxiosResponse<string>, null>(url, { params: {
      "name": '/home/feed/news',
      "graphProjectId": 11,
      "param": "cityId=1&pageSize=20&pageNo=1" } })
      .then((res: AxiosResponse) => {
        if (res.status == 200) {
          try {
            BLog.i(`get weather info hourly, response: ${JSON.stringify(res)}`)
            data = JSON.parse(JSON.stringify(res.data))
          } catch (error) {
            BLog.e('首页列表数据：网络请求成功但是数据解析格式错误' + error)
          }
        }
      })
      .catch((error: AxiosError) => {
        console.error("error--首页列表数据" + error.message);
      });
    return data;
  }


  /*
 * 请求资讯feed流
 */
  public async getZXNewsFeedDataManager(pageNumber: number): Promise<BaseResponse.NewsZXFeedData> {
    const url = 'https://graphql.focus.cn/alias/query'
    let data: BaseResponse.NewsZXFeedData;

    await axios.get<string, AxiosResponse<string>, null>(url, { params: {
      "name": '/home/feed/news',
      "graphProjectId": 11,
      "param": "cityId=1&pageSize=20&pageNo=" + pageNumber } })
      .then((res: AxiosResponse) => {
        if (res.status == 200) {
          try {
            BLog.i(`get weather info hourly, response: ${JSON.stringify(res)}`)
            data = JSON.parse(JSON.stringify(res.data))
            if (pageNumber == 1) {
              DataSourceManager.getNewsZXDataSource().setData(data)
            } else {
              if (data.data.newsList.newsListData.list.length == 0) {
                let zxData: BaseResponse.NewsZXFeedData = {
                  data: {
                    newsList: null,
                    status: 1 // 这里给 status 赋值
                  }
                };
                data = zxData
              } else {
                DataSourceManager.getNewsZXDataSource().addAllData(data)
              }
            }
          } catch (error) {
            BLog.e('首页列表数据：网络请求成功但是数据解析格式错误' + error)
          }
        }
      })
      .catch((error: AxiosError) => {
        console.error("error--首页列表数据" + error.message);
      });
    return data;
  }

  /*
   * 请求家居feed流
   */
  public async getNewsData(): Promise<BaseResponse.HomeNewsFeedData> {
    const url = 'https://graphql.focus.cn/alias/query'
    let data: BaseResponse.HomeNewsFeedData;

    await axios.get<string, AxiosResponse<string>, null>(url, { params: {
      "name": '/home/feed/household',
      "graphProjectId": 11,
      "param": "cityId=1&category=2&pageNo=1&pageSize=20" } })
      .then((res: AxiosResponse) => {
        if (res.status == 200) {
          try {
            BLog.i(`get weather info hourly, response: ${JSON.stringify(res)}`)
            data = JSON.parse(JSON.stringify(res.data))
          } catch (error) {
            BLog.e('首页列表数据：网络请求成功但是数据解析格式错误' + error)
          }
        }
      })
      .catch((error: AxiosError) => {
        console.error("error--首页列表数据" + error.message);
      });
    return data;
  }

  /*
 * 请求家居feed流
 */
  public async getHomeNewsFeedManager(pageNumber:number): Promise<BaseResponse.HomeNewsFeedData> {
    const url = 'https://graphql.focus.cn/alias/query'
    let data: BaseResponse.HomeNewsFeedData;

    await axios.get<string, AxiosResponse<string>, null>(url, { params: {
      "name": '/home/feed/household',
      "graphProjectId": 11,
      "param": "cityId=1&category=2&pageNo="+pageNumber+"&pageSize=20" } })
      .then((res: AxiosResponse) => {
        if (res.status == 200) {
          try {
            BLog.i(`get weather info hourly, response: ${JSON.stringify(res)}`)
            data = JSON.parse(JSON.stringify(res.data))

            if (pageNumber == 1) {
              DataSourceManager.getFeedHomeDataSource().setData(res.data);
            } else {
              if (data.data.homeNewsList.newsListData.list.length == 0) {
                let newsData: BaseResponse.HomeNewsFeedData = {
                  data: {
                    homeNewsList: null,
                    status: 1 // 这里给 status 赋值
                  }
                };
                data = newsData
              } else {
                DataSourceManager.getFeedHomeDataSource().addAllData(data);
              }
            }

          } catch (error) {
            BLog.e('首页列表数据：网络请求成功但是数据解析格式错误' + error)
          }
        }
      })
      .catch((error: AxiosError) => {
        console.error("error--首页列表数据" + error.message);
      });
    return data;
  }

  /*
   * 请求header头部菜单
   */
  public async getBannerHeaderData(): Promise<BaseResponse.RecommendHeaderData> {

    const url = 'https://kanfang-app.focus.cn/api/recommend/directory/list?cityId=1'
    let data: BaseResponse.RecommendHeaderData;

    await axios.get<string, AxiosResponse<string>, null>(url, { params: {
      "cityId": 1, } })
      .then((res: AxiosResponse) => {
        if (res.status == 200) {
          try {
            BLog.i(`get weather info hourly, response: ${JSON.stringify(res)}`)
            data = JSON.parse(JSON.stringify(res.data))

          } catch (error) {
            BLog.e('首页列表数据：网络请求成功但是数据解析格式错误' + error)
          }
        }
      })
      .catch((error: AxiosError) => {
        console.error("error--首页列表数据" + error.message);
      });
    return data;
  }

  /*
   *请求header头部菜单处理
   */
  public async getBannerHeaderDataNew(): Promise<MenuModel[]> {

    const url = 'https://kanfang-app.focus.cn/api/recommend/directory/list?cityId=1'
    let data: BaseResponse.RecommendHeaderData;
    let menuArry: MenuModel[] = [];

    await axios.get<string, AxiosResponse<string>, null>(url, { params: {
      "cityId": 1, } })
      .then((res: AxiosResponse) => {
        if (res.status == 200) {
          try {
            BLog.i(`get weather info hourly, response: ${JSON.stringify(res)}`)
            data = JSON.parse(JSON.stringify(res.data))
            for (let index = 0; index < data.data.houseCityDirectories.length; index++) {
              let element = data.data.houseCityDirectories[index]
              if (element.title !== '直播') {
                menuArry.push(new MenuModel({
                  id: element.id,
                  title: element.title,
                  imageUrl: element.imageUrl,
                  url: element.url,
                  hot: element.hot,
                }))
              }
            }
          } catch (error) {
            BLog.e('首页列表数据：网络请求成功但是数据解析格式错误' + error)
          }
        }
      })
      .catch((error: AxiosError) => {
        console.error("error--首页列表数据" + error.message);
      });
    return menuArry;
  }
}