
if exist('item1c','var') == 0; item1c = 11; end
if exist('item2c','var') == 0; item2c = 12; end
if exist('item3c','var') == 0; item3c = 13; end
if exist('item4c','var') == 0; item4c = 14; end
if exist('item5c','var') == 0; item5c = 15; end
if exist('item6c','var') == 0; item6c = 16; end
if exist('item7c','var') == 0; item7c = 17; end
if exist('item8c','var') == 0; item8c = 18; end
if exist('item9c','var') == 0; item9c = 19; end


items = [item1c, item2c, item3c, item4c, item5c, item6c, item7c, item8c, item9c];
itemOrder = randperm(length(items));

itemsOut = items (itemOrder);