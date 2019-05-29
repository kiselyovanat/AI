global _start
extern __addbn
extern __subbn
extern __mulbn
extern __divbn
extern __divbn2
extern __modbn
section .text
_start:
  mov eax,45
  xor ebx,ebx
  int 0x80
  mov [_sizebim],eax
  mov [_addrbim],eax
  sub esp,1420
  push ebp
  mov ebp,esp
  call head
  mov eax,1
  mov ebx,0
  int 0x80
head:
  mov byte[ebp+121],1
  mov ebx,[_addrbim]
  mov [ebp+220],ebx
  mov [ebp+620],dword 1000000*4
  add [_addrbim],dword 1000000
  mov [ebp+1020],dword 0
  call _addmem
  mov byte[ebp+122],0
  mov ebx,[_addrbim]
  mov [ebp+224],ebx
  mov [ebp+624],dword 1000000*4
  add [_addrbim],dword 4000000
  mov [ebp+1024],dword 0
  call _addmem
  mov eax,0
  mov [ebp+72],eax
  mov eax,3
  mov [ebp+4],eax
  push dword [_addrbim]
  sub esp,1416
  mov edx,esp
  push ebp
  mov eax,[ebp+4]
  mov [edx+104],eax
  mov al,[ebp+121]
  mov [edx+121],al
  mov eax,[ebp+220]
  mov [edx+220],eax
  mov eax,[ebp+620]
  mov [edx+620],eax
  mov eax,[ebp+1020]
  mov [edx+1020],eax
  mov ebp,edx
  call n2s
  pop ebp
  mov edx,esp
  add esp,1416
  pop dword [_addrbim]
  mov eax,[edx+1020]
  mov [ebp+1020],eax
  mov eax,0xffffffff
  mov [ebp+36],eax
  mov eax,9
  mov [ebp+44],eax
  mov ebx,[ebp+44]
  and ebx,0x1f
  mov eax,[_I+ebx*4]
  mov [ebp+56],eax
  push dword [_addrbim]
  sub esp,1416
  mov edx,esp
  push ebp
  mov al,[ebp+121]
  mov [edx+121],al
  mov eax,[ebp+220]
  mov [edx+220],eax
  mov eax,[ebp+620]
  mov [edx+620],eax
  mov eax,[ebp+1020]
  mov [edx+1020],eax
  mov eax,[ebp+72]
  mov [edx+72],eax
  mov ebp,edx
  call fopen
  pop ebp
  mov edx,esp
  add esp,1416
  pop dword [_addrbim]
  mov eax,[edx+56]
  mov [ebp+16],eax
  mov eax,0
  mov [ebp+8],eax
  mov [ebp+1020],eax
  mov eax,1
  mov [ebp+48],eax
  mov ebx,[ebp+44]
  and ebx,0x1f
  mov eax,[_I+ebx*4]
  mov [ebp+52],eax
.P1:
  mov eax,[ebp+36]
  inc eax
  mov [ebp+36],eax
  mov eax,[ebp+36]
  mov edx,eax
  mov eax,[ebp+52]
  cmp edx,eax
  je .P2
  push dword [_addrbim]
  sub esp,1416
  mov edx,esp
  push ebp
  mov eax,[ebp+16]
  mov [edx+16],eax
  mov al,[ebp+121]
  mov [edx+121],al
  mov eax,[ebp+220]
  mov [edx+220],eax
  mov eax,[ebp+620]
  mov [edx+620],eax
  mov eax,[ebp+1020]
  mov [edx+1020],eax
  mov eax,[ebp+8]
  mov [edx+8],eax
  mov eax,[ebp+48]
  mov [edx+48],eax
  mov ebp,edx
  call getvector
  pop ebp
  mov edx,esp
  add esp,1416
  pop dword [_addrbim]
  mov eax,[edx+88]
  mov [ebp+88],eax
  mov eax,[ebp+88]
  mov ebx,[ebp+1024]
  shl ebx,2
  mov ecx,[ebp+1024]
  shl ecx,2
  cmp ecx,[ebp+624]
  jae _errend
  mov edi,ecx
  add edi,[ebp+224]
  mov esi,edi
  sub esi,4
  sub ecx,ebx
  std
  rep movsb
  add ebx,[ebp+224]
  mov [ebx],eax
  inc dword [ebp+1024]
  jmp .P1
.P2:
  push dword [_addrbim]
  sub esp,1416
  mov edx,esp
  push ebp
  mov eax,[ebp+16]
  mov [edx+56],eax
  mov ebp,edx
  call fclose
  pop ebp
  mov edx,esp
  add esp,1416
  pop dword [_addrbim]
  mov eax,13
  mov ebx,0
  int 0x80
  mov [ebp+80],eax
  xor eax,eax
  mov [ebp+72],eax
.P3:
  push dword [_addrbim]
  sub esp,1416
  mov edx,esp
  push ebp
  mov al,[ebp+122]
  mov [edx+122],al
  mov eax,[ebp+224]
  mov [edx+224],eax
  mov eax,[ebp+624]
  mov [edx+624],eax
  mov eax,[ebp+1024]
  mov [edx+1024],eax
  mov eax,[ebp+44]
  mov [edx+12],eax
  mov eax,[ebp+56]
  mov [edx+16],eax
  mov ebp,edx
  call setAIBig
  pop ebp
  mov edx,esp
  add esp,1416
  pop dword [_addrbim]
  mov eax,[edx+4]
  mov [ebp+76],eax
.P4:
  mov eax,13
  mov ebx,0
  int 0x80
  sub eax,[ebp+80]
  mov [ebp+80],eax
  ret
n2s:
  xor eax,eax
  mov [ebp+1020],eax
.P1:
  mov eax,[ebp+104]
  mov ebx,10
  xor edx,edx
  div ebx
  mov [ebp+108],eax
  mov eax,edx
  add eax,48
  mov ebx,[ebp+1020]
  mov ecx,[ebp+1020]
  cmp ecx,[ebp+620]
  jae _errend
  mov edi,ecx
  add edi,[ebp+220]
  mov esi,edi
  dec esi
  sub ecx,ebx
  std
  rep movsb
  add ebx,[ebp+220]
  mov [ebx],al
  inc dword [ebp+1020]
  mov eax,[ebp+104]
  mov ebx,10
  xor edx,edx
  div ebx
  mov [ebp+108],edx
  mov [ebp+104],eax
  and eax,eax
  jnz .P1
  mov eax,[ebp+1020]
  sub eax,1
  mov [ebp+8],eax
.P2:
  mov eax,[ebp+104]
  mov edx,eax
  mov eax,[ebp+8]
  cmp edx,eax
  jae .P3
  mov esi,[ebp+104]
  add esi,[ebp+220]
  mov edi,[ebp+8]
  add edi,[ebp+220]
  mov al,[esi]
  mov bl,[edi]
  mov [esi],bl
  mov [edi],al
  mov eax,[ebp+104]
  inc eax
  mov [ebp+104],eax
  mov eax,[ebp+8]
  dec eax
  mov [ebp+8],eax
  jmp .P2
.P3:
  ret
fopen:
  mov eax,0
  mov ebx,[ebp+1020]
  mov ecx,[ebp+1020]
  cmp ecx,[ebp+620]
  jae _errend
  mov edi,ecx
  add edi,[ebp+220]
  mov esi,edi
  dec esi
  sub ecx,ebx
  std
  rep movsb
  add ebx,[ebp+220]
  mov [ebx],al
  inc dword [ebp+1020]
  mov eax,5
  mov ebx,[ebp+220]
  mov ecx,[ebp+72]
  int 80h
  mov [ebp+56],eax
  ret
getvector:
  mov byte[ebp+122],1
  mov ebx,[_addrbim]
  mov [ebp+224],ebx
  mov [ebp+624],dword 10*4
  add [_addrbim],dword 12
  mov [ebp+1024],dword 0
  call _addmem
  add [ebp+1024],dword _LM1
  mov ebx,[ebp+624]
  cmp [ebp+1024],ebx
  ja _errend
  mov ecx,_LM1
  mov esi,_M1
  mov edi,[ebp+224]
  add edi,[ebp+1024]
  sub edi,_LM1
  cld
  rep movsb
  xor eax,eax
  mov [ebp+64],eax
.P1:
  push dword [_addrbim]
  sub esp,1416
  mov edx,esp
  push ebp
  mov eax,[ebp+16]
  mov [edx+56],eax
  mov al,[ebp+121]
  mov [edx+121],al
  mov eax,[ebp+220]
  mov [edx+220],eax
  mov eax,[ebp+620]
  mov [edx+620],eax
  mov eax,[ebp+1020]
  mov [edx+1020],eax
  mov eax,[ebp+8]
  mov [edx+8],eax
  mov eax,[ebp+48]
  mov [edx+48],eax
  mov ebp,edx
  call freadf
  pop ebp
  mov edx,esp
  add esp,1416
  pop dword [_addrbim]
  mov eax,[edx+44]
  mov [ebp+44],eax
  mov ebx,[ebp+64]
  add ebx,[ebp+220]
  mov ebx,[ebx]
  and ebx,0x000000ff
  mov eax,ebx
  mov edx,eax
  mov ebx,[ebp+224]
  add ebx,0
  mov ebx,[ebx]
  and ebx,0x000000ff
  mov eax,ebx
  cmp edx,eax
  je .P2
  mov eax,[ebp+8]
  inc eax
  mov [ebp+8],eax
  mov eax,[ebp+1020]
  inc eax
  mov [ebp+1020],eax
  mov [ebp+64],eax
  jmp .P1
.P2:
  push dword [_addrbim]
  sub esp,1416
  mov edx,esp
  push ebp
  mov al,[ebp+121]
  mov [edx+121],al
  mov eax,[ebp+220]
  mov [edx+220],eax
  mov eax,[ebp+620]
  mov [edx+620],eax
  mov eax,[ebp+1020]
  mov [edx+1020],eax
  mov ebp,edx
  call input2
  pop ebp
  mov edx,esp
  add esp,1416
  pop dword [_addrbim]
  mov eax,[edx+4]
  mov [ebp+88],eax
  ret
fclose:
  mov eax,6
  mov ebx,[ebp+56]
  int 80h
  ret
setAIBig:
  mov byte[ebp+121],1
  mov ebx,[_addrbim]
  mov [ebp+220],ebx
  mov [ebp+620],dword 100*4
  add [_addrbim],dword 100
  mov [ebp+1020],dword 0
  call _addmem
  mov byte[ebp+123],0
  mov ebx,[_addrbim]
  mov [ebp+228],ebx
  mov [ebp+628],dword 1000000*4
  add [_addrbim],dword 4000000
  mov [ebp+1028],dword 0
  call _addmem
  mov eax,[ebp+12]
  mov [ebp+44],eax
  mov eax,[ebp+16]
  mov [ebp+56],eax
  mov eax,[ebp+56]
  add eax,31
  shr eax,byte 5
  mov [ebp+20],eax
  xor eax,eax
  mov [ebp+1028],eax
.P3:
  push dword [_addrbim]
  sub esp,1416
  mov edx,esp
  push ebp
  mov al,[ebp+122]
  mov [edx+121],al
  mov eax,[ebp+224]
  mov [edx+220],eax
  mov eax,[ebp+624]
  mov [edx+620],eax
  mov eax,[ebp+1024]
  mov [edx+1020],eax
  mov eax,[ebp+44]
  mov [edx+44],eax
  mov eax,[ebp+20]
  mov [edx+20],eax
  mov al,[ebp+123]
  mov [edx+122],al
  mov eax,[ebp+228]
  mov [edx+224],eax
  mov eax,[ebp+628]
  mov [edx+624],eax
  mov eax,[ebp+1028]
  mov [edx+1024],eax
  mov ebp,edx
  call beginBig
  pop ebp
  mov edx,esp
  add esp,1416
  pop dword [_addrbim]
  mov eax,[edx+1024]
  mov [ebp+1028],eax
  mov eax,1
  mov [ebp+36],eax
.P4:
  mov eax,[ebp+1028]
  xor edx,edx
  mov ebx,[ebp+20]
  div ebx
  mov [ebp+108],edx
  mov [ebp+12],eax
  xor eax,eax
  mov [ebp+1020],eax
  push dword [_addrbim]
  sub esp,1416
  mov edx,esp
  push ebp
  mov eax,[ebp+12]
  mov [edx+104],eax
  mov al,[ebp+121]
  mov [edx+121],al
  mov eax,[ebp+220]
  mov [edx+220],eax
  mov eax,[ebp+620]
  mov [edx+620],eax
  mov eax,[ebp+1020]
  mov [edx+1020],eax
  mov ebp,edx
  call n2s
  pop ebp
  mov edx,esp
  add esp,1416
  pop dword [_addrbim]
  mov eax,[edx+1020]
  mov [ebp+1020],eax
  mov eax,[ebp+12]
  mov edx,eax
  mov eax,[ebp+56]
  cmp edx,eax
  ja .P8
  push dword [_addrbim]
  sub esp,1416
  mov edx,esp
  push ebp
  mov al,[ebp+123]
  mov [edx+122],al
  mov eax,[ebp+228]
  mov [edx+224],eax
  mov eax,[ebp+628]
  mov [edx+624],eax
  mov eax,[ebp+1028]
  mov [edx+1024],eax
  mov eax,[ebp+20]
  mov [edx+20],eax
  mov ebp,edx
  call rankBig
  pop ebp
  mov edx,esp
  add esp,1416
  pop dword [_addrbim]
  mov eax,[edx+72]
  mov [ebp+72],eax
.P5:
  mov eax,[ebp+72]
  mov edx,eax
  mov eax,[ebp+12]
  cmp edx,eax
  jb .P8
  mov eax,[ebp+36]
  mov edx,eax
  mov eax,[ebp+44]
  cmp edx,eax
  je .P7
  mov eax,[ebp+36]
  inc eax
  mov [ebp+36],eax
  mov ebx,[ebp+36]
  and ebx,0x1f
  mov eax,[_I+ebx*4]
  sub eax,1
  mov [ebp+84],eax
  mov eax,[ebp+44]
  sub eax,[ebp+36]
  mov [ebp+68],eax
  mov eax,[ebp+84]
  mov cl,[ebp+68]
  shl eax,cl
  mov [ebp+76],eax
.P6:
  push dword [_addrbim]
  sub esp,1416
  mov edx,esp
  push ebp
  mov eax,[ebp+76]
  mov [edx+76],eax
  mov eax,[ebp+20]
  mov [edx+20],eax
  mov al,[ebp+123]
  mov [edx+122],al
  mov eax,[ebp+228]
  mov [edx+224],eax
  mov eax,[ebp+628]
  mov [edx+624],eax
  mov eax,[ebp+1028]
  mov [edx+1024],eax
  mov al,[ebp+123]
  mov [edx+122],al
  mov eax,[ebp+228]
  mov [edx+224],eax
  mov eax,[ebp+628]
  mov [edx+624],eax
  mov eax,[ebp+1028]
  mov [edx+1024],eax
  mov ebp,edx
  call monomBig
  pop ebp
  mov edx,esp
  add esp,1416
  pop dword [_addrbim]
  mov eax,[edx+1024]
  mov [ebp+1028],eax
  mov eax,[ebp+76]
  mov edx,eax
  mov eax,[ebp+84]
  cmp edx,eax
  je .P4
  push dword [_addrbim]
  sub esp,1416
  mov edx,esp
  push ebp
  mov eax,[ebp+76]
  mov [edx+76],eax
  mov ebp,edx
  call sochz
  pop ebp
  mov edx,esp
  add esp,1416
  pop dword [_addrbim]
  mov eax,[edx+76]
  mov [ebp+76],eax
  jmp .P6
.P7:
  mov eax,0xffffffff
  mov [ebp+36],eax
  mov [ebp+4],eax
  mov eax,4
  mov ebx,1
  mov ecx,_M2
  mov edx,_LM2
  int 0x80
  jmp .P9
.P8:
  mov eax,[ebp+36]
  mov [ebp+4],eax
.P9:
  ret
freadf:
  mov eax,3
  mov ebx,[ebp+56]
  mov ecx,[ebp+220]
  add ecx,[ebp+8]
  mov edx,[ebp+48]
  int 80h
  mov [ebp+44],eax
  ret
input2:
  xor eax,eax
  mov [ebp+4],eax
  mov eax,0xffffffff
  mov [ebp+36],eax
.P1:
  mov eax,[ebp+36]
  inc eax
  mov [ebp+36],eax
  xor eax,[ebp+1020]
  and eax,eax
  jz .P3
  mov ebx,[ebp+36]
  add ebx,[ebp+220]
  mov ebx,[ebx]
  and ebx,0x000000ff
  mov eax,ebx
  xor eax,48
  and eax,eax
  jz .P1
  mov ebx,[ebp+36]
  and ebx,0x1f
  mov eax,[_I+ebx*4]
  or eax,[ebp+4]
  mov [ebp+4],eax
  jmp .P1
.P3:
  ret
beginBig:
.P1:
  mov eax,0xffffffff
  mov [ebp+36],eax
.P2:
  push dword [_addrbim]
  sub esp,1416
  mov edx,esp
  push ebp
  mov al,[ebp+121]
  mov [edx+121],al
  mov eax,[ebp+220]
  mov [edx+220],eax
  mov eax,[ebp+620]
  mov [edx+620],eax
  mov eax,[ebp+1020]
  mov [edx+1020],eax
  mov eax,[ebp+44]
  mov [edx+44],eax
  mov eax,[ebp+20]
  mov [edx+20],eax
  mov al,[ebp+122]
  mov [edx+122],al
  mov eax,[ebp+224]
  mov [edx+224],eax
  mov eax,[ebp+624]
  mov [edx+624],eax
  mov eax,[ebp+1024]
  mov [edx+1024],eax
  mov ebp,edx
  call transpositionBig
  pop ebp
  mov edx,esp
  add esp,1416
  pop dword [_addrbim]
  mov eax,[edx+1024]
  mov [ebp+1024],eax
  mov eax,0xffffffff
  mov [ebp+40],eax
.P3:
  mov eax,[ebp+36]
  inc eax
  mov [ebp+36],eax
  mov eax,[ebp+36]
  mov edx,eax
  mov eax,[ebp+20]
  cmp edx,eax
  je .P4
  mov eax,[ebp+40]
  mov ebx,[ebp+1024]
  shl ebx,2
  mov ecx,[ebp+1024]
  shl ecx,2
  cmp ecx,[ebp+624]
  jae _errend
  mov edi,ecx
  add edi,[ebp+224]
  mov esi,edi
  sub esi,4
  sub ecx,ebx
  std
  rep movsb
  add ebx,[ebp+224]
  mov [ebx],eax
  inc dword [ebp+1024]
  jmp .P3
.P4:
.P5:
  ret
rankBig:
  mov byte[ebp+121],1
  mov ebx,[_addrbim]
  mov [ebp+220],ebx
  mov [ebp+620],dword 100*4
  add [_addrbim],dword 100
  mov [ebp+1020],dword 0
  call _addmem
  xor eax,eax
  mov [ebp+44],eax
  mov byte[ebp+123],0
  mov ebx,[_addrbim]
  mov [ebp+228],ebx
  mov [ebp+628],dword 1000000*4
  add [_addrbim],dword 4000000
  mov [ebp+1028],dword 0
  call _addmem
  mov ecx, [ebp+1028]
  mov edi, [ebp+228]
  xor eax, eax
  cld
  rep stosd
  mov ecx,[ebp+1024]
  mov [ebp+112],ecx
  mov edi, ebp
  mov esi,[ebp+224]
.M1:
  mov eax,[esi]
  mov [edi - 64],eax
  times 4 inc esi
  times 4 dec edi
  loop .M1
  mov ecx,[ebp+112]
  mov [ebp+1020+2*4],ecx
  shl ecx, 2
  cmp [ebp+620+2*4],ecx
  jb _errend
  shr ecx, 2
  mov esi,ebp
  sub esi, 64
  mov edi,[ebp+220+2*4]
.M2:
  cmp ecx, 0
  jz .M3
  dec ecx
  mov edx, [esi]
  mov [edi], edx
  times 4 dec esi
  times 4 inc edi
  jmp .M2
.M3:
  mov eax,[ebp+1024]
  mov [ebp+1028],eax
  xor edx,edx
  mov ebx,[ebp+20]
  div ebx
  mov [ebp+108],edx
  mov [ebp+56],eax
  mov eax,0xffffffff
  mov [ebp+4],eax
.P1:
  push dword [_addrbim]
  sub esp,1416
  mov edx,esp
  push ebp
  mov al,[ebp+123]
  mov [edx+122],al
  mov eax,[ebp+228]
  mov [edx+224],eax
  mov eax,[ebp+628]
  mov [edx+624],eax
  mov eax,[ebp+1028]
  mov [edx+1024],eax
  mov eax,[ebp+44]
  mov [edx+44],eax
  mov eax,[ebp+20]
  mov [edx+20],eax
  mov ebp,edx
  call notnullcolBig
  pop ebp
  mov edx,esp
  add esp,1416
  pop dword [_addrbim]
  mov eax,[edx+32]
  mov [ebp+36],eax
  mov eax,[ebp+36]
  mov edx,eax
  mov eax,[ebp+4]
  cmp edx,eax
  je .P4
  push dword [_addrbim]
  sub esp,1416
  mov edx,esp
  push ebp
  mov al,[ebp+123]
  mov [edx+122],al
  mov eax,[ebp+228]
  mov [edx+224],eax
  mov eax,[ebp+628]
  mov [edx+624],eax
  mov eax,[ebp+1028]
  mov [edx+1024],eax
  mov eax,[ebp+44]
  mov [edx+44],eax
  mov eax,[ebp+36]
  mov [edx+36],eax
  mov eax,[ebp+20]
  mov [edx+20],eax
  mov ebp,edx
  call upperoneBig
  pop ebp
  mov edx,esp
  add esp,1416
  pop dword [_addrbim]
  mov eax,[edx+100]
  mov [ebp+40],eax
  mov eax,[ebp+44]
  mov edx,eax
  mov eax,[ebp+40]
  cmp edx,eax
  je .P2
  push dword [_addrbim]
  sub esp,1416
  mov edx,esp
  push ebp
  mov al,[ebp+123]
  mov [edx+122],al
  mov eax,[ebp+228]
  mov [edx+224],eax
  mov eax,[ebp+628]
  mov [edx+624],eax
  mov eax,[ebp+1028]
  mov [edx+1024],eax
  mov eax,[ebp+44]
  mov [edx+44],eax
  mov eax,[ebp+40]
  mov [edx+40],eax
  mov eax,[ebp+20]
  mov [edx+20],eax
  mov al,[ebp+123]
  mov [edx+122],al
  mov eax,[ebp+228]
  mov [edx+224],eax
  mov eax,[ebp+628]
  mov [edx+624],eax
  mov eax,[ebp+1028]
  mov [edx+1024],eax
  mov ebp,edx
  call swap
  pop ebp
  mov edx,esp
  add esp,1416
  pop dword [_addrbim]
  mov eax,[edx+1024]
  mov [ebp+1028],eax
.P2:
  push dword [_addrbim]
  sub esp,1416
  mov edx,esp
  push ebp
  mov al,[ebp+123]
  mov [edx+122],al
  mov eax,[ebp+228]
  mov [edx+224],eax
  mov eax,[ebp+628]
  mov [edx+624],eax
  mov eax,[ebp+1028]
  mov [edx+1024],eax
  mov eax,[ebp+36]
  mov [edx+36],eax
  mov eax,[ebp+44]
  mov [edx+40],eax
  mov eax,[ebp+20]
  mov [edx+52],eax
  mov al,[ebp+123]
  mov [edx+122],al
  mov eax,[ebp+228]
  mov [edx+224],eax
  mov eax,[ebp+628]
  mov [edx+624],eax
  mov eax,[ebp+1028]
  mov [edx+1024],eax
  mov ebp,edx
  call downxorbig
  pop ebp
  mov edx,esp
  add esp,1416
  pop dword [_addrbim]
  mov eax,[edx+1024]
  mov [ebp+1028],eax
.P3:
  mov eax,[ebp+44]
  inc eax
  mov [ebp+44],eax
  mov eax,[ebp+44]
  mov edx,eax
  mov eax,[ebp+56]
  cmp edx,eax
  je .P4
  jmp .P1
.P4:
  mov eax,[ebp+44]
  mov [ebp+72],eax
  ret
monomBig:
  mov eax,[ebp+76]
  mov [ebp+44],eax
  mov byte[ebp+123],0
  mov ebx,[_addrbim]
  mov [ebp+228],ebx
  mov eax,[ebp+20]
  mov [ebp+628],eax
  shl eax,2
  mov [ebp+628],eax
  add [_addrbim],eax
  mov [ebp+1028],dword 0
  call _addmem
  mov eax,[ebp+20]
  mov [ebp+1028],eax
  xor eax,eax
  mov [ebp+36],eax
  xor eax,eax
  mov [ebp+68],eax
.P1:
  mov eax,[ebp+36]
  mov edx,eax
  mov eax,[ebp+1028]
  cmp edx,eax
  je .P2
  mov eax,0xffffffff
  mov ebx,[ebp+36]
  shl ebx,byte 2
  add ebx,[ebp+228]
  mov [ebx],eax
  mov eax,[ebp+36]
  inc eax
  mov [ebp+36],eax
  jmp .P1
.P2:
  mov eax,[ebp+44]
  and eax,eax
  jz .P4
  mov edx,eax
  dec edx
  mov esi,eax
  and esi,edx
  mov [ebp+44],esi
  xor eax,edx
  xor ecx,ecx
  mov ebx,_vesa
  xlat
  add cl,al
  shr eax,8
  xlat
  add cl,al
  shr eax,8
  xlat
  add cl,al
  shr eax,8
  xlat
  add cl,al
  mov eax,ecx
  dec ecx
  mov [ebp+40],ecx
  mov eax,[ebp+40]
  mov ebx,[ebp+20]
  mul ebx
  mov [ebp+108],edx
  mov [ebp+40],eax
  xor eax,eax
  mov [ebp+48],eax
.P3:
  mov eax,[ebp+48]
  mov edx,eax
  mov eax,[ebp+20]
  cmp edx,eax
  je .P2
  mov eax,[ebp+40]
  add eax,[ebp+48]
  mov [ebp+64],eax
  mov ebx,[ebp+64]
  shl ebx,byte 2
  add ebx,[ebp+224]
  mov eax,[ebx]
  mov ebx,[ebp+48]
  shl ebx,byte 2
  add ebx,[ebp+228]
  and eax,[ebx]
  mov ebx,[ebp+48]
  shl ebx,byte 2
  add ebx,[ebp+228]
  mov [ebx],eax
  mov eax,[ebp+48]
  inc eax
  mov [ebp+48],eax
  jmp .P3
.P4:
  mov eax,[ebp+68]
  mov edx,eax
  mov eax,[ebp+1028]
  cmp edx,eax
  je .P5
  mov ebx,[ebp+68]
  shl ebx,byte 2
  add ebx,[ebp+228]
  mov eax,[ebx]
  mov ebx,[ebp+1024]
  shl ebx,2
  mov ecx,[ebp+1024]
  shl ecx,2
  cmp ecx,[ebp+624]
  jae _errend
  mov edi,ecx
  add edi,[ebp+224]
  mov esi,edi
  sub esi,4
  sub ecx,ebx
  std
  rep movsb
  add ebx,[ebp+224]
  mov [ebx],eax
  inc dword [ebp+1024]
  mov eax,[ebp+68]
  inc eax
  mov [ebp+68],eax
  jmp .P4
.P5:
  ret
sochz:
.P1:
  mov eax,[ebp+76]
  add eax,1
  and eax,[ebp+76]
  mov [ebp+8],eax
  sub eax,1
  xor eax,[ebp+76]
  xor ecx,ecx
  mov ebx,_vesa
  xlat
  add cl,al
  shr eax,8
  xlat
  add cl,al
  shr eax,8
  xlat
  add cl,al
  shr eax,8
  xlat
  add cl,al
  mov eax,ecx
  sub eax,2
  mov [ebp+12],eax
  mov eax,[ebp+76]
  add eax,1
  xor eax,[ebp+76]
  shl eax,byte 1
  add eax,1
  mov cl,[ebp+12]
  shl eax,cl
  xor eax,[ebp+8]
  mov [ebp+76],eax
.P2:
  ret
transpositionBig:
  mov eax,[ebp+44]
  mov ebx,[ebp+20]
  mul ebx
  mov [ebp+108],edx
  mov [ebp+1024],eax
  mov ecx, [ebp+1024]
  mov edi, [ebp+224]
  xor eax, eax
  cld
  rep stosd
  mov eax,0xffffffff
  mov [ebp+36],eax
.P1:
  mov eax,[ebp+36]
  inc eax
  mov [ebp+36],eax
  mov eax,[ebp+36]
  mov edx,eax
  mov eax,[ebp+1020]
  cmp edx,eax
  je .P3
  mov ebx,[ebp+36]
  shl ebx,byte 2
  add ebx,[ebp+220]
  mov eax,[ebx]
  mov [ebp+52],eax
.P2:
  mov eax,[ebp+52]
  and eax,eax
  jz .P1
  mov edx,eax
  dec edx
  mov esi,eax
  and esi,edx
  mov [ebp+52],esi
  xor eax,edx
  xor ecx,ecx
  mov ebx,_vesa
  xlat
  add cl,al
  shr eax,8
  xlat
  add cl,al
  shr eax,8
  xlat
  add cl,al
  shr eax,8
  xlat
  add cl,al
  mov eax,ecx
  dec ecx
  mov [ebp+40],ecx
  mov eax,[ebp+40]
  mov ebx,[ebp+20]
  mul ebx
  mov [ebp+108],edx
  mov [ebp+40],eax
  mov eax,[ebp+36]
  mov ebx,32
  mov edx,[ebp+108]
  div ebx
  mov [ebp+108],edx
  add eax,[ebp+40]
  mov [ebp+40],eax
  mov eax,[ebp+108]
  mov [ebp+68],eax
  mov ebx,[ebp+40]
  shl ebx,byte 2
  add ebx,[ebp+224]
  mov eax,[ebx]
  mov ebx,[ebp+68]
  and ebx,0x1f
  or eax,[_I+ebx*4]
  mov ebx,[ebp+40]
  shl ebx,byte 2
  add ebx,[ebp+224]
  mov [ebx],eax
  jmp .P2
.P3:
  ret
notnullcolBig:
  mov byte[ebp+121],1
  mov ebx,[_addrbim]
  mov [ebp+220],ebx
  mov [ebp+620],dword 100*4
  add [_addrbim],dword 100
  mov [ebp+1020],dword 0
  call _addmem
  mov eax,0xffffffff
  mov [ebp+32],eax
  xor eax,eax
  mov [ebp+48],eax
  xor eax,eax
  mov [ebp+36],eax
.P1:
  mov eax,[ebp+48]
  mov edx,eax
  mov eax,[ebp+20]
  cmp edx,eax
  je .P6
  xor eax,eax
  mov [ebp+96],eax
  mov eax,[ebp+44]
  mov ebx,[ebp+20]
  mul ebx
  mov [ebp+108],edx
  mov [ebp+40],eax
.P2:
  mov eax,[ebp+40]
  mov edx,eax
  mov eax,[ebp+1024]
  cmp edx,eax
  jae .P4
  mov eax,[ebp+40]
  add eax,[ebp+48]
  mov [ebp+72],eax
  mov ebx,[ebp+72]
  shl ebx,byte 2
  add ebx,[ebp+224]
  mov eax,[ebx]
  or eax,[ebp+96]
  mov [ebp+96],eax
.P3:
  mov eax,[ebp+40]
  add eax,[ebp+20]
  mov [ebp+40],eax
  jmp .P2
.P4:
  mov eax,[ebp+96]
  and eax,eax
  jz .P5
  mov eax,[ebp+96]
  mov ebx,eax
  dec eax
  xor eax,ebx
  xor ecx,ecx
  mov ebx,_vesa
  xlat
  add cl,al
  shr eax,8
  xlat
  add cl,al
  shr eax,8
  xlat
  add cl,al
  shr eax,8
  xlat
  add cl,al
  dec cl
  mov eax,ecx
  mov [ebp+32],eax
  mov eax,32
  mov ebx,[ebp+48]
  mul ebx
  mov [ebp+108],edx
  mov [ebp+76],eax
  add eax,[ebp+32]
  mov [ebp+32],eax
  jmp .P6
.P5:
  mov eax,[ebp+48]
  inc eax
  mov [ebp+48],eax
  jmp .P1
.P6:
  ret
upperoneBig:
  mov byte[ebp+121],1
  mov ebx,[_addrbim]
  mov [ebp+220],ebx
  mov [ebp+620],dword 1000*4
  add [_addrbim],dword 1000
  mov [ebp+1020],dword 0
  call _addmem
  mov eax,[ebp+44]
  mov ebx,[ebp+20]
  mul ebx
  mov [ebp+108],edx
  mov [ebp+40],eax
  mov eax,[ebp+36]
  shr eax,byte 5
  mov [ebp+52],eax
  mov eax,[ebp+36]
  and eax,31
  mov [ebp+8],eax
.P2:
  mov ebx,[ebp+8]
  and ebx,0x1f
  mov eax,[_I+ebx*4]
  mov [ebp+96],eax
.P3:
  mov eax,[ebp+40]
  mov edx,eax
  mov eax,[ebp+1024]
  cmp edx,eax
  jae .P6
.P4:
  mov eax,[ebp+40]
  add eax,[ebp+52]
  mov [ebp+72],eax
  mov ebx,[ebp+72]
  shl ebx,byte 2
  add ebx,[ebp+224]
  mov eax,[ebx]
  and eax,[ebp+96]
  and eax,eax
  jz .P5
  mov eax,[ebp+72]
  xor edx,edx
  mov ebx,[ebp+20]
  div ebx
  mov [ebp+108],edx
  mov [ebp+100],eax
  jmp .P6
.P5:
  mov eax,[ebp+40]
  add eax,[ebp+20]
  mov [ebp+40],eax
  jmp .P3
.P6:
  ret
swap:
  mov eax,[ebp+44]
  mov ebx,[ebp+20]
  mul ebx
  mov [ebp+108],edx
  mov [ebp+36],eax
  add eax,[ebp+20]
  mov [ebp+48],eax
  mov eax,[ebp+40]
  mov ebx,[ebp+20]
  mul ebx
  mov [ebp+108],edx
  mov [ebp+76],eax
.P1:
  mov eax,[ebp+36]
  mov edx,eax
  mov eax,[ebp+48]
  cmp edx,eax
  je .P2
  mov ebx, [ebp+36]
  shl ebx, 2
  mov edx, [ebp+76]
  shl edx, 2
  mov esi, [ebp+224]
  mov edi, esi
  add esi, ebx
  add edi, edx
  push dword [esi]
  push dword [edi]
  pop dword [esi]
  pop dword [edi]
  mov eax,[ebp+76]
  inc eax
  mov [ebp+76],eax
  mov eax,[ebp+36]
  inc eax
  mov [ebp+36],eax
  jmp .P1
.P2:
  ret
downxorbig:
  mov eax,[ebp+36]
  shr eax,byte 5
  mov [ebp+68],eax
  mov eax,[ebp+36]
  and eax,31
  mov [ebp+72],eax
  mov ebx,[ebp+72]
  and ebx,0x1f
  mov eax,[_I+ebx*4]
  mov [ebp+96],eax
  mov eax,[ebp+40]
  mov [ebp+44],eax
  mov ebx,[ebp+52]
  mul ebx
  mov [ebp+108],edx
  add eax,[ebp+68]
  mov [ebp+80],eax
.P1:
  mov eax,[ebp+44]
  inc eax
  mov [ebp+44],eax
  mov eax,[ebp+80]
  add eax,[ebp+52]
  mov [ebp+80],eax
  mov eax,[ebp+80]
  mov edx,eax
  mov eax,[ebp+1024]
  cmp edx,eax
  jae .P2
  mov ebx,[ebp+80]
  shl ebx,byte 2
  add ebx,[ebp+224]
  mov eax,[ebx]
  and eax,[ebp+96]
  and eax,eax
  jz .P1
  push dword [_addrbim]
  sub esp,1416
  mov edx,esp
  push ebp
  mov al,[ebp+122]
  mov [edx+121],al
  mov eax,[ebp+224]
  mov [edx+220],eax
  mov eax,[ebp+624]
  mov [edx+620],eax
  mov eax,[ebp+1024]
  mov [edx+1020],eax
  mov eax,[ebp+40]
  mov [edx+40],eax
  mov eax,[ebp+44]
  mov [edx+44],eax
  mov eax,[ebp+52]
  mov [edx+52],eax
  mov al,[ebp+122]
  mov [edx+121],al
  mov eax,[ebp+224]
  mov [edx+220],eax
  mov eax,[ebp+624]
  mov [edx+620],eax
  mov eax,[ebp+1024]
  mov [edx+1020],eax
  mov ebp,edx
  call big_xor
  pop ebp
  mov edx,esp
  add esp,1416
  pop dword [_addrbim]
  mov eax,[edx+1020]
  mov [ebp+1024],eax
  jmp .P1
.P2:
  ret
big_xor:
  mov eax,[ebp+40]
  mov ebx,[ebp+52]
  mul ebx
  mov [ebp+108],edx
  mov [ebp+40],eax
  add eax,[ebp+52]
  mov [ebp+20],eax
  mov eax,[ebp+44]
  mov ebx,[ebp+52]
  mul ebx
  mov [ebp+108],edx
  mov [ebp+44],eax
.P1:
  mov ebx,[ebp+40]
  shl ebx,byte 2
  add ebx,[ebp+220]
  mov eax,[ebx]
  mov ebx,[ebp+44]
  shl ebx,byte 2
  add ebx,[ebp+220]
  xor eax,[ebx]
  mov ebx,[ebp+44]
  shl ebx,byte 2
  add ebx,[ebp+220]
  mov [ebx],eax
  mov eax,[ebp+44]
  inc eax
  mov [ebp+44],eax
  mov eax,[ebp+40]
  inc eax
  mov [ebp+40],eax
  xor eax,[ebp+20]
  and eax,eax
  jnz .P1
  ret
_addmem:
  push eax
  push ebx
  mov ebx,[_addrbim]
  cmp ebx,[_sizebim]
  jbe .end
  sub ebx,[_sizebim]
  add ebx,1000h
  add ebx,[_sizebim]
  mov eax,45
  int 0x80
  and eax,eax
  jnz ._errend
  mov eax,1
  mov ebx,1
  int 0x80
._errend:
  mov [_sizebim],ebx
.end:
  pop ebx
  pop eax
  ret
_errend:
  mov eax, 4
  mov ebx, 1
  mov ecx, ErrMsg
  mov edx, LenErrMsg
  int 0x80
  mov eax,1
  mov ebx,1
  int 0x80
section .data
_sizebim dd 0
_addrbim dd 0
_rand dd 0xa1248aa9
_vesa:
  db 0,1,1,2,1,2,2,3,1,2,2,3,2,3,3,4
  db 1,2,2,3,2,3,3,4,2,3,3,4,3,4,4,5
  db 1,2,2,3,2,3,3,4,2,3,3,4,3,4,4,5
  db 2,3,3,4,3,4,4,5,3,4,4,5,4,5,5,6
  db 1,2,2,3,2,3,3,4,2,3,3,4,3,4,4,5
  db 2,3,3,4,3,4,4,5,3,4,4,5,4,5,5,6
  db 2,3,3,4,3,4,4,5,3,4,4,5,4,5,5,6
  db 3,4,4,5,4,5,5,6,4,5,5,6,5,6,6,7
  db 1,2,2,3,2,3,3,4,2,3,3,4,3,4,4,5
  db 2,3,3,4,3,4,4,5,3,4,4,5,4,5,5,6
  db 2,3,3,4,3,4,4,5,3,4,4,5,4,5,5,6
  db 3,4,4,5,4,5,5,6,4,5,5,6,5,6,6,7
  db 2,3,3,4,3,4,4,5,3,4,4,5,4,5,5,6
  db 3,4,4,5,4,5,5,6,4,5,5,6,5,6,6,7
  db 3,4,4,5,4,5,5,6,4,5,5,6,5,6,6,7
  db 4,5,5,6,5,6,6,7,5,6,6,7,6,7,7,8

_I:
  dd 0x1,0x2,0x4,0x8,0x10,0x20,0x40,0x80,0x100,0x200,0x400,0x800,0x1000,0x2000,0x4000,0x8000
  dd 0x10000,0x20000,0x40000,0x80000,0x100000,0x200000,0x400000,0x800000
  dd 0x1000000,0x2000000,0x4000000,0x8000000,0x10000000,0x20000000,0x40000000,0x80000000
ErrMsg: db '[INTERNAL_ERROR]',10,''
LenErrMsg equ $-ErrMsg
_M1: db '',10,''
_LM1 equ $-_M1
_M2: db  'error! annihilator does not exist',10,''
_LM2 equ $-_M2
