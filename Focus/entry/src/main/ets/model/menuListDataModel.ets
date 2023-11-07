export class MenuData {
  id: string
  src: Resource
  name: string
}


export function getFirstMenuList(): Array<MenuData> {
  let imageDataArray: Array<MenuData> = [
    { "id": "0", "src": $r('app.media.icon'), "name": '美食' },
    { "id": "1", "src": $r('app.media.icon'), "name": '景点/周边游' },
    { "id": "2", "src": $r("app.media.icon"), "name": '酒店/民宿' },
    { "id": "3", "src": $r("app.media.icon"), "name": '休闲/玩乐' },
    { "id": "4", "src": $r("app.media.icon"), "name": '电影/演出' },
    { "id": "5", "src": $r("app.media.icon"), "name": '医疗/口腔' },
    { "id": "6", "src": $r('app.media.icon'), "name": '理发/男士' },
    { "id": "7", "src": $r('app.media.icon'), "name": '亲子/乐园' },
    { "id": "8", "src": $r('app.media.icon'), "name": '结婚/摄影' },
    { "id": "9", "src": $r('app.media.icon'), "name": '学习/培训' },
  ]
  return imageDataArray
}

export function getSecondMenuList(): Array<MenuData> {
  let imageDataArray: Array<MenuData> = [
    { "id": "0", "src": $r('app.media.icon'), "name": '美食1' },
    { "id": "1", "src": $r('app.media.icon'), "name": '景点/周边游1' },
    { "id": "2", "src": $r("app.media.icon"), "name": '酒店/民宿1' },
    { "id": "3", "src": $r("app.media.icon"), "name": '休闲/玩乐1' },
    { "id": "4", "src": $r("app.media.icon"), "name": '电影/演出1' },
    { "id": "5", "src": $r("app.media.icon"), "name": '医疗/口腔1' },
    { "id": "6", "src": $r('app.media.icon'), "name": '理发/男士1' },
    { "id": "7", "src": $r('app.media.icon'), "name": '亲子/乐园1' },
    { "id": "8", "src": $r('app.media.icon'), "name": '结婚/摄影1' },
    { "id": "9", "src": $r('app.media.icon'), "name": '学习/培训1' },
  ]
  return imageDataArray
}



