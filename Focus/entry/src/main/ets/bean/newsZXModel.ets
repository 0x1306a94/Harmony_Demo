export class  NewsZXModel {
  id: number;
  cityId: number;
  publishTime: string;
  url: string;
  userInfo: UserInfo;
  title: string;
  headImg: string|null;

  constructor(options:{title: string, headImg:string, publishTime: string, nickNameDisplay:string }) {
    this.title = options.title
    this.publishTime = options.publishTime
    this.headImg = options.headImg
    // 初始化 UserInfo 对象
    this.userInfo = new UserInfo({ nickNameDisplay: options.nickNameDisplay });
  }
}

export class UserInfo {
  nickName: string | null;
  nickNameDisplay: string;
  constructor(options:{nickNameDisplay: string}) {
    this.nickNameDisplay = options.nickNameDisplay
  }
}
