import { HomeNewsInfoItem } from '../bean/homeNewsInfoModel'
import { NewsZXModel } from '../bean/newsZXModel';
import { BasicDataSource } from '../model/BasicDataSource';
import { BaseResponse } from './response/BasicResponse';

export class NewsZXDataSource extends BasicDataSource {
  private newszxArray: Array<NewsZXModel> = [];

  totalCount(): number {
    return this.newszxArray.length;
  }

  getData(index: number) {
    return this.newszxArray[index];
  }

  public getAllData(): NewsZXModel[] {
    return this.newszxArray;
  }

  public addData(index: number, data: NewsZXModel): void {
    this.newszxArray.splice(index, 0, data);
    this.notifyDataAdd(index);
  }

  public setData(data: BaseResponse.NewsZXFeedData): void {
    this.newszxArray.splice(0);
    this.addAllData(data);
  }

  public addAllData(data: BaseResponse.NewsZXFeedData): void {
    // 资讯
    for (let i = 0; i < data.data.newsList.newsListData.list.length ; i++) {
      this.newszxArray.push(new NewsZXModel({
        title: data.data.newsList.newsListData.list[i].title,
        publishTime: data.data.newsList.newsListData.list[i].publishTime,
        headImg:data.data.newsList.newsListData.list[i].headImg,
        nickNameDisplay:data.data.newsList.newsListData.list[i].userInfo.nickNameDisplay
      }))
    }
    this.notifyDataReload();
  }

  public pushData(data: NewsZXModel): void {
    this.newszxArray.push(data);
    this.notifyDataAdd(this.newszxArray.length - 1);
  }

}
