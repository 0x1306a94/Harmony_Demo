import { HomeNewsInfoItem } from '../bean/homeNewsInfoModel'
import { BasicDataSource } from '../model/BasicDataSource';
import { MenuModel } from './menuModel';

export class BannerMenuDataSource extends BasicDataSource {
  private menuArry: Array<MenuModel> = [];

  totalCount(): number {
    return this.menuArry.length;
  }

  getData(index: number) {
    return this.menuArry[index];
  }

  public getAllData(): MenuModel[] {
    return this.menuArry;
  }

  public addData(index: number, data: MenuModel): void {
    this.menuArry.splice(index, 0, data);
    this.notifyDataAdd(index);
  }

  public setData(data: MenuModel[]): void {
    this.menuArry.splice(0);
    this.addAllData(data);
  }

  public addAllData(data: MenuModel[]): void {
    data.forEach(item => {
      this.menuArry.push(item);
    })
    this.notifyDataReload();
  }

  public pushData(data: MenuModel): void {
    this.menuArry.push(data);
    this.notifyDataAdd(this.menuArry.length - 1);
  }

  public clearData(): void {
    this.menuArry = [];
    this.notifyDataReload();
  }

}
