export class BannerClass {
  id: number = 0;
  imageSrc: ResourceStr = '';
  url: string = '';

  constructor(id: number, imageSrc: ResourceStr, url: string) {
    this.id = id;
    this.imageSrc = imageSrc;
    this.url = url;
  }
}