export class ImageData {
  id: string
  src: Resource
  name: string
}



export function getImageList(): Array<ImageData> {
  let imageDataArray: Array<ImageData> = [
    { "id": "0", "src": $r('app.media.lx1'), "name": 'pic1' },
    { "id": "1", "src": $r('app.media.lx2'), "name": 'pic2' },
    { "id": "2", "src": $r("app.media.lx3"), "name": 'pic3' },
    { "id": "3", "src": $r("app.media.lx4"), "name": 'pic4' },
    { "id": "4", "src": $r("app.media.lx5"), "name": 'pic5' },
    { "id": "5", "src": $r("app.media.lx6"), "name": 'pic6' },
    { "id": "6", "src": $r('app.media.lx7'), "name": 'pic7' },
    { "id": "7", "src": $r('app.media.lx8'), "name": 'pic8' },
    { "id": "8", "src": $r('app.media.lx9'), "name": 'pic9' },
    { "id": "9", "src": $r('app.media.lx10'), "name": 'pic10' },
    { "id": "10", "src": $r('app.media.lx11'), "name": 'pic11' },
    { "id": "11", "src": $r('app.media.lx12'), "name": 'pic12' },
    { "id": "12", "src": $r('app.media.lx13'), "name": 'pic13' }
  ]
  return imageDataArray
}

export class ItemData extends ImageData {
  left: number
  top: number
  id: string
  width: number
  height: number
}

