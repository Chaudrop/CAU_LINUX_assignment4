cmd_arch/x86/entry/vdso/vdso64.so.dbg := ld -nostdlib -o arch/x86/entry/vdso/vdso64.so.dbg -shared --hash-style=both --build-id  --eh-frame-hdr -Bsymbolic -m elf_x86_64 -soname linux-vdso.so.1 --no-undefined -z max-page-size=4096 -T arch/x86/entry/vdso/vdso.lds arch/x86/entry/vdso/vdso-note.o arch/x86/entry/vdso/vclock_gettime.o arch/x86/entry/vdso/vgetcpu.o && sh ./arch/x86/entry/vdso/checkundef.sh 'nm' 'arch/x86/entry/vdso/vdso64.so.dbg'; if objdump -R arch/x86/entry/vdso/vdso64.so.dbg | egrep -h "R_X86_64_JUMP_SLOT|R_X86_64_GLOB_DAT|R_X86_64_RELATIVE| R_386_GLOB_DAT|R_386_JMP_SLOT|R_386_RELATIVE"; then (echo >&2 "arch/x86/entry/vdso/vdso64.so.dbg: dynamic relocations are not supported"; rm -f arch/x86/entry/vdso/vdso64.so.dbg; /bin/false); fi
