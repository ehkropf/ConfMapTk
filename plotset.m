classdef plotset < optset
% PLOTSET is plot settings class.
%
% See also optset.

% Copyright 2015 the ConfMapTk project developers. See the COPYRIGHT
% file at the top-level directory of this distribution and at
% https://github.com/ehkropf/ConfMapTk.
%
% This file is part of ConfMapTk. It is subject to the license terms in
% the LICENSE file found in the top-level directory of this distribution
% and at https://github.com/ehkropf/ConfMapTk.  No part of ConfMapTk,
% including this file, may be copied, modified, propagated, or distributed
% except according to the terms contained in the LICENSE file.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the LICENSE
% file.

properties
    lineWidth
    lineColor
    lineSmoothing
    gridColor
end

properties(Access=protected)
    proplist = { ...
        'lineWidth', 0.5, @isnumeric, '[ double {0.5} ]'
        'lineColor', cmtplot.black, [], '[ valid colorspec ]'
        'lineSmoothing', 'on', ...
            @plotset.isOnOff, '[ {on} | off ]'
        'gridColor', cmtplot.grey, [], '[ valid colorspec ]'
    }
end

methods
    function opt = plotset(varargin)
        opt = opt@optset(varargin{:});
    end
    
    function opt = set.lineSmoothing(opt, value)
        opt.lineSmoothing = lower(value);
    end
end

methods(Static, Hidden)
    function tf = isOnOff(s)
        tf = any(strcmpi(s, {'on', 'off'}));
    end
end

end
