# iOS-Learn-Demo
iOS学习中的练习Demo

## CollectionView Demo
学习 CollectionView 做的一个小Demo，尽量用了比较多的知识。

![collectionViewDemo](http://pic.zhkuo.me/ios_notes/collectionViewDemo.gif)

相应的知识总结：[CollectionView 详解](http://blog.zhkuo.me/2016/09/08/CollectionView%E8%AF%A6%E8%A7%A3/)

# 记录iOS学习中的零散知识点及好的教程、博客



## iOS、mac开源项目及库

* [朝夕笔记 Oncenote](https://github.com/chenyufeng1991/iOS-Oncenote)
	这是一款类似于印象笔记Evernote的生活类iOS应用——朝夕笔记 Oncenote
* [易便签](https://github.com/likumb/SimpleMemo)
* [iOS、mac第三方库](https://github.com/Tim9Liu9/TimLiu-iOS)
* [菜单分页控件](https://github.com/tianzhuo112/VTMagic)
* [realm数据库](https://realm.io/cn/docs/swift/latest/)
* [Swift写的轻量的聊天框架－github 2000starts](https://github.com/badoo/Chatto)
* [自动生成gitignore文件的网站](https://www.gitignore.io)

## iOS好的技术博客
* [标哥的技术博客](http://www.henishuo.com/)
* [Why's blog](http://blog.callmewhy.com/)
* [叶孤城___](http://www.jianshu.com/users/b82d2721ba07/latest_articles)
* [Swift Cafe](http://swiftcafe.io/)
* [伯乐在线](http://ios.jobbole.com)



## 好的项目
* [Swift做一个智能机器人](http://ios.jobbole.com/82960/)



## Swift相关知识
* [深入理解Swift的闭包](http://get.ftqq.com/6466.get)
* [swift编程风格](http://www.swift.ren/?cat=9)
* [Swift 中的利刃，函数和闭包](http://swiftcafe.io/2015/02/14/swift-tips-func-closure/)
* [官方swift教程](https://developer.apple.com/library/ios/referencelibrary/GettingStarted/DevelopiOSAppsSwift/Lesson1.html#//apple_ref/doc/uid/TP40015214-CH3-SW1)
* [swift编程规范](http://www.admin10000.com/document/6670.html)
	- 使用驼峰式的描述性命名方式，为类，方法，变量等命名。类名的首字母应该大写，而方法和变量的首字母使用小写字符。
	- 枚举
	- 　为了保持简洁，避免使用 self 关键词，Swift 不需要使用 self 来访问对象属性和调用对象方法。必须使用 self 来区分构造器中属性命名和参数命名，还有在闭包表达式中引用属性值(编译器需要区分):
	- 协议遵守：当我们对一个类添加协议时，推荐使用一个单独的类扩展来实现协议的方法。这可以保持协议相关的方法聚合在一起，同时也可以简单的标识出一个协议对应类中需要实现哪些对应的方法。
	- 如果闭包表达式参数在参数列表中的最后一个时，使用尾部闭包表达式。给定闭包参数一个描述性的命名。

## 相关教程
### 布局相关
* `CGRectMake CGRectMake(origin.x，origin.y，size.width. Size.height)`在代码中定义矩形。使用`CGPointMake(x，y)`创建点。`CGSize- Make(width，height)`创建大小。
* `CGRectZero`是一个高度和宽度为零、位于(0，0)的矩形常量。需要创建边框但还不确定边框大小或位置时，可以使用此常量
* `boundingRectWithSize` 返回文本绘制所占据的矩形空间。



### UICollectionView
* 有关UICollectionViewCell的用法，有源码，讲解比较详细：
	- [UICollectionView基础用法和简单自定义](http://blog.csdn.net/u010586842/article/details/48209153)
	- [UICollectionView介绍](http://blog.csdn.net/eqera/article/details/8134986)
	- [UICollectionView 使用 介绍](http://my.oschina.net/sunqichao/blog/182623#OSC_h4_12)
* [iOS开发之窥探UICollectionViewController(一) -- Ready Your CollectionViewController](http://www.cnblogs.com/ludashi/p/4791826.html)
* [iOS开发之窥探UICollectionViewController(二) --详解CollectionView各种回调](http://www.cnblogs.com/ludashi/p/4792480.html)
* [iOS开发之窥探UICollectionViewController(三) --使用UICollectionView自定义瀑布流](http://www.cnblogs.com/ludashi/p/4826818.html)
* [UICollectionView 全解](http://www.jianshu.com/p/4863a25d3b84)
* [iOS开发- UICollectionView详解+实例](http://blog.csdn.net/hitwhylz/article/details/20850675)
* [iOS UICollectionView 总结](http://cnbin.github.io/blog/2015/09/01/ios-uicollectionview-zong-jie/)


### 富文本相关
* [iOS富文本](http://www.itnose.net/detail/6177538.html)



### 动画相关
* [iOS自定义转场动画实战讲解](http://www.jianshu.com/p/ea0132738057)
* [UIButton用法](http://00red.com/blog/2015/07/28/teacher-swift-ui-button)
* [iOS动画的几种方法](http://hovertree.com/h/bjaf/pa1swwvw.htm)
* [iOS动画-从UIView动画说起](http://www.jianshu.com/p/6e326068edeb)



### 关于高度自适应
* [优化UITableViewCell高度计算的那些事](http://blog.sunnyxx.com/2015/05/17/cell-height-calculation/)
* [IOS8后使用AutoLayot自动计算Cell高度](http://pandaape.github.io/2015/12/03/5-IOS8SelfSizingCells/)
* [TableView的cell高度计算](http://blog.ximu.site/auto-calculate-cell-height/)



### 生命周期
* [Appdelegate的生命周期以及变量定义](http://blog.csdn.net/napoleonbai/article/details/40984247)


### storyboard相关
* [iOS9 Storyboard 教程1](http://www.jianshu.com/p/aaa4b89dbba1)
* [iOS9 Storyboard 教程2](http://www.jianshu.com/p/0ec8d6314791)

### UITextView
* [iOS 中 UITextView 遇到的问题总结](http://cnbin.github.io/blog/2015/10/13/ios-zhong-uitextview-yu-dao-de-wen-ti-zong-jie/)
* [UITextView属性，点击新增内容案例，及UITextViewDelegate里光标/值变化的操作方法](http://blog.csdn.net/weisubao/article/details/39612915)

### 下拉菜单

* [仿新浪微博IOS客户端（v5.2.8）——下拉菜单栏的实现](http://blog.csdn.net/android_ls/article/details/45877983)

### 搜索栏
* [用UISearchController自定义Search Bar](http://www.saitjr.com/ios/how-to-create-a-custom-search-bar-using-uisearchcontroller.html)
* [iOS开发-搜索栏UISearchBar和UISearchController](http://www.cnblogs.com/xiaofeixiang/p/4273620.html)
* [在iOS8中给TableView加一个搜索栏(Swift)](http://www.devtf.cn/?p=902)

### XMPP相关
*[XMPP学习教程](http://blog.csdn.net/jiajiayouba/article/details/44755385)
* [使用 XMPP 构建一个基于 web 的通知工具](http://www.ibm.com/developerworks/cn/xml/tutorials/x-realtimeXMPPtut/index.html)
* [Openfire与XMPP协议](http://www.abaiweb.com/uploads/4/406/8406/8406.shtml)
* [RFC3920_XMPP中文翻译规范](http://wenku.baidu.com/view/25086154f01dc281e53af0d2.html)


### 转场及转场动画
* [UIView之间布局及跳转的几种方式](http://icetime17.github.io/2015/06/16/2015-06/iOS-UIView%E4%B9%8B%E9%97%B4%E5%B8%83%E5%B1%80%E5%8F%8A%E8%B7%B3%E8%BD%AC%E7%9A%84%E5%87%A0%E7%A7%8D%E6%96%B9%E5%BC%8F/)
* [iOS 中使用ViewController控制转场的各种方法](http://www.jianshu.com/p/1a77b1c3e897)
	- UITabBarController 用于平级的view之间的跳转
	- UINavigationController提供了诸多方法用于进行view之间的切换及管理等, 如pushViewController与popViewController等.[UINavigationController的简单总结](http://blog.csdn.net/icetime17/article/details/42113591)
	- 使用storyboard 将一个ViewController放在storyboard中, 然后调用instantiateViewControllerWithIdentifier, 加载一个storyboard文件中的对应ID的storyboard(一系列view的集合), 也是非常常用的一种方式。
	- 使用nib文件，可以使用loadNibNamed:方法来加载nib文件
	- segue：对于两个单独的ViewController, 可以使用segue指定跳转方式.
	如在storyboard中, 在VC1中的button上右键, 连线至第二个VC, 选择跳转方式即可实现两个VC之间的相互跳转.如果想通过点击一个image, 实现VC的跳转呢? 这就要引入gesture了.
	- 通过addSubView：如self.view.addSubView(newView) 即可直接加载UIView, 使用removeFromSuperview将该UIView移除
* [iOS自定义转场动画](http://www.jianshu.com/p/ea0132738057)
* [唐巧iOS动画](http://blog.devtang.com/2016/03/13/iOS-transition-guide/)


### 网络相关
#### socket
* [iOS学习之Socket使用简明教程－ AsyncSocket](http://www.cokco.cn/thread-50629-1-1.html)
* [iOS开发之AsyncSocket使用教程](http://www.superqq.com/blog/2015/04/03/ioskai-fa-zhi-asyncsocketshi-yong-jiao-cheng/)
* [ AsyncSocket 建立 tcp socket 连接](http://mft.iteye.com/blog/2296699)
* [CocoaAsyncSocket库](https://github.com/robbiehanson/CocoaAsyncSocket)

#### Alamofire
* [How to use Alamofire and SwiftyJSON with Swift? – Swift 2 – iOS 9 – Xcode 7](http://ashishkakkad.com/2015/10/how-to-use-alamofire-and-swiftyjson-with-swift-swift-2-ios-9-xcode-7/)
* [how-to-create-a-wrapper-for-alamofire-and-swiftyjson-swift-ios](http://ashishkakkad.com/2016/03/how-to-create-a-wrapper-for-alamofire-and-swiftyjson-swift-ios/)
* [Alamfire网络库基础教程](http://www.swift51.com/post/1501.html)
* [Alamfire教程](https://github.com/ipader/SwiftGuide/wiki/Alamofire-%E6%9C%80%E4%BD%B3%E5%AE%9E%E8%B7%B5)
* [Swift - HTTP网络操作库Alamofire使用详解1（配置，以及数据请求）](http://www.hangge.com/blog/cache/detail_970.html)
* [Swift - HTTP网络操作库Alamofire使用详解2（文件上传）](http://www.hangge.com/blog/cache/detail_971.html)

#### SVProgressHUD

* [SVProgressHUD–比MBProgressHUD更好用的 iOS进度提示组件](http://www.ios122.com/2015/09/svprogresshud/)
* [SVProgressHUD 入门教程](http://yenn.me/SVProgressHUD-QuickStart.html)
* [开源第三方提示框控件SVProgressHUD](http://www.jianshu.com/p/704bd0fafbc9)
