export class BuildInfoModel {
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

  constructor(options: {
    pid: number,
    projName: string,
    projPhotoPath: string,
    districtNames: string[],
    circleDesc: string[],
    constructTypesDesc: string[],
    projFeatureDesc: string[],
    propertyTypeDesc: string[],
    saleStatus: number,
    openStartTime: string,
    priceDesc: string,
    priceType: number,
    marketingInfo: string,
    maxBuildingArea: number,
    minBuildingArea: number,
    welfareList: any[] | null,
    vrUrl: string | null,
    kanfangtuanTitle: string | null,
    liveStatus: number,
    previewLiveTitle: string | null
  }) {
    this.pid = options.pid;
    this.projName = options.projName;
    this.projPhotoPath = options.projPhotoPath;
    this.districtNames = options.districtNames;
    this.circleDesc = options.circleDesc;
    this.constructTypesDesc = options.constructTypesDesc;
    this.projFeatureDesc = options.projFeatureDesc;
    this.propertyTypeDesc = options.propertyTypeDesc;
    this.saleStatus = options.saleStatus;
    this.openStartTime = options.openStartTime;
    this.priceDesc = options.priceDesc;
    this.priceType = options.priceType;
    this.marketingInfo = options.marketingInfo;
    this.maxBuildingArea = options.maxBuildingArea;
    this.minBuildingArea = options.minBuildingArea;
    this.welfareList = options.welfareList;
    this.vrUrl = options.vrUrl;
    this.kanfangtuanTitle = options.kanfangtuanTitle;
    this.liveStatus = options.liveStatus;
    this.previewLiveTitle = options.previewLiveTitle;
  }
}

