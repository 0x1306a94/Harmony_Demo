
export interface HouseCityDirectories {
  id: number,
  title: string,
  imageUrl: string,
  url: string,
  hot: number
}

/*****流数据*****/
export interface HomeNewsList {
  newsListData: NewsListData,
  photoDomain: string
}

export interface NewsListData {
  list: BuildingInfo[],
  total: string
  hasNext: boolean,
  pages: number,
  hasPrevious: boolean,
  currentPage: number
}

export interface BuildingInfo {
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
  userInfo: UserInfo;
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

export interface UserInfo {
  uid: number;
  nickName: string | null;
  avatar: string;
  mobile: string | null;
  status: number;
  bindEmail: string | null;
  introduce: string | null;
  accreditStatus: string | null;
  accreditRoleType: string | null;
  bindPhone: string | null;
  openid: string | null;
  openidType: string | null;
  bindUserList: string[] | null;
  profileUrl: string;
  accreditRoleName: string | null;
  nickNameDisplay: string;
  photoUrlDisplay: string;
  produceType: string | null;
  cityName: string | null;
}