# Assembly Language on Visual Studio Code
## Ubuntu

Reference: https://medium.com/@muhammadmeeran2003/how-to-set-up-assembly-language-on-visual-studio-code-2021-587a7b01c9a1

1. sudo apt install gcc gdb nasm
2. on Visual Studio Code: CTRL + Shift + B to create .vscode and tasks.json
3. create launch.json
4. copy launch.json and tasks.json content
5. Instal GDB Debug vsc extension, CTRL + P -> ext install DamianKoper.gdb-debug -> Enter
6. Open the file You want to assemble in Vscode and press CTRL + Shift + B. This will create a file ending in extension “.o” and a simple file with no extension
7. Open the vscode terminal and execute this simple binary file