本目录是大赛提供的性能测试程序的目录，包括编译所需的源代码和目标文件。


1. 目录的结构如下：

    +--./                    : 性能测试目录
    |        
    |--bench/                : 测试程序的源代码目录
    |
    |--include/              : 编译所需的头文件目录
    |               
    |--lib/                  : 编译所需的库文件目录
    |               
    |--obj/                  : 编译生成的目标文件目录
    |               
    |--bin.lds.S             : 链接脚本生成文件
    |               
    |--convert.c             : RAM初始化文件的转换代码
    |               
    |--start.S               : 测试程序的启动代码
    |               
    |--Makefile              : 编译脚本


2. 编译方法

(1) 编译前，请保证已经配置好交叉编译环境。

(2) 在当前目录下执行make，即可在obj目录下生成测试所需的所有文件。如果只想编译某一个测试程序，请执行make [程序名]，例如：make bitcount。想清除所有编译文件请执行make clean。

(3) 关于obj目录。
    
    a. obj下的子目录以测试程序的名字命名
   
    b. 子目录下，main.elf, main.bin和main.data是中间文件，test.s是程序的反汇编文件。data_ram.coe，data_ram.mif，inst_ram.coe和inst_ram.mif是RAM的初始化配置文件。
