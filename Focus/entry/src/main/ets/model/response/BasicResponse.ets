
import { HomeNewsList, HouseCityDirectories } from './NewsInfoModel';
export namespace BaseResponse {
/**
 * 家居列表
 */
  export interface NewsFeedData {
    data:{
      homeNewsList:HomeNewsList
    }
  }

  /**
   * banner菜单
   */
  export interface RecommendHeaderData {
    code:string
    msg:string
    data:{
      houseCityDirectories: HouseCityDirectories[]
    }
  }
}


