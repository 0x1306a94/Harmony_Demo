import axios, { AxiosError, AxiosResponse } from '@ohos/axios';
import { HomeNewsInfoItem } from '../bean/homeNewsInfoModel'
import { BLog } from '../utils/BLog';
import { BaseResponse } from '../model/response/BasicResponse'
import { BasicDataSource } from '../model/BasicDataSource';

export class FeedHomeDataSource extends BasicDataSource {
  private homeNewsArray: Array<HomeNewsInfoItem> = [];

  totalCount(): number {
    return this.homeNewsArray.length;
  }

  getData(index: number) {
    return this.homeNewsArray[index];
  }

  public getAllData(): HomeNewsInfoItem[] {
    return this.homeNewsArray;
  }

  public addData(index: number, data: HomeNewsInfoItem): void {
    this.homeNewsArray.splice(index, 0, data);
    this.notifyDataAdd(index);
  }

  public setData(data: BaseResponse.HomeNewsFeedData): void {
    this.homeNewsArray.splice(0);
    this.addAllData(data);
  }

  public addAllData(data: BaseResponse.HomeNewsFeedData): void {
    for (let i = 0; i < data.data.homeNewsList.newsListData.list.length ; i++) {
      this.homeNewsArray.push(new HomeNewsInfoItem({
        title: data.data.homeNewsList.newsListData.list[i].title,
        publishTime: data.data.homeNewsList.newsListData.list[i].publishTime,
        headImg:data.data.homeNewsList.newsListData.list[i].headImg,
        nickNameDisplay:data.data.homeNewsList.newsListData.list[i].userInfo.nickNameDisplay
      }))
    }
    this.notifyDataReload();
  }

  public pushData(data: HomeNewsInfoItem): void {
    this.homeNewsArray.push(data);
    this.notifyDataAdd(this.homeNewsArray.length - 1);
  }
  public clearData(): void {
    this.homeNewsArray = [];
    this.notifyDataReload();
  }
}
