# dotfiles
## 安装系统依赖

```Bash
brew insall fd
brew install cloc
brew install git
brew install tmux
brew install jenv
brew install nvm
brew install lazygit
```

## Linux/MacOS执行启动脚本
```
chmod 755 ./install.sh
./install.sh
```

## windows(wsl)
1. 同上执行start.sh
2. 复制wslconfig文件到windows home目录下：~/.wslconfig ([wslconfig doc](https://learn.microsoft.com/zh-cn/windows/wsl/wsl-config))
3. wsl中执行`pxy`开启代理，`unpxy`取消代理（[zsh pxy](https://github.com/horaoen/dotfiles/blob/c6089acff0a611b5f88e7813a91bf88d853b0d48/zshrc#L33))