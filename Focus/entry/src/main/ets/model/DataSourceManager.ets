
import { BannerMenuDataSource } from './BannerMenuDataSource';
import { BuildingDataSource } from './BuildingDataSource';
import { FeedHomeDataSource } from './FeedHomeDataSource';
import { NewsZXDataSource } from './NewsZXDataSource';


export class DataSourceManager {
  public static initData() {
    globalThis.buildingDataSource = new BuildingDataSource(); //新房
    globalThis.feedSource = new FeedHomeDataSource(); //家居
    globalThis.bannerDataSource = new BannerMenuDataSource();
    globalThis.newsZXDataSource = new NewsZXDataSource();//资讯
  }

  public static getBuildingDataSource(): BuildingDataSource {
    if (globalThis.buildingDataSource != undefined) {
      return globalThis.buildingDataSource;
    }
    return new BuildingDataSource();
  }

  public static getFeedHomeDataSource(): FeedHomeDataSource {
    if (globalThis.feedSource != undefined) {
      return globalThis.feedSource;
    }
    return new FeedHomeDataSource();
  }


  public static getBannerMenuDataSource(): BannerMenuDataSource {
    if (globalThis.bannerDataSource != undefined) {
      return globalThis.bannerDataSource;
    }
    return new BannerMenuDataSource();
  }

  public static getNewsZXDataSource(): NewsZXDataSource {
    if (globalThis.newsZXDataSource != undefined) {
      return globalThis.newsZXDataSource;
    }
    return new NewsZXDataSource();
  }

}