# [https://seisman.github.io/how-to-write-makefile/overview.html](https://seisman.github.io/how-to-write-makefile/overview.html)

# 源文件Compile&&Link

源码经过compile   -->*.obj(windows)/.o(UNIX)*经过link   -->可执行文件

目标文件数量过多导致link操作繁琐，因此将目标文件打包为*.lib*(Library File)文件(UNIX为.a(Archive File))

# makefile

## make规则

1. 如果这个工程没有编译过，那么我们的所有c文件都要编译并被链接。
2. 如果这个工程的某几个c文件被修改，那么我们只编译被修改的c文件，并链接目标程序。
3. 如果这个工程的头文件被改变了，那么我们需要编译引用了这几个头文件的c文件，并链接目标程序。

## file格式

```makefile
target ... : prerequisites ...
    recipe
    ...
    ...
    
///////////// 
target(目标)
可以是一个object file（目标文件），也可以是一个可执行文件，还可以是一个标签（label）。对于标签这种特性，在后续的“伪目标”章节中会有叙述。

prerequisites(前提，依赖)
生成该target所依赖的文件和/或target。

recipe(方法)
该target要执行的命令（任意的shell命令）

这是一个文件的依赖关系，也就是说，target这一个或多个的目标文件依赖于prerequisites中的文件，其生成规则定义在command中。说白一点就是说:
prerequisites中如果有一个以上的文件比target文件要新的话，recipe所定义的命令就会被执行。
```



# GNUmake工作步骤

1. 读入所有的Makefile。
2. 读入被include的其它Makefile。
3. 初始化文件中的变量。
4. 推导隐式规则，并分析所有规则。
5. 为所有的目标文件创建依赖关系链。
6. 根据依赖关系，决定哪些目标要重新生成。
7. 执行生成命令。