# sql-that-must-know

学习 SQL 必知必会（第五版）过程中的笔记实践

-----------
Here is the process I learned GitHub Pages

# GitHub Pages 实践——2022.3.23

## 官网

> https://pages.github.com/

## 官方文档

> https://docs.github.com/en/pages

GitHub Pages 站点总是由 GitHub Actions workflow 来部署的，因此每次更改仓库内容后都需要等 workflow 运行完，将新的内容部署好之后，才能看到网站内容的新变化。

## 快速开始

https://docs.github.com/en/pages/quickstart

GitHub Pages 是通过GitHub托管和发布的公共网页。最快的启动和运行方式是使用 Jekyll 主题选择器来加载一个预先制作的主题。然后你可以修改你的 GitHub Pages 的内容和样式。

## 开始

### 关于 GitHub Pages

你可以使用 GitHub Pages 直接从 GitHub.com 上的存储库中托管一个关于你自己、你的组织或你的项目的网站。

#### GitHub Pages 是什么

GitHub Pages 是一个**静态的站点托管服务**，它直接从 GitHub 的存储库中获取 HTML、CSS 和 JavaScript 文件，可以选择通过构建过程运行这些文件，并发布一个网站。

你可以在 GitHub 的  `github.io` 域名上托管你的网站，或也可以使用你自己的域名。

组织所有者可以从组织的存储库中禁用 GitHub Pages 网站的发布。

#### GitHub Pages 站点的类型

> 有三种类型的GitHub页面站点: 项目、用户和组织。
>
> **项目站点** 对应到 GitHub 上托管的特定项目。
>
> **用户和组织站点 **对应到 GitHub.com 上的特定帐户。

要发布用户站点，您必须创建一个由您的用户帐户拥有的存储库，该存储库名为 `<username>.github.io` 。要发布组织站点，必须创建一个名为 `<organization>.github.io` 的组织拥有的存储库。

> 除非你使用自己的域名，否则用户和组织站点将分别运行在 `http(s)://<username>.github.io` 和`http(s)://<organization>.github.io`

项目站点的源文件存储在与其项目相同的存储库中。

> 除非你使用自己的域名，否则项目站点将运行在 `http(s)://<username>.github.io/<repository>` 或`http(s)://<organization>.github.io/<repository>`

注意：

- 如果您私密地发布您的站点，您的站点的 URL 将是不同的。
- 在 GitHub 上，每个账号只能创建一个用户或组织站点。项目站点，无论是由组织或用户帐户拥有的，其数量都是无限制的。

#### GitHub Pages 站点的发布源

GitHub Pages 站点的发布源是存储源文件的分支和文件夹

注意：GitHub Pages 网站默认是公开的，即使该网站的存储库是私有的或内部的。

如果你的存储库中存在默认的发布源，GitHub Pages 将自动从该源发布一个站点。**用户和组织站点**的默认发布源是存储库的默认分支的根。**项目站点**的默认发布源是 gh-pages 分支的根。

如果希望将站点的源文件保存在不同的位置，可以更改站点的发布源。你可以从库中的任何分支发布你的站点，或者从该分支的库的根目录发布，或者从该分支的 /docs 文件夹发布。

如果你选择任何分支的 /docs 文件夹作为你的发布源，GitHub Pages 将读取所有的内容来发布你的站点，包括 /docs 文件夹中的 CNAME 文件。例如，当你通过 GitHub 页面设置编辑你的自定义域时，自定义域将写入 /docs/CNAME。

#### 静态网站生成器

GitHub Pages 发布任何你推送到存储库的静态文件。您可以创建自己的静态文件或使用静态站点生成器来为您构建站点。您还可以在本地或其他服务器上自定义自己的构建过程。我们推荐 Jekyll，一个内置支持 GitHub 页面的静态站点生成器，并且简化了构建过程。

GitHub 页面将默认使用 Jekyll 来构建您的网站。如果您想使用除 Jekyll 之外的静态站点生成器，请通过在发布源的根目录中创建一个名为 .nojekyll 的空文件来禁用 Jekyll 构建过程，然后按照静态站点生成器的说明在本地构建站点。

GitHub Pages 不支持服务器端语言，如 PHP、Ruby 或 Python。

#### GitHub Pages 的使用限制

在2016年6月15日之后创建的 GitHub Pages 网站，通过HTTPS服务使用`github.io`域名。

- 禁止使用

> GitHub Pages 不打算或不允许被用作免费的虚拟主机服务，以运行您的在线业务、电子商务网站或任何其他主要旨在促进商业交易或提供商业软件服务(SaaS)的网站。GitHub Pages 网站不应用于发送密码或信用卡号等敏感交易。
>
> 此外，您对 GitHub 页面的使用受 GitHub 服务条款的约束，包括对色情内容、暴力或威胁内容或活动的限制。

- 使用限制

> GitHub页面网站受以下使用限制:
>
> - GitHub Pages 源存储库的建议限制为 1GB
> - 已发布的 GitHub Pages 站点可能不超过 1GB
> - GitHub Pages 网站每个月的软带宽限制为100 GB

如果你的网站超过这些使用配额,我们可能无法为你的网站提供服务

#### GitHub 页面上的 MIME 类型

MIME 类型是用来标识数据类型的标签。它是用来让软件知道如何处理数据的。它在 Internet 上的作用与微软 Windows 上的文件扩展名相同。

**MIME 类型是服务器发送给浏览器的报头，提供有关浏览器所请求文件的性质和格式的信息**。GitHub Pages支持超过750种MIME类型，跨越数千个文件扩展名。支持的MIME类型列表是由 [MIME -db](https://github.com/jshttp/mime-db#adding-custom-media-types) 项目生成的。

#### 数据收集

当访问者访问 GitHub Pages 网站时，为了安全目的，无论访问者是否已登录GitHub，访问者的IP地址都将被记录和存储。

### 创建一个 GitHub Pages 站点

你可以在一个新的或已有的存储库中创建一个GitHub Pages站点。

具体流程参看：https://docs.github.com/en/pages/getting-started-with-github-pages/creating-a-github-pages-site

#### 为站点创建存储库

如果您的站点是一个独立的项目，您可以创建一个新的存储库来存储站点的源代码。如果您的站点与一个已存在的项目相关联，您可以将源代码添加到该项目的存储库中的默认分支或不同分支的 /docs 文件夹中。例如，如果你正在创建一个网站来发布一个已经在GitHub上的项目的文档，你可能想要将该网站的源代码存储在与项目相同的存储库中。

> 1. 在任何页面的右上角，点击下拉菜单，并选择 New repository
> 2. 使用 Owner 下拉菜单，并选择您希望拥有存储库的帐户
> 3. 键入存储库的名称和可选描述。如果您正在创建一个**用户或组织站点**，您的存储库必须命名为`<user>.github.io` 或`<organization>.github.io` 。**如果您的用户或组织名称包含大写字母，则必须小写字母**
> 4. 选择存储库的可见性，一般选择 public
> 5. 选择“用 README 初始化这个存储库”
> 6. 点击创建存储库

#### 创建你的网站

在你创建你的网站之前，你必须在GitHub上为你的网站建立一个存储库。如果没有在现有存储库中创建站点，请参见“为站点创建存储库”。

> 1. 在GitHub上，导航到你的网站的存储库
> 2. 决定您想要使用的**发布源**
> 3. 如果您选择的发布源已经存在，请导航到该发布源。如果您选择的发布源不存在，请创建该发布源。
> 4. 在发布源的根目录下，创建一个名为`index.md`的新文件，其中包含您希望在站点主页上显示的内容。```（注意：如果存在index.html，则使用 index.html 代替 index.md。如果既没有 index.html 也没有 index.md，那么将会使用 README.md）```
> 5. 配置发布源
> 6. 在存储库名称下，单击 Settings
> 7. 在侧边栏的 “Code and automation” 部分，单击Pages
> 8. 另外，如果您使用 GitHub 企业云从一个组织拥有的私有或内部存储库发布一个项目站点，请为您的站点选择可见性。在“GitHub Pages”下，选择GitHub页面可见性下拉菜单，然后点击可见性
> 9. 要查看您发布的网站，请在“GitHub Pages”下，单击您网站的URL（`注意：在您将更改推送到GitHub后，您的站点的更改可能需要10分钟才能发布`。）
> 10. **如果你的 GitHub Pages 站点是由一个公共库构建的，那么它是用一个 GitHub Actions 工作流来构建和部署的**，除非你配置了你的 GitHub Pages 站点来使用一个不同的CI工具。

#### 下一个步骤

您可以通过创建更多的新文件向站点添加更多的页面。在您的站点上，每个文件将以与发布源相同的目录结构提供。例如，如果您的项目站点的发布源是 `gh-pages `分支，并且您创建了一个名为 `/about/contact-us.md` 的新文件。这个文件将会在 `https://<user>.github.io/<repository>/about/contact-us.html` ，还可以添加主题来自定义站点的外观。为了定制你的网站，你可以使用 Jekyll，一个内置支持 GitHub 页面的静态网站生成器。

### 使用主题选择器为 GitHub Pages 添加主题

你可以添加一个主题到你的 GitHub Pages 网站，自定义你的网站的外观

拥有存储库管理权限的用户可以使用主题选择器向 GitHub Pages 站点添加主题。

#### 关于主题选择器

主题选择器将一个 Jekyll 主题添加到存储库中。

主题选择器的工作方式取决于您的存储库是公共的还是私有的：

- 如果你的存储库已经启用了 GitHub Pages，主题选择器会将你的主题添加到当前的发布源中。
- 如果你的存储库是公共的，并且禁用了 GitHub Pages，使用主题选择器将启用 GitHub Pages 并配置默认分支作为你的发布源。
- 如果你的存储库是私有的，并且禁用了 GitHub Pages，你必须通过配置一个发布源来启用 GitHub Pages，然后你才能使用主题选择器。

如果您过去手动向存储库添加了一个 Jekyll 主题，那么即使您使用了主题选择器，这些文件也可能会被应用。**为了避免冲突，请在使用主题选择器之前删除所有手动添加的主题文件夹和文件**。

#### 使用主题选择器添加主题

> 1. 在 GitHub 上，导航到你网站的存储库。
> 2. 在存储库名称下，单击 Settings。
> 3. 在侧边栏的“Code and automation”部分，单击Pages。
> 4. 在“GitHub Pages”下，单击“ **Choose a theme**”或“**Change theme**”。
> 5. 在页面顶部，单击您想要的主题，然后单击 **Select theme**。
> 6. 您可能会被提示需要编辑站点的 `README.md` 文件。
>
> 您选择的主题将自动应用于存储库中的 markdown 文件。要将主题应用于存储库中的 HTML 文件，需要添加  YAML front matter，它为每个文件指定布局。

### 为GitHub Pages 站点配置发布源

如果你使用 GitHub Pages 网站的默认发布源，你的网站将自动发布。您也可以选择从不同的分支或文件夹发布站点。注：拥有存储库管理员或者 maintainer 权限的人可以为GitHub Pages站点配置发布源。

#### 选择发布源

在配置发布源之前，请确保要用作发布源的分支已经存在于存储库中。

> 1. 在GitHub上，导航到你网站的存储库。
> 2. 在存储库名称下，单击Settings。
> 3. 在侧边栏的“Code and automation”部分，单击Pages。
> 4. 在“GitHub Pages”下，使用 None 或 Branch 下拉菜单并选择一个发布源。
> 5. 或者，使用下拉菜单为发布源选择一个文件夹。
> 6. 单击保存

#### 排查 GitHub Pages 网站的发布问题

如果你选择了任何分支上的 `docs` 文件夹作为你的发布源，然后在你的存储库中从该分支删除 `/docs` 文件夹，你的站点将不会生成，并且你会得到一个缺少 `/docs `文件夹的页面构建错误消息

**你的GitHub Pages站点将始终与GitHub Actions工作流运行部署，即使你已经配置了你的GitHub Pages站点使用不同的CI工具来构建。**大多数外部CI工作流通过将构建输出提交到存储库的 `gh-pages分支` 来“**部署**”到GitHub Pages，通常包括一个`.nojekyll文件`（用来禁用 Jekky 对项目的构建）。当这种情况发生时，GitHub Actions workflow 将检测到分支不需要构建步骤的状态，并将只执行将站点部署到GitHub Pages服务器所需要的步骤。

为了发现构建或部署的潜在错误，你可以通过检查你的仓库的工作流运行情况来检查 GitHub Pages 站点的工作流运行情况。

### 为你的 GitHub Pages 站点自定义一个 404 页面

当用户试图访问站点上不存在的页面时，可以显示自定义 404 错误页面。

> 1. 在 GitHub 上，导航到你网站的存储库。
>
> 2. 导航到您站点的发布源。
>
> 3. 在文件列表上方，使用“**Add file**”下拉菜单，单击“**Create new file**”。
>
> 4. 在文件名字段中，键入`404.html`或`404.md`。
>
> 5. 如果您将文件命名为`404.md`，在文件开头添加以下 YAML front matter:
>
>    ```yaml
>    ---
>    permalink: /404.html
>    ---
>    ```
>
> 6. 在页面底部，键入一个简短的、有意义的提交消息，描述您对文件所做的更改。
>
> 7. 如果你在 GitHub.com 上有一个以上的电子邮件地址与你的帐户相关联，点击电子邮件地址下拉菜单，选择电子邮件地址作为Git 作者的电子邮件地址。下拉菜单中只显示验证过的电子邮件地址。如果您启用了电子邮件地址隐私，那么`<username>@users.noreply.github.com` 是默认的提交作者电子邮件地址
>
> 8. 在提交消息字段下面，决定是将提交添加到当前分支还是添加到新分支。如果你当前的分支是默认的分支，你应该选择为你的提交创建一个新的分支，然后创建一个  PR。
>
> 9. 点击 **Propose new file.**

404 页面效果如下

![image-20220324160818722](https://raw.githubusercontent.com/zhicheng-ning/Pic-Go/main/md/image-20220324160818722.png)

### 使用 Https 保护你的 GItHub Pages 站点

HTTPS增加了一层加密，以防止其他人窥探或篡改您的站点的流量。您可以强制您的GitHub页面站点使用HTTPS，以透明地将所有HTTP请求重定向到HTTPS。

拥有存储库管理员权限的用户可以强制GitHub Pages站点使用HTTPS协议。

#### 关于HTTPS和GitHub Pages

所有的GitHub Pages 站点，包括正确配置自定义域的站点，都支持HTTPS和强制执行HTTPS。

GitHub Pages网站不应用于发送密码或信用卡号等敏感交易。

#### 为你的GitHub Pages 站点强制使用HTTPS

> 1. 在GitHub上，导航到你网站的存储库。
> 2. 在存储库名称下，单击Settings。
> 3. 在侧边栏的“Code and automation”部分，单击Pages。
> 4. 在“GitHub Pages”下，选择“强制HTTPS”。

#### 证书发放故障排除(“证书尚未创建”错误)

在页面设置中设置或更改自定义域时，将开始自动检查 DNS。此检查确定您的DNS设置是否配置为允许GitHub自动获取证书。如果检查成功，GitHub将从Let’s Encrypt请求一个TLS证书。在收到有效的证书时，GitHub会自动将其上传到服务器上。当此过程成功完成时，在自定义域名旁边显示复选标记。

这个过程可能需要一些时间。如果在单击Save之后几分钟内该过程还没有完成，请尝试单击自定义域名旁边的Remove。重新输入域名并再次单击保存。这将取消并重新启动配置过程。

#### 解决 Mixed Content 的问题

如果你为你的GitHub页面网站启用HTTPS，但你的网站的HTML仍然可以通过 HTTP 引用 images，CSS，或JavaScript，那么你的网站将提供 mixed content。提供mixed content 可能会使您的站点不那么安全，并导致加载资源时出现问题。

要删除您网站的 mixed content，请确保在将 `http://` 编程 `https://` 的过程中，你的网站中 html 所引用的所有资源都是通过 https 来请求的。

资源通常位于以下位置：

- 如果你的站点使用了`Jekyll`，你的`HTML文件`可能会在`_layouts`文件夹中找到。
- CSS通常可以在HTML文件的`<head>`部分找到。
- javascript通常在`<head>`部分中找到或是在` </body>`标签之前
- images 通常在`<body>`部分中找到

提示：如果你不能在你网站的源文件中找到你的资源，尝试在你的文本编辑器或GitHub上搜索你网站的源文件的http。

#### HTML文件中引用的资源示例

|  资源类型  |                             HTTP                             |                            HTTPS                             |
| :--------: | :----------------------------------------------------------: | :----------------------------------------------------------: |
|    CSS     | `<link rel="stylesheet" href="http://example.com/css/main.css">` | `<link rel="stylesheet" href="https://example.com/css/main.css">` |
| JavaScript | `<script type="text/javascript" src="http://example.com/js/main.js"></script>` | `<script type="text/javascript" src="https://example.com/js/main.js"></script>` |
|   Image    | `<A HREF="http://www.somesite.com"><IMG SRC="http://www.example.com/logo.jpg" alt="Logo"></a>` | `<A HREF="https://www.somesite.com"><IMG SRC="https://www.example.com/logo.jpg" alt="Logo"></a>` |

### 在GitHub Pages 中使用子模块

如果你的GitHub Pages站点的存储库包含子模块，它们的内容将在你的站点构建时自动拉入。

你只能使用指向公共存储库的子模块，因为GitHub Pages服务器不能访问私有存储库。

为你的子模块使用 `https://` 只读的 URL，你可以在你的.gitmodules文件中进行修改。

### 解除 GitHub Pages 站点

您可以取消发布您的GitHub Pages 网站，使该网站不再可用。

步骤较简单，直接参考 [官方文档](https://docs.github.com/en/pages/getting-started-with-github-pages/unpublishing-a-github-pages-site) 即可，此处不再赘述

## 使用 Jekyll  创建站点







## 配置一个自定义域名

#### 参考文档

https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site

#### 实践过程

首先直接在 DNS 提供商添加一条 dns 解析记录即可。

- 记录类型设置为 CNAME
- 主机记录设置为个性二级域名，此处示例为`ones.nzcer.cn`
- 记录值根据实际情况设置为：`<username>.github.io` 或者 `<organizationname>.github.io`

![image-20220324155729406](https://raw.githubusercontent.com/zhicheng-ning/Pic-Go/main/md/image-20220324155729406.png)

然后再 GitHub Pages 页面，设置好自定义的域名等待期 DNS 检查完成即可。注意开启下面的 Enforce HTTPS ，强制使用 Https 提高网站的安全性。

![image-20220324155944065](https://raw.githubusercontent.com/zhicheng-ning/Pic-Go/main/md/image-20220324155944065.png)

最后直接访问 https://ones.nzcer.cn 即可

![image-20220324160245244](https://raw.githubusercontent.com/zhicheng-ning/Pic-Go/main/md/image-20220324160245244.png)

