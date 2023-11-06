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
    { "id": "0", "src": $r('app.media.icon'), "name": '美团外卖' },
    { "id": "1", "src": $r('app.media.icon'), "name": 'KTV' },
    { "id": "2", "src": $r("app.media.icon"), "name": '洗浴/汗蒸' },
    { "id": "3", "src": $r("app.media.icon"), "name": '按摩/足疗' },
    { "id": "4", "src": $r("app.media.icon"), "name": '宠物' },
    { "id": "5", "src": $r("app.media.icon"), "name": '逛街/商场' },
    { "id": "6", "src": $r('app.media.icon'), "name": '鲜花' },
    { "id": "7", "src": $r('app.media.icon'), "name": '家常菜谱' },
    { "id": "8", "src": $r('app.media.icon'), "name": '火车票/机票' },
    { "id": "9", "src": $r('app.media.icon'), "name": '美团打车' },
    { "id": "0", "src": $r('app.media.icon'), "name": '医学美容' },
    { "id": "1", "src": $r('app.media.icon'), "name": '拍照/写真' },
    { "id": "2", "src": $r("app.media.icon"), "name": '母婴服务' },
    { "id": "3", "src": $r("app.media.icon"), "name": '健身/运动' },
    { "id": "4", "src": $r("app.media.icon"), "name": '家居/装修' },
    { "id": "5", "src": $r("app.media.icon"), "name": '生活服务' },
    { "id": "6", "src": $r('app.media.icon'), "name": '养车/用车' },
  ]
  return imageDataArray
}



