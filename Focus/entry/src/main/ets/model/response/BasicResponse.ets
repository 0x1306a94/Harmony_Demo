
import { HomeNewsList, HouseCityDirectories } from './NewsInfoModel';
export namespace BaseResponse {
/**
 * 新房列表
 */
  export interface NewsBuildingData {
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


