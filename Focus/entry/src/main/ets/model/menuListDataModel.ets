export class MenuData {
  id: string
  src: Resource
  name: string
}


export function getFirstMenuList(): Array<MenuData> {
  let imageDataArray: Array<MenuData> = [
    { "id": "0", "src": $r('app.media.icon'), "name": '新房' },
    { "id": "1", "src": $r('app.media.icon'), "name": '家居装修' },
    { "id": "2", "src": $r("app.media.icon"), "name": '文旅' },
    { "id": "3", "src": $r("app.media.icon"), "name": '海外' },
    { "id": "4", "src": $r("app.media.icon"), "name": '财经' },
    { "id": "5", "src": $r("app.media.icon"), "name": '咨询' },
    { "id": "6", "src": $r('app.media.icon'), "name": '地图找房' },
    { "id": "7", "src": $r('app.media.icon'), "name": '算房贷' },
    { "id": "8", "src": $r('app.media.icon'), "name": '万科品牌馆' },
    { "id": "9", "src": $r('app.media.icon'), "name": '智慧案场' },
  ]
  return imageDataArray
}

export function getSecondMenuList(): Array<MenuData> {
  let imageDataArray: Array<MenuData> = [
    { "id": "0", "src": $r('app.media.icon'), "name": '新房' },
    { "id": "1", "src": $r('app.media.icon'), "name": '家居装修' },
    { "id": "2", "src": $r("app.media.icon"), "name": '文旅' },
    { "id": "3", "src": $r("app.media.icon"), "name": '海外' },
    { "id": "4", "src": $r("app.media.icon"), "name": '财经' },
    { "id": "5", "src": $r("app.media.icon"), "name": '咨询' },
    { "id": "6", "src": $r('app.media.icon'), "name": '地图找房' },
    { "id": "7", "src": $r('app.media.icon'), "name": '算房贷' },
    { "id": "8", "src": $r('app.media.icon'), "name": '万科品牌馆' },
    { "id": "9", "src": $r('app.media.icon'), "name": '智慧案场' },
  ]
  return imageDataArray
}



