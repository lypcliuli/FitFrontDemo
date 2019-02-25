# FitFrontDemo
FitFrontDemo 项目字号适配

### 原理：利用runtime交换了原来的系统的设置font的方法，通过添加系统方法的分类实现，demo中只写了两个方法的分类 需要的时候可自行添加。

### 这样的实现有一个很大的弊端就是切换字号设置之后，已创建过的控件字号不会自动改变，进入新页面不会有问题，所以已创建的所有页面都要刷新一遍font才会生效； 还有就是字号变大之后 很多地方的控件尺寸容不下大号字体显示不全，这个要注意

## 我这个是对于已有项目的字号切换方案， 如果你有更好的实现方法欢迎交流 QQ 1131991303

![效果预览](https://upload-images.jianshu.io/upload_images/668798-28d5f029d45c0e0e.gif?imageMogr2/auto-orient/strip)
