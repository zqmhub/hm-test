import { ArticleClass } from "../model/ArticleClass"

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
export struct EnablementView {
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