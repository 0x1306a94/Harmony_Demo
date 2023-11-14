import axios, { AxiosError, AxiosResponse } from '@ohos/axios';
import { HomeNewsInfoItem } from '../bean/homeNewsInfoModel'
import { BLog } from '../utils/BLog';
import { BaseResponse } from '../model/response/BasicResponse'
import { BasicDataSource } from '../model/BasicDataSource';

export class FeedHomeDataSource extends BasicDataSource {
  private feedList: Array<HomeNewsInfoItem> = [];

  totalCount(): number {
    return this.feedList.length;
  }

  getData(index: number) {
    return this.feedList[index];
  }

  public getAllData(): HomeNewsInfoItem[] {
    return this.feedList;
  }

  public addData(index: number, data: HomeNewsInfoItem): void {
    this.feedList.splice(index, 0, data);
    this.notifyDataAdd(index);
  }

  public setData(data: HomeNewsInfoItem[]): void {
    this.feedList.splice(0);
    this.addAllData(data);
  }

  public addAllData(data: HomeNewsInfoItem[]): void {
    data.forEach(item => {
      this.feedList.push(item);
    })
    this.notifyDataReload();
  }

  public pushData(data: HomeNewsInfoItem): void {
    this.feedList.push(data);
    this.notifyDataAdd(this.feedList.length - 1);
  }

}
