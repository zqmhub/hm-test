import { ArticleClass } from "../model/ArticleClass"

@Component
struct TutorialItem {
  @Prop tutorialItem: ArticleClass

  build() {
    Row() {
      Column() {
        Text(this.tutorialItem.title)
          .height(19)
          .width('100%')
          .fontSize(14)
          .textAlign(TextAlign.Start)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(1)
          .margin({ top: 4 })
        Text(this.tutorialItem.brief)
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

      Image(this.tutorialItem.imageSrc).borderRadius(16).height(64).width(108).objectFit(ImageFit.Cover)
    }
    .width('100%')
    .height(88)
    .borderRadius(16)
    .backgroundColor(Color.White)
    .padding(12)
    .alignItems(VerticalAlign.Top)
    .margin({ bottom: 12 })
  }
}

@Component
export struct TutorialView {
  @State tutorialList: ArticleClass[] = [
    new ArticleClass('1', $r('app.media.tutorial_pic1'), 'title1', 'brief1', 'https://baidu.com'),
    new ArticleClass('2', $r('app.media.tutorial_pic1'), 'title1', 'brief1', 'https://baidu.com'),
    new ArticleClass('3', $r('app.media.tutorial_pic1'), 'title1', 'brief1', 'https://baidu.com'),
    new ArticleClass('4', $r('app.media.tutorial_pic1'), 'title1', 'brief1', 'https://baidu.com'),
    new ArticleClass('5', $r('app.media.tutorial_pic1'), 'title1', 'brief1', 'https://baidu.com'),
    new ArticleClass('6', $r('app.media.tutorial_pic1'), 'title1', 'brief1', 'https://baidu.com'),
  ]

  build() {
    Column() {
      Text('入门教程')
        .fontColor('#182431')
        .fontSize(16)
        .fontWeight(500)
        .fontFamily('HarmonyHeiTi-medium')
        .textAlign(TextAlign.Start)
        .padding({ left: 16 })
        .margin({ bottom: 8.5 })
      List() {
        ForEach(this.tutorialList, (i: ArticleClass) => {
          TutorialItem({ tutorialItem: i })
        }, (i: ArticleClass) => i.id)
      }.scrollBar(BarState.Off).padding({ left: 16, right: 16 })
    }.margin({ top: 8 }).alignItems(HorizontalAlign.Start)
  }
}