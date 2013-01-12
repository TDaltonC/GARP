% 
% Usage: [key, timeSecs] = WaitTill (endSecs [, keys, keyReturn]);
%
% Wait till endSecs and/or keys are pressed.
% Return the first pressed key, if any, and time.
% If optional keys is provided, only provided keys will be detected.
% If keyReturn is nonzero, WaitTill returns immaturely 
% when a matched key is detected.
% This calls KbCheck.
% To wait s second, use WaitTill (GetSecs+s);
% ESC will abort execution if 'esc' is not included in keys.
% XL, 2006-04-04

function [key, timeSecs] = WaitTill (endSecs, keys, keyReturn)
if nargin<2, keys=[]; end
if nargin<1 || isempty(endSecs), endSecs=inf; end
tt=GetSecs; timeSecs=endSecs; key=[];
while tt<endSecs
    [kk, tt] = readKey(keys);
    if ~isempty(kk) && isempty(key) 
        key=kk; timeSecs=tt;
        if nargin>2 && keyReturn, break; end
    end
    WaitSecs(0.001);
end
return;

