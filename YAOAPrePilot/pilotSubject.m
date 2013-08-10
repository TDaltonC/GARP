function [ output_args ] = pilotSubject(  subjID, item1c, item2c, item3c  )
%PILOTSUBJECT Summary of this function goes here
%   Detailed explanation goes here
RunGARPSubject( subjID, item1c, item2c, item3c );
cd('WMCBatteryMac');
WMCBattery(subjID);
quit;
end

