/**
 * 新房
 */
export namespace NewsBuilding {

  /**
   * 新房列表
   */
  export interface NewsBuildingData {
    data:{
      homeNewsList:HomeNewsList
    }
  }
}

interface HomeNewsList {
  newsListData: NewsListData,
  photoDomain: string
}

interface NewsListData {
  list: BuildingInfo[],
  total: string
  hasNext: boolean,
  pages: number,
  hasPrevious: boolean,
  currentPage: number
}

interface BuildingInfo {
  id: number;
  uid: number;
  cityId: number;
  citySuffix: string;
  pid: number;
  content: string | null;
  category: number;
  categoryName: string | null;
  categoryEn: string | null;
  newsAbstract: string;
  createTime: string;
  updateTime: string;
  publishTime: string;
  publishTimeForShow: string;
  desId: string;
  status: number;
  url: string | null;
  sign: string | null;
  title: string;
  headImg: string;
  viewCount: number | null;
  isAd: number;
  adInfo: string | null;
  mentionedProjectList: string[] | null;
  likedNum: number;
  fakeLikedNum: number;
  hasLiked: boolean;
  likedNumForShow: string;
  isGuide: number;
  source: number;
  hasTitleEscaped: boolean;
  hasAbstractEscaped: boolean;
  projectIdBind: string | null;
  spFlag: string | null;
  quality: number;
  baiduOriginCode: string | null;
  pincePid: string | null;

}