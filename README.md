# 吕德淞 - 个人简历网页

在线访问：**[https://lvdacong.github.io](https://lvdacong.github.io)**

这是一个现代化、响应式的个人简历网页，采用纯前端技术栈，完美支持移动端和桌面端。

## ✨ 特性

### 🎨 设计特性
- ✅ 现代化渐变UI设计
- ✅ 流畅的滚动动画效果
- ✅ 精美的卡片式布局
- ✅ 响应式设计，完美适配所有设备
- ✅ 优雅的悬停交互效果
- ✅ 自适应深色模式支持

### 🚀 功能特性
- ✅ 平滑滚动导航
- ✅ 移动端汉堡菜单
- ✅ 页面加载动画
- ✅ 回到顶部按钮
- ✅ 一键打印简历（Ctrl+P）
- ✅ 访问量统计（本地存储）
- ✅ 邮箱地址一键复制
- ✅ 图片懒加载
- ✅ 键盘快捷键支持
- ✅ 无障碍访问优化

### ⚡ 性能优化
- ✅ 轻量级，无依赖框架
- ✅ CSS动画硬件加速
- ✅ 图片加载失败降级
- ✅ 性能监控日志
- ✅ 优化的打印样式

## 文件结构

```
简历网页/
├── index.html          # 主页面
├── style.css           # 样式文件
├── script.js           # 交互脚本
├── avatar.png          # 个人头像（需要您添加）
└── README.md           # 说明文档
```

## 🚀 快速开始

### 1️⃣ 准备头像
将您的头像图片命名为 `avatar.png` 并放在项目根目录
- 推荐尺寸：400x400 像素或更大
- 推荐格式：PNG/JPG
- 推荐大小：< 500KB

### 2️⃣ 本地预览

**方法一：直接打开**
```bash
# 双击 index.html 文件即可在浏览器中预览
```

**方法二：使用VS Code Live Server**
```bash
# 1. 在VS Code中安装 Live Server 插件
# 2. 右键 index.html
# 3. 选择 "Open with Live Server"
```

**方法三：使用Python简单服务器**
```bash
# Python 3
python -m http.server 8000

# 然后访问 http://localhost:8000
```

### 3️⃣ 自定义修改

#### 修改个人信息
编辑 `index.html`，搜索并替换相关内容：
- 姓名、联系方式
- 教育背景
- 工作经历
- 项目经历
- 技能特长

#### 修改主题颜色
编辑 `style.css` 的 `:root` 部分：
```css
:root {
    --primary-color: #2563eb;      /* 主色调 */
    --secondary-color: #1e40af;    /* 次要色 */
    --accent-color: #3b82f6;       /* 强调色 */
}
```

#### 调整布局
- 修改 `style.css` 中的栅格布局
- 调整卡片间距、字体大小等

## 主题颜色自定义

在 `style.css` 的 `:root` 中修改以下变量：

```css
:root {
    --primary-color: #2563eb;      /* 主色调 */
    --secondary-color: #1e40af;    /* 次要色 */
    --accent-color: #3b82f6;       /* 强调色 */
}
```

## 浏览器支持

- Chrome (推荐)
- Firefox
- Safari
- Edge
- 现代移动浏览器

## 部署

### GitHub Pages
1. 创建 GitHub 仓库
2. 上传所有文件
3. 在仓库设置中启用 GitHub Pages
4. 选择主分支作为源

### Netlify
1. 注册 Netlify 账号
2. 拖拽项目文件夹到 Netlify
3. 自动部署完成

## 📂 项目结构

```
简历网页/
├── index.html          # 主页面
├── style.css           # 样式文件
├── script.js           # 交互脚本
├── avatar.png          # 个人头像
├── deploy.ps1          # 快速部署脚本
├── README.md           # 项目说明
└── .gitignore          # Git配置
```

## 🛠️ 技术栈

| 技术 | 说明 |
|------|------|
| **HTML5** | 语义化标签，SEO友好 |
| **CSS3** | Flexbox、Grid、动画、渐变 |
| **JavaScript** | 原生ES6+，无框架依赖 |
| **Font Awesome** | 图标库（CDN引入） |

## ⌨️ 快捷键

| 快捷键 | 功能 |
|--------|------|
| `Ctrl/Cmd + P` | 打印简历 |
| `Esc` | 关闭移动端菜单 |

## 📱 浏览器支持

| 浏览器 | 版本 |
|--------|------|
| Chrome | ✅ 最新版 |
| Firefox | ✅ 最新版 |
| Safari | ✅ 最新版 |
| Edge | ✅ 最新版 |
| Mobile | ✅ iOS 12+, Android 5+ |

## 📸 截图预览

> 提示：可以添加实际截图到项目中

- 桌面端效果
- 移动端效果
- 打印预览效果

## 🔧 进阶自定义

### 添加新的Section
1. 在 `index.html` 中添加新的 `<section>` 标签
2. 在导航栏添加对应链接
3. 按需添加CSS样式

### 集成分析工具

**Google Analytics**
```html
<!-- 在 </head> 前添加 -->
<script async src="https://www.googletagmanager.com/gtag/js?id=GA_MEASUREMENT_ID"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'GA_MEASUREMENT_ID');
</script>
```

**百度统计**
```html
<!-- 在 </head> 前添加 -->
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?你的统计ID";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
```

## � 更新网站

修改内容后，使用以下任一方式更新：

**方法1：使用脚本**
```powershell
.\deploy.ps1
```

**方法2：使用命令行**
```bash
git add .
git commit -m "更新内容"
git push
```

**方法3：使用GitHub Desktop**
- 打开GitHub Desktop
- 提交更改
- 点击 "Push origin"

等待1-2分钟，网站自动更新。

## 📮 联系方式

- **作者**: 吕德淞
- **邮箱**: lvdacong@sjtu.edu.cn
- **电话**: 18621506297

## 🙏 致谢

- Font Awesome 提供的图标
- 所有开源社区的贡献者

---

<div align="center">
  
**如果这个项目对您有帮助，请给个 ⭐ Star 支持一下！**

Made with ❤️ by 吕德淞

</div>
