import { BannerClass } from "../model/BannerClass"
import { bufferToString } from '../util/BufferUtil'

@Component
export struct Banner {
  @State bannerList: Array<BannerClass> = [
  // new BannerClass('p0',
  //   $r('app.media.banner_pic0'),
  //   'https://developer.huawei.com/consumer/cn/training/course/video/C101718352529709527'),
  // new BannerClass('p1',
  //   $r('app.media.banner_pic1'),
  //   'https://developer.huawei.com/consumer/cn/training/course/video/C101718352529709527'),
  // new BannerClass('p2',
  //   $r('app.media.banner_pic2'),
  //   'https://developer.huawei.com/consumer/cn/training/course/video/C101718352529709527'),
  ]

  aboutToAppear(): void {
    this.getDataFromJson()
  }

  getDataFromJson() {
    this.getUIContext().getHostContext()?.resourceManager.getRawFileContent('BannerData.json').then(value => {
      this.bannerList = JSON.parse(bufferToString(value)) as BannerClass[];
    })
  }

  build() {
    Swiper() {
      ForEach(this.bannerList, (item: BannerClass) => {
        Image(item.imageSrc)
          .objectFit(ImageFit.Contain)
          .width('100%')
          .padding({ top: 11, left: 16, right: 16 })
          .borderRadius(16)
      }, (item: BannerClass) => (item.id).toString())

    }
    .autoPlay(true)
    .loop(true)
    .indicator(new DotIndicator().color('#1a000000').selectedColor('#0A59F7'))
  }
}