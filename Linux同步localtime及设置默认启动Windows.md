```python
"""
Linux同步localtime
sudo apt-get install
sudo apt-get update
sudo apt install ntpdate
sudo ntpdate time.windows.com
sudo apt install util-linux-extra
sudo hwclock --localtime --systohc
"""
"""
修改开机默认启动光标选择windows
sudo nano /etc/default/grup
按照开机Windows的顺序修改GRUB_DEFAULT=4(开机时Windows排在第五个，从0开始数为4)
sudo update-grub
"""
```

