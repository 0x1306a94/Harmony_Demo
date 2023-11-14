
import { ProjectList } from './BuildingResponse';
import { HomeNewsList, HouseCityDirectories } from './HomeNewsInfoResponse';
export namespace BaseResponse {
/**
 * 新房列表
 */
  export interface BuildingData {
    data:{
      projectList:ProjectList
    }
  }


/**
 * 家居列表
 */
  export interface HomeNewsFeedData {
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


