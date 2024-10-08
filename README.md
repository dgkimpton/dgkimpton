# Welcome friend

Feel free to look around, peruse my occasional blogs, or check out my social media presence.

* [Personal Blog](https://www.deconflations.com/)  
* [Gaming blog](https://dgkimpton.github.io/reaction/)  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[![Twitter](https://img.shields.io/twitter/follow/dgkimpton?style=social)](https://twitter.com/dgkimpton)  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[![LinkedIn](https://static-exp1.licdn.com/scds/common/u/images/logos/linkedin/logo_linkedin_93x21_v2.png)](https://www.linkedin.com/in/dgkimpton/)


### Notes to self
<details><summary>Steps for setting up a new computer </summary>

clone this repo into home directory  
```
ssh-keygen -t ed25519 -C "dgkimpton@gmail.com"
```
enter `/home/<user>/.ssh/github`

  go to https://github.com/settings/keys  
  and add the key from 'cat .ssh/github.pub'  
  
  Then:
    
```
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/github
git clone git@github.com:dgkimpton/dgkimpton.git
cat ~/dgkimpton/bashrc-extension >> ~/.bashrc
echo '~/.ssh/github' >> ~/dgkimpton/ssh-key-list
source ~/.bashrc
git config --global user.name "Duncan Kimpton"
git config --global user.email dgkimpton@users.noreply.github.com
```
To add more ssh-keys be sure to add the keyfile path to the ssh-key-list on a new line
  
On WSL also setup as follows
  create `/etc/wsl.conf`
```
[interop]
appendWindowsPath = false
```
Then restart WSL2 with command wsl --shutdown in Windows.  
  
Installing + upgrading node+npm
```
  sudo apt update
  sudo apt install nodejs
  sudo apt install npm
  npm cache clean -f
  sudo npm install -g n
  sudo n latest
  sudo npm install -g npm@latest
```
</details>
