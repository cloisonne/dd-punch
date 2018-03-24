### 还能用吗:no_mouth:

钉钉目前无法虚拟定位了，提一个issue去掉虚拟定位
改成单纯打卡软件


### 是什么


钉钉自动打卡脚本，加入了虚拟定位，配合天下游和触动精灵使用。

---
### 来自哪

folk自<https://github.com/chenqingspring/dd-punch>

---
### 重写了什么


1. 加入了调用天下游的代码，天下游只需要设置一次，无需注册，每次打开即可虚拟定位。（需root）
1. 当每天的打卡次数达到4次（上午上下班，下午上下班），原代码无法使用，很可惜我们实验室每天要打卡4次。
1. 原代码中的click不能针对HTML5页面，该点主要针对钉钉旧版本。

---
### 重要提示！！！


* **保证触动精灵总是在运行** 
* **取消任何屏幕解锁**
* **建议手机处于充电状态，打开USB调试中的充电不锁屏选项**
* **代码已经自动重试3次，可以多设几次时间**

---

### 准备
1. 一台android手机，需要root
2. 数据线和充电插头
3. 安装[触动精灵](http://www.touchsprite.com/)android和天下游(http://www.txyapp.com/)
4. 上述最新安装包在APKs文件夹内
    
### 安装方法一：手动（不建议）

* 安装上(下)班打卡
	* 点击触动精灵左上角新建脚本, 任意命名。如：『钉钉上(下)班打卡』
	* 将项目 `punch-in(out)/main.lua` 文件内容粘贴到脚本中
	* 设置定时运行时间, 如：8：50 (18: 01)
	
### 安装方法二：使用触动精灵APP扫码

* 上班打卡

![上班打卡二维码](./punch-in/qrcode.png )

* 下班打卡

![下班打卡二维码](./punch-out/qrcode.png)



### 已测试软件最新版本

| 钉钉  | 触动精灵 | 系统 |
|:------------- |:---------------:| -------------:|
| v4.0.2       | v2.2.8 |         MIUI |



### 脚本定制

* 开发者选项 -> 打开显示触摸操作, 打开指针位置
* 获取『考勤』按钮坐标
* 获取『上/下班打卡』按钮坐标
* 替换脚本里的 `findMultiColorInRegionFuzzyByTable` 方法对应的x和y坐标的值
* 如果有问题，欢迎folk和开issue
