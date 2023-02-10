#flutter_jenkins_build_test

1.iOS相关设置

系统管理-Manage Credentials

![截屏2023-02-09 11 13 57](https://user-images.githubusercontent.com/16223789/217708686-b58fd136-925a-4b43-a6a1-181a11584037.png)

2.环境变量配置

      点击系统管理>系统设置>,

![截屏2023-02-09 11 36 39](https://user-images.githubusercontent.com/16223789/217711701-0156a1b7-a86d-4895-883f-63b6975c828e.png)

项目路径下 echo $path
注意注意 PATH 要大写 并且更改后要清除 Workspace 运行
![截屏2023-02-09 11 51 45](https://user-images.githubusercontent.com/16223789/217713677-78677344-bc6d-4c7b-86c2-73d64fa3c874.png)


![截屏2023-02-09 11 54 43](https://user-images.githubusercontent.com/16223789/217713980-caf14fa8-25b5-4a99-a8dd-b79507330f13.png)

![截屏2023-02-09 11 57 23](https://user-images.githubusercontent.com/16223789/217714285-df320dc2-3dad-40a1-aa03-e94e42190108.png)

JDK 查看jdk路径命令:  /usr/libexec/java_home -V

![截屏2023-02-09 11 58 11](https://user-images.githubusercontent.com/16223789/217714392-d4bd8c12-efa9-476c-a75c-9742e388381a.png)

gradle 配置
查看项目的gradle版本：打开gradle-wrapper文件可以看到这一行，其实就是所需gradle的下载网址，如果本地没有找到Android会自动到这个网址进行下载。
查看gradle的路径：File——>Settings——>Build——>Gradle，然后可以看到gradle所在路径

![截屏2023-02-09 13 36 08](https://user-images.githubusercontent.com/16223789/217727162-62317ae6-1657-4711-8038-b82825a2dd06.png)


![截屏2023-02-09 13 31 56](https://user-images.githubusercontent.com/16223789/217726646-54ca5ef6-cd05-4535-a5ad-5b196dba5001.png)

添加凭据
![907ce3e87f204ad7bc10673d0350ac44](https://user-images.githubusercontent.com/16223789/217728036-32af8d3c-db05-4f4a-a7ac-652ffe37fb55.png)

![a125e680fe2e4f89aa9c77046e813779](https://user-images.githubusercontent.com/16223789/217728059-61ad4a39-b403-44f5-9848-c726be2dcd16.png)
添加git 账户信息
1. 点击全局
2. 点击右上角 add Credentials
![8b11a6bbb78d4f2398263f4198e22876](https://user-images.githubusercontent.com/16223789/217728159-8ac79a9a-1174-4897-ba17-895a3687709a.png)

![17f9480982fb4f22b974578273a6cca5](https://user-images.githubusercontent.com/16223789/217728671-36eaafaa-78d8-4902-b182-5df1e107854c.png)

![5a2a13be00f34f27873d485fc0115747](https://user-images.githubusercontent.com/16223789/217728699-78710eec-ce52-4394-a88b-f59ec6126102.png)

<access token> github令牌  <userName> github名字  <repository>项目名称
https://<access token>@github.com/<userName>/<repository>.git

注意 /Users/xxxx/.jenkins 是本mac 安装 .jenkins目录  Androidflutter 是你的job  
使用fvm 管理flutter 命令必须带上 fvm 
![截屏2023-02-09 16 41 46](https://user-images.githubusercontent.com/16223789/217760740-882e392e-3f69-4c6a-b030-d0b1fdf430d1.png)


![截屏2023-02-09 16 41 46](https://user-images.githubusercontent.com/16223789/217760740-882e392e-3f69-4c6a-b030-d0b1fdf430d1.png)简书
![截屏2023-02-09 16 41 46](https://user-images.githubusercontent.com/16223789/217760740-882e392e-3f69-4c6a-b030-d0b1fdf430d1.png)
 
ios fastlane 
可参考简书 https://www.jianshu.com/p/f6962ab9e491
https://www.jianshu.com/p/bc973ed0a8d9
https://www.jianshu.com/p/407b91d702b2

 jenkins Execute shell 安卓命令
/Users/zhangle/.jenkins 本机jenkins 安装位置
jenkins AndroidiOSflutterbuild 任务名
      
cd /Users/zhangle/.jenkins/workspace/AndroidiOSflutterbuild 
      
source /etc/profile
      
fvm flutter clean 
      
fvm flutter build apk --release
      

jenkins Execute shell iOS命令
ios_build fastlane 任务
      
      
cd /Users/zhangle/.jenkins/workspace/AndroidiOSflutterbuild
      
source /etc/profi
      
cd /ios
      
#!/bin/sh
           
export LANG=en_US.UTF-8 
      
pod install
      
fastlane ios_build 
      


