% This scrip creates a table that contains all of the unique permiations of
% L number of elements from the set of M.


M = 20;
L = 2;
arg=repmat((1:M)',1,L);
arg=mat2cell(arg,M,ones(1,L));
resu=cell(1,L);
[resu{:}]=ndgrid(arg{:});
resu=cell2mat(cellfun(@(x) x(:), resu,'UniformOutput',0));