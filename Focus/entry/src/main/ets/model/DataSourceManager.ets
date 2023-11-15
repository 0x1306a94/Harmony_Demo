
import { BannerMenuDataSource } from './BannerMenuDataSource';
import { FeedHomeDataSource } from './FeedHomeDataSource';
import { NewsZXDataSource } from './NewsZXDataSource';


export class DataSourceManager {
  public static initData() {
    globalThis.feedSource = new FeedHomeDataSource();
    globalThis.bannerDataSource = new BannerMenuDataSource();
    globalThis.newsZXDataSource = new NewsZXDataSource();
  }

  public static getFeedHomeDataSource(): FeedHomeDataSource {
    if (globalThis.recommendSource != undefined) {
      return globalThis.recommendSource;
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