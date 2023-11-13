
import { BannerMenuDataSource } from './BannerMenuDataSource';
import { FeedHomeDataSource } from './FeedHomeDataSource';


export class DataSourceManager {
  public static initData() {
    globalThis.feedSource = new FeedHomeDataSource();
    globalThis.bannerDataSource = new BannerMenuDataSource();
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

}