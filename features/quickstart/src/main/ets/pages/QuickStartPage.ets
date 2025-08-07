import { Banner } from "../view/Banner"
import { TutorialView } from "../view/TutorialView"
import { EnablementView } from "../view/EnablementView"

@Component
export struct QuickStartPage {
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




