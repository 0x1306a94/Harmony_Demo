import axios, { AxiosError, AxiosResponse } from '@ohos/axios';
import { NewsInfoItem } from '../bean/newsInfoModel'
import { BLog } from '../utils/BLog';
import { BaseResponse } from '../model/response/BasicResponse'
import { BasicDataSource } from '../model/BasicDataSource';

export class FeedHomeDataSource extends BasicDataSource {
  private feedList: Array<NewsInfoItem> = [];

  totalCount(): number {
    return this.feedList.length;
  }

  getData(index: number) {
    return this.feedList[index];
  }

  public getAllData(): NewsInfoItem[] {
    return this.feedList;
  }

  public addData(index: number, data: NewsInfoItem): void {
    this.feedList.splice(index, 0, data);
    this.notifyDataAdd(index);
  }

  public setData(data: NewsInfoItem[]): void {
    this.feedList.splice(0);
    this.addAllData(data);
  }

  public addAllData(data: NewsInfoItem[]): void {
    data.forEach(item => {
      this.feedList.push(item);
    })
    this.notifyDataReload();
  }

  public pushData(data: NewsInfoItem): void {
    this.feedList.push(data);
    this.notifyDataAdd(this.feedList.length - 1);
  }

}
