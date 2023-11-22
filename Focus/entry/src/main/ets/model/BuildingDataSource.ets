import { BuildInfoModel } from '../bean/buildInfoModel';
import { BasicDataSource } from '../model/BasicDataSource';
import { BaseResponse } from './response/BasicResponse';

export class BuildingDataSource extends BasicDataSource {
  private buildingArray: Array<BuildInfoModel> = [];

  totalCount(): number {
    return this.buildingArray.length;
  }

  getData(index: number) {
    return this.buildingArray[index];
  }

  public getAllData(): BuildInfoModel[] {
    return this.buildingArray;
  }

  public addData(index: number, data: BuildInfoModel): void {
    this.buildingArray.splice(index, 0, data);
    this.notifyDataAdd(index);
  }

  public setData(data: BaseResponse.BuildingData): void {
    this.buildingArray.splice(0);
    this.addAllData(data);
  }

  public addAllData(data: BaseResponse.BuildingData): void {
    for (let i = 0; i < data.data.projectList.projectFeed.content.length ; i++) {
      let  buildInfoModel = new BuildInfoModel({
        pid:data.data.projectList.projectFeed.content[i].pid,
        projName:data.data.projectList.projectFeed.content[i].projName,
        projPhotoPath:data.data.projectList.projectFeed.content[i].projPhotoPath,
        districtNames:data.data.projectList.projectFeed.content[i].districtNames,
        circleDesc:data.data.projectList.projectFeed.content[i].circleDesc,
        constructTypesDesc:data.data.projectList.projectFeed.content[i].constructTypesDesc,
        projFeatureDesc:data.data.projectList.projectFeed.content[i].projFeatureDesc,
        propertyTypeDesc:data.data.projectList.projectFeed.content[i].propertyTypeDesc,
        saleStatus:data.data.projectList.projectFeed.content[i].saleStatus,
        openStartTime:data.data.projectList.projectFeed.content[i].openStartTime,
        priceDesc:data.data.projectList.projectFeed.content[i].priceDesc,
        priceType:data.data.projectList.projectFeed.content[i].priceType,
        marketingInfo:data.data.projectList.projectFeed.content[i].marketingInfo,
        maxBuildingArea:data.data.projectList.projectFeed.content[i].maxBuildingArea,
        minBuildingArea:data.data.projectList.projectFeed.content[i].minBuildingArea,
        welfareList:data.data.projectList.projectFeed.content[i].welfareList,
        vrUrl:data.data.projectList.projectFeed.content[i].vrUrl,
        kanfangtuanTitle:data.data.projectList.projectFeed.content[i].kanfangtuanTitle,
        liveStatus:data.data.projectList.projectFeed.content[i].liveStatus,
        previewLiveTitle:data.data.projectList.projectFeed.content[i].previewLiveTitle,
      });
      this.buildingArray.push(buildInfoModel)
    }

    this.notifyDataReload();
  }

  public pushData(data: BuildInfoModel): void {
    this.buildingArray.push(data);
    this.notifyDataAdd(this.buildingArray.length - 1);
  }

  public clearData(): void {
    this.buildingArray = [];
    this.notifyDataReload();
  }

}
