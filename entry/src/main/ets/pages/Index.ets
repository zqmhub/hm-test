class BannerClass {
  id: string = '';
  imageSrc: ResourceStr = '';
  url: string = '';

  constructor(id: string, imageSrc: ResourceStr, url: string) {
    this.id = id;
    this.imageSrc = imageSrc;
    this.url = url;
  }
}

class ArticleClass {
  id: string = '';
  imageSrc: ResourceStr = '';
  title: string = '';
  brief: string = '';
  webUrl: string = '';

  constructor(id: string, imageSrc: ResourceStr, title: string, brief: string, webUrl: string) {
    this.id = id;
    this.imageSrc = imageSrc;
    this.title = title;
    this.brief = brief;
    this.webUrl = webUrl;
  }
}

@Entry
@Component
struct Index {
  @State message: string = '快速入门';

  build() {

    Column() {
      Text(this.message)
        .fontSize(24)
        .textAlign(TextAlign.Start)
        .width('100%')
        .fontWeight(700)
        .padding({ left: 16 })
        .fontFamily('HarmonyHeiTi-Bold')
        .lineHeight(33)
      Scroll() {
        Column() {
          Banner()
          EnablementView()
          TutorialView()
        }
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      .align(Alignment.TopStart)

    }
    .height('100%')
    .width('100%')
    .backgroundColor('#F1F3F5')
  }
}


@Component
struct Banner {
  @State bannerList: Array<BannerClass> = [new BannerClass('p0',
    $r('app.media.banner_pic0'), 'https://developer.huawei.com/consumer/cn/training/course/video/C101718352529709527'),
    new BannerClass('p1',
      $r('app.media.banner_pic1'),
      'https://developer.huawei.com/consumer/cn/training/course/video/C101718352529709527'), new BannerClass('p2',
      $r('app.media.banner_pic2'),
      'https://developer.huawei.com/consumer/cn/training/course/video/C101718352529709527'),]

  build() {
    Swiper() {
      ForEach(this.bannerList, (item: BannerClass) => {
        Image(item.imageSrc)
          .objectFit(ImageFit.Contain)
          .width('100%')
          .padding({ top: 11, left: 16, right: 16 })
          .borderRadius(16)
      }, (item: BannerClass) => item.id)

    }
    .autoPlay(true)
    .loop(true)
    .indicator(new DotIndicator().color('#1a000000').selectedColor('#0A59F7'))
  }
}

@Component
struct EnablementItem {
  @Prop enablementItem: ArticleClass;

  build() {
    Column() {
      Image(this.enablementItem.imageSrc)
        .width('100%')
        .objectFit(ImageFit.Cover)
        .height(96)
        .borderRadius({ topLeft: 16, topRight: 16 })
      Text(this.enablementItem.title)
        .height(19)
        .width('100%')
        .fontSize(14)
        .textAlign(TextAlign.Start)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .maxLines(1)
        .fontWeight(400)
        .padding({ left: 12, right: 12 })
        .margin({ top: 8 })
      Text(this.enablementItem.brief)
        .width('100%')
        .fontSize(12)
        .textAlign(TextAlign.Start)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .maxLines(2)
        .fontWeight(400)
        .fontColor('rgba(0,0,0,0.6)')
        .padding({ left: 12, right: 12 })
        .margin({ top: 2 })
    }
    .width(160)
    .height(169)
    .borderRadius(16)
    .backgroundColor(Color.White)

  }
}

@Component
struct TutorialItem {
  private title: string = 'Step1 快速入门介绍';
  private brief: string = '本篇教程实现了快速入门——一个用于了解和学习HarmonyOS的应用程序 。';

  build() {
    Row() {
      Column() {
        Text(this.title)
          .height(19)
          .width('100%')
          .fontSize(14)
          .textAlign(TextAlign.Start)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(1)
          .margin({ top: 4 })
        Text(this.brief)
          .height(32)
          .width('100%')
          .fontSize(12)
          .textAlign(TextAlign.Start)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(2)
          .fontWeight(400)
          .fontColor('rgba(0,0,0,0.6)')
          .margin({ top: 5 })
      }.height('100%').layoutWeight(HorizontalAlign.Start).margin({ right: 12 })

      Image($r('app.media.enablement_pic1')).borderRadius(16).height(64).width(108).objectFit(ImageFit.Cover)
    }
    .width('100%')
    .height(88)
    .borderRadius(16)
    .backgroundColor(Color.White)
    .padding(12)
    .alignItems(VerticalAlign.Top)
  }
}

@Component
struct EnablementView {
  @State enablementList: Array<ArticleClass> = [
    new ArticleClass('p1', $r('app.media.enablement_pic1'), 'title1', 'brief1', 'https://baidu.com'),
    new ArticleClass('p2', $r('app.media.enablement_pic2'), 'title1', 'brief1', 'https://baidu.com'),
    new ArticleClass('p3', $r('app.media.enablement_pic3'), 'title1', 'brief1', 'https://baidu.com'),
    new ArticleClass('p4', $r('app.media.enablement_pic4'), 'title1', 'brief1', 'https://baidu.com'),
    new ArticleClass('p5', $r('app.media.enablement_pic5'), 'title1', 'brief1', 'https://baidu.com'),
  ]

  build() {
    Column() {
      Text('赋能套件')
        .fontColor('#182431')
        .fontSize(16)
        .fontWeight(500)
        .fontFamily('HarmonyHeiTi-medium')
        .textAlign(TextAlign.Start)
        .padding({ left: 16 })
        .margin({ bottom: 8.5 })
      Grid() {
        ForEach(this.enablementList, (i: ArticleClass) => {
          GridItem() {
            EnablementItem({ enablementItem: i })
          }
        }, (i: ArticleClass) => i.id)

      }
      .rowsTemplate('1fr')
      .columnsGap(8)
      .scrollBar(BarState.Off)
      .height(169)
      .padding({ top: 2, left: 16, right: 16 })
    }
    .margin({ top: 18 })
    .alignItems(HorizontalAlign.Start)
    .width('100%')

  }
}

@Component
struct TutorialView {
  @State tutorialList: ArticleClass[] = [
    new ArticleClass('1', $r('app.media.tutorial_pic1'), 'title1', 'brief1', 'https://baidu.com'),
    new ArticleClass('1', $r('app.media.tutorial_pic1'), 'title1', 'brief1', 'https://baidu.com'),
    new ArticleClass('1', $r('app.media.tutorial_pic1'), 'title1', 'brief1', 'https://baidu.com'),
    new ArticleClass('1', $r('app.media.tutorial_pic1'), 'title1', 'brief1', 'https://baidu.com'),
    new ArticleClass('1', $r('app.media.tutorial_pic1'), 'title1', 'brief1', 'https://baidu.com'),
    new ArticleClass('1', $r('app.media.tutorial_pic1'), 'title1', 'brief1', 'https://baidu.com'),
  ]

  build() {

  }
}