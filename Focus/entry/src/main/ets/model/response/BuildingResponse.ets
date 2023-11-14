

/*****新房*****/
export interface ProjectList {
  projectFeed: ProjectFeed,
  photoDomain: string,
}

export interface ProjectFeed {
  content: BuildingInfo[],
}

export interface BuildingInfo {
  pid: number;
  projName: string;
  projPhotoPath: string;
  districtNames: string[];
  circleDesc: string[]; // 这里可能需要根据实际数据类型进行调整
  constructTypesDesc: string[];
  projFeatureDesc: string[];
  propertyTypeDesc: string[];
  saleStatus: number;
  openStartTime: string;
  priceDesc: string;
  priceType: number;
  marketingInfo: string;
  maxBuildingArea: number;
  minBuildingArea: number;
  welfareList: any[] | null; // 这里可能需要根据实际数据类型进行调整
  vrUrl: string | null;
  kanfangtuanTitle: string | null;
  liveStatus: number;
  previewLiveTitle: string | null;
}
