# GitHub Pages 部署脚本
# 作者: 吕德淞

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   简历网页 GitHub Pages 部署工具" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# 检查是否安装Git
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "错误: 未检测到Git，请先安装Git！" -ForegroundColor Red
    Write-Host "下载地址: https://git-scm.com/download/win" -ForegroundColor Yellow
    exit 1
}

Write-Host "✓ Git已安装" -ForegroundColor Green
Write-Host ""

# 检查Git配置
$gitUser = git config user.name
$gitEmail = git config user.email

if (-not $gitUser) {
    Write-Host "请输入您的GitHub用户名:" -ForegroundColor Yellow
    $userName = Read-Host
    git config --global user.name "$userName"
    Write-Host "✓ 已设置用户名: $userName" -ForegroundColor Green
} else {
    Write-Host "✓ Git用户名: $gitUser" -ForegroundColor Green
}

if (-not $gitEmail) {
    Write-Host "请输入您的GitHub邮箱:" -ForegroundColor Yellow
    $userEmail = Read-Host
    git config --global user.email "$userEmail"
    Write-Host "✓ 已设置邮箱: $userEmail" -ForegroundColor Green
} else {
    Write-Host "✓ Git邮箱: $gitEmail" -ForegroundColor Green
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "请选择部署方式:" -ForegroundColor Cyan
Write-Host "1. 首次部署 (创建新仓库)" -ForegroundColor White
Write-Host "2. 更新部署 (已有仓库)" -ForegroundColor White
Write-Host "========================================" -ForegroundColor Cyan
$choice = Read-Host "请输入选项 (1 或 2)"

if ($choice -eq "1") {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host "   首次部署向导" -ForegroundColor Cyan
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host ""
    
    Write-Host "请输入您的GitHub用户名:" -ForegroundColor Yellow
    $githubUser = Read-Host
    
    Write-Host ""
    Write-Host "请输入仓库名称 (建议使用: resume 或 $githubUser.github.io):" -ForegroundColor Yellow
    Write-Host "提示: 如果使用 用户名.github.io 格式，访问地址会更简洁" -ForegroundColor Gray
    $repoName = Read-Host
    
    Write-Host ""
    Write-Host "准备部署到: https://github.com/$githubUser/$repoName" -ForegroundColor Cyan
    Write-Host ""
    
    # 添加所有文件
    Write-Host "正在添加文件..." -ForegroundColor Yellow
    git add .
    
    # 提交
    Write-Host "正在提交代码..." -ForegroundColor Yellow
    git commit -m "首次提交: 个人简历网页 by 吕德淞"
    
    # 设置主分支名
    Write-Host "正在设置主分支..." -ForegroundColor Yellow
    git branch -M main
    
    # 添加远程仓库
    Write-Host "正在添加远程仓库..." -ForegroundColor Yellow
    git remote add origin "https://github.com/$githubUser/$repoName.git"
    
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "   本地准备完成！" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "接下来的步骤:" -ForegroundColor Cyan
    Write-Host "1. 访问 https://github.com/new" -ForegroundColor White
    Write-Host "2. Repository name 填写: $repoName" -ForegroundColor White
    Write-Host "3. 选择 Public (公开)" -ForegroundColor White
    Write-Host "4. 不要勾选 'Initialize this repository with a README'" -ForegroundColor White
    Write-Host "5. 点击 'Create repository'" -ForegroundColor White
    Write-Host ""
    Write-Host "创建好仓库后，按回车继续推送代码..." -ForegroundColor Yellow
    Read-Host
    
    # 推送代码
    Write-Host "正在推送到GitHub..." -ForegroundColor Yellow
    git push -u origin main
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "========================================" -ForegroundColor Green
        Write-Host "   代码推送成功！" -ForegroundColor Green
        Write-Host "========================================" -ForegroundColor Green
        Write-Host ""
        Write-Host "最后一步 - 启用GitHub Pages:" -ForegroundColor Cyan
        Write-Host "1. 访问 https://github.com/$githubUser/$repoName/settings/pages" -ForegroundColor White
        Write-Host "2. Source 选择 'Deploy from a branch'" -ForegroundColor White
        Write-Host "3. Branch 选择 'main' 分支，文件夹选择 '/ (root)'" -ForegroundColor White
        Write-Host "4. 点击 'Save' 保存" -ForegroundColor White
        Write-Host "5. 等待1-2分钟后访问您的网站" -ForegroundColor White
        Write-Host ""
        
        if ($repoName -eq "$githubUser.github.io") {
            Write-Host "您的网站地址: https://$githubUser.github.io" -ForegroundColor Green
        } else {
            Write-Host "您的网站地址: https://$githubUser.github.io/$repoName" -ForegroundColor Green
        }
        Write-Host ""
        Write-Host "是否现在打开GitHub设置页面? (Y/N)" -ForegroundColor Yellow
        $openBrowser = Read-Host
        if ($openBrowser -eq "Y" -or $openBrowser -eq "y") {
            Start-Process "https://github.com/$githubUser/$repoName/settings/pages"
        }
    } else {
        Write-Host ""
        Write-Host "推送失败！可能的原因:" -ForegroundColor Red
        Write-Host "1. GitHub仓库未创建" -ForegroundColor Yellow
        Write-Host "2. 用户名或仓库名错误" -ForegroundColor Yellow
        Write-Host "3. 需要登录GitHub (首次推送需要输入凭据)" -ForegroundColor Yellow
        Write-Host ""
        Write-Host "请检查后重新运行此脚本" -ForegroundColor Yellow
    }
    
} elseif ($choice -eq "2") {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host "   更新部署" -ForegroundColor Cyan
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host ""
    
    # 检查是否有远程仓库
    $remoteUrl = git remote get-url origin 2>$null
    
    if (-not $remoteUrl) {
        Write-Host "错误: 未找到远程仓库配置" -ForegroundColor Red
        Write-Host "请使用选项1进行首次部署" -ForegroundColor Yellow
        exit 1
    }
    
    Write-Host "远程仓库: $remoteUrl" -ForegroundColor Green
    Write-Host ""
    
    # 显示修改的文件
    Write-Host "已修改的文件:" -ForegroundColor Yellow
    git status --short
    Write-Host ""
    
    Write-Host "请输入本次更新说明:" -ForegroundColor Yellow
    $commitMsg = Read-Host
    
    if (-not $commitMsg) {
        $commitMsg = "更新简历内容 - $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
    }
    
    # 添加、提交、推送
    Write-Host "正在添加文件..." -ForegroundColor Yellow
    git add .
    
    Write-Host "正在提交..." -ForegroundColor Yellow
    git commit -m "$commitMsg"
    
    Write-Host "正在推送到GitHub..." -ForegroundColor Yellow
    git push
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "========================================" -ForegroundColor Green
        Write-Host "   更新成功！" -ForegroundColor Green
        Write-Host "========================================" -ForegroundColor Green
        Write-Host ""
        Write-Host "您的网站将在1-2分钟后自动更新" -ForegroundColor Cyan
        
        # 尝试从remote URL提取网站地址
        if ($remoteUrl -match "github.com[:/](.+)/(.+)\.git") {
            $user = $matches[1]
            $repo = $matches[2]
            if ($repo -eq "$user.github.io") {
                Write-Host "网站地址: https://$user.github.io" -ForegroundColor Green
            } else {
                Write-Host "网站地址: https://$user.github.io/$repo" -ForegroundColor Green
            }
        }
    } else {
        Write-Host ""
        Write-Host "推送失败！" -ForegroundColor Red
        Write-Host "请检查网络连接和GitHub权限" -ForegroundColor Yellow
    }
    
} else {
    Write-Host "无效的选项，请运行脚本重新选择" -ForegroundColor Red
}

Write-Host ""
Write-Host "按任意键退出..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
