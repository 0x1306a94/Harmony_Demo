export class  NewsInfoItem {
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

  constructor(options:{title: string, content: string, headImg:string, nickNameDisplay:string }) {
    this.title = options.title
    this.content = options.content
    this.headImg = options.headImg
    // 初始化 UserInfo 对象
    this.userInfo = new UserInfo({ nickNameDisplay: options.nickNameDisplay });

  }
}

export class UserInfo {
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

  constructor(options:{nickNameDisplay: string}) {
    this.nickNameDisplay = options.nickNameDisplay
  }
}
