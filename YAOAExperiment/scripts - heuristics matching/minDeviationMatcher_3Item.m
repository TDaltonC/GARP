function [ heuristic, deviation ] = minDeviationMatcher_3Item( mindeviation, strategy1deviation, strategy2deviation, strategy3deviation,...
    strategy4deviation, strategy5deviation, strategy6deviation, strategy7deviation, strategy8deviation, strategy9deviation, strategy10deviation);

%UNTITLED12 Summary of this function goes here
%   Detailed explanation goes here

if mindeviation == strategy1deviation;
    heuristic = 1;
    deviation = strategy1deviation;
elseif mindeviation == strategy2deviation;
    heuristic = 2;
    deviation = strategy2deviation;
elseif mindeviation == strategy3deviation;
    heuristic = 3;
    deviation = strategy3deviation;
elseif mindeviation == strategy4deviation;
    heuristic = 4;
    deviation = strategy4deviation;
elseif mindeviation == strategy5deviation;
    heuristic = 5;
    deviation = strategy5deviation;
elseif mindeviation == strategy6deviation;
    heuristic = 6;
    deviation = strategy6deviation;
elseif mindeviation == strategy7deviation;
    heuristic = 7;
    deviation = strategy7deviation;
elseif mindeviation == strategy8deviation;
    heuristic = 8;
    deviation = strategy8deviation;
elseif mindeviation == strategy9deviation;
    heuristic = 9;
    deviation = strategy9deviation;
elseif mindeviation == strategy10deviation;
    heuristic = 10;
    deviation = strategy10deviation;
end

end

