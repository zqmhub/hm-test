import { Banner } from "../view/Banner"
import { TutorialView } from "../view/TutorialView"
import { EnablementView } from "../view/EnablementView"
import http from '@ohos.net.http';
// 发起 GET 请求
async function sendGetRequest() {
  // 1. 创建 HTTP 请求对象（每个请求对应一个独立对象）
  const request = http.createHttp();

  try {
    // 2. 配置请求参数
    const options: http.HttpRequestOptions = {
      method: http.RequestMethod.GET, // 请求方式：GET/POST/PUT/DELETE 等
      header: {
        'Content-Type': 'application/json' // 请求头：根据接口要求配置（如表单为 application/x-www-form-urlencoded）
      },
      connectTimeout: 60000, // 连接超时时间（毫秒，默认60s）
      readTimeout: 60000, // 读取超时时间（毫秒，默认60s）
      // 若调试时需要忽略 HTTPS 证书错误（生产环境禁止）
      // ignoreSSLErrors: true
    };

    // 3. 发送请求（参数：请求URL、配置项）
    const response = await request.request(
      'http://localhost:3000/api/employees', // 示例接口：返回一条待办数据
      options
    );

    // 4. 处理响应结果
    if (response.responseCode === 200) { // 响应码为200表示成功
      console.log('请求成功，响应数据：', response.result); // result为响应体（默认字符串）
      // 若响应体为JSON，可解析为对象
      const data =response.result// JSON.parse(response.result as string);
      console.log('解析后的JSON数据：', data);
    } else {
      console.error('请求失败，响应码：', response.responseCode);
    }
  } catch (error) {
    // 5. 捕获请求异常（如网络断开、超时等）
    console.error('请求发生异常：', JSON.stringify(error) );
  } finally {
    // 6. 销毁请求对象（释放资源，必做！）
    request.destroy();
  }
}
@Component
export struct QuickStartPage {
  @State message: string = '快速入门111';

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
        .onClick(()=>{
          console.log('aaa222>>')
          sendGetRequest()
        })
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




