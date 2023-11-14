

/*****新房*****/
export interface NewsList {
  newsListData: NewsListData,
  photoDomain: string,
}

export interface NewsListData {
  list: newzxItem[],
}

export interface newzxItem {
  id: number;
  cityId: string;
  publishTime: string;
  url: string;
  userInfo: UserInfo;
  title: string;
  headImg: string | null;
}

export interface UserInfo {
  nickName: string | null;
  nickNameDisplay: string;
}