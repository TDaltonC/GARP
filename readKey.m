% Usage: [key, timeSecs] = readKey [(keys)];
% Return pressed key, or empty if no key pressed. 
% timeSecs is the time returned by KbCheck.
% ESC will abort execution.
% If optional input keys, {'left' 'right'} for example, 
% is provided, only provided keys will be detected.
% This takes less than 0.5 ms, so it is safe to call within each video frame.
% XRL, 2005-09-23
% 
% See also WaitTill, KbCheck

function [key, timeSecs] = readKey (keys)
[keyIsDown, timeSecs, keyCode] = KbCheck(-1);
if ~keyIsDown; key=[]; return; end
keyCode=find(keyCode);
key=KeyName(keyCode);
if any(strcmp(key,'esc')) & isempty(strmatch('esc',keys,'exact'))
    Priority(0); fclose('all'); Screen('CloseAll'); ShowCursor;
    error('User pressed ESC. EXITING.'); 
end
if nargin<1 | isempty(keys); return; end
if ~iscellstr(key); key=[]; return; end
for i=1:length(key)
    if any(strmatch(key{i}, keys,'exact'))
        key=key{i}; return; 
    end
end
key=[];
return

% this is simplified from KbName. Now it takes very short time to run
function key = KeyName(keyCode)
switch computer
case 'PCWIN' 
    kk = cell(1,222);
    kk([1 2 4]) = {'left_mouse'; 'right_mouse'; 'middle_mouse'};
    kk([8 9 12 13 27 45 46]) = {'backspace'; 'tab'; 'clear';'return';'esc';'insert';'delete';};
    kk([16:18 91 92]) = {'shift'; 'control';'alt';'left_menu';'right_menu'};
    kk(32:40) = {'space';'pageup';'pagedown';'end'; 'home'; 'left';'up';'right';'down'};
    kk([48:57 96:105]) = {'0';'1';'2';'3';'4';'5';'6';'7';'8';'9';'0';'1';'2';'3';'4';'5';'6';'7';'8';'9'};
    kk(65:90) = {'a';'b';'c';'d';'e';'f';'g';'h';'i';'j';'k';'l';'m';'n';'o';'p';'q';'r';'s';'t';'u';'v';'w';'x';'y';'z'};
    kk(106:111) = {'*'; '+'; 'seperator'; '-'; '.'; '/'};
    kk(112:135)  = {'f1';'f2';'f3';'f4';'f5';'f6';'f7';'f8';'f9';'f10';'f11';'f12';'f13';'f14';'f15';'f16';'f17';'f18';'f19';'f20';'f21';'f22';'f23';'f24'};
    kk([20 144 145]) = {'capslock';'numlock'; 'scrolllock'};
    kk([186:192 219:222]) = {';'; '='; ','; '-';'.'; '/'; '`'; '['; '\'; ']'; char(39)};
case {'MAC' 'MACI' 'MACI64'}  % OS X
    kk = cell(1,231);
    kk(4:29)={'a';'b';'c';'d';'e';'f';'g';'h';'i';'j';'k';'l';'m';'n';'o';'p';'q';'r';'s';'t';'u';'v';'w';'x';'y';'z'};
    kk([30:39 89:99]) = {'1';'2';'3';'4';'5';'6';'7';'8';'9';'0';'1';'2';'3';'4';'5';'6';'7';'8';'9';'0';'.'}; 
    kk(40:44)={'return'; 'esc'; 'delete';'tab';'space'};
    kk(45:57)={'-'; '='; '[';']';'\';'#';';';char(39);'`';',';'.';'/';'capslock'};
    kk([58:69 104:115])={'f1';'f2';'f3';'f4';'f5';'f6';'f7';'f8';'f9';'f10';'f11';'f12';'f13';'f14';'f15';'f16';'f17';'f18';'f19';'f20';'f21';'f22';'f23';'f24'};
    kk(70:82)={'printscreen';'scrolllock';'pause';'insert';'home';'pageup';'deleteforward';'end';'pagedown';'right';'left';'down';'up'};
    kk(84:88)={'/'; '*';'-';'+';'enter'};
    kk(156:158)={'clear';'prior';'return'};
    kk(224:231)={'leftcontrol';'leftshift';'leftalt';'leftgui';'rightcontrol';'rightshift';'rightalt';'rightgui'};
case 'MAC2' % OS 9
    kk = cell(1,127);
    kk([1:10 12:18 32 33 35 36 38 39 41 46 47]) = {'a';'s';'d';'f';'h';'g';'z';'x';'c';'v';'b';'q';'w';'e';'r';'y';'t';'o';'u';'i';'p';'l';'j';'k';'n';'m'}; 
    kk([19:24 26 27 29 30 83:90 92 93]) = {'1';'2';'3';'4';'6';'5';'9';'7';'8';'0';'0';'1';'2';'3';'4';'5';'6';'7';'8';'9'}; 
    kk([97:102 104:2:114 119 121 123])  = {'f5';'f6';'f7';'f3';'f8';'f9';'f11';'f13';'f14';'f10';'f12';'f15';'f4';'f2';'f1';};
    kk([52 49 72 37 54 58]) = {'delete'; 'tab'; 'clear';'return';'esc';'capslock'};
    kk([57 60 59 56 77 115 118]) = {'shift'; 'control';'option';'apple';'enter'; 'help';'del'};
    kk([50 117 122 120 116 124:127]) = {'space';'pageup';'pagedown';'end'; 'home'; 'left';'right';'down';'up'};
    kk([25 28 31 34 40 42:45 48 51 66 68 70 76 79 82]) = {'='; '-'; '['; ']'; char(39); ';'; '\'; ',';  '/'; '.';'`'; '.'; '*'; '+'; '/'; '-'; '='};
otherwise
    error('Unsupported Platform');
end
keyCode(find(keyCode>length(kk)))=[];
key={kk{keyCode}};
