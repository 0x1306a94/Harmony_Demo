
export class  MenuModel {
  id: number;
  title: string;
  imageUrl: string;
  url: string | null;
  hot: number | null;

  constructor(options:{id: number, title: string, imageUrl:string, url:string ,hot: number}) {
    this.id = options.id
    this.title = options.title
    this.imageUrl = options.imageUrl
    this.url = options.url
    this.hot = options.hot
  }
}
