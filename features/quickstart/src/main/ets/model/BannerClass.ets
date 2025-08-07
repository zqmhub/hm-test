export class BannerClass {
  id: number = 0;
  imageSrc: string = '';
  // imageSrc: ResourceStr = '';
  url: string = '';

  constructor(id: number, imageSrc: string, url: string) {
    this.id = id;
    this.imageSrc = imageSrc;
    this.url = url;
  }
}