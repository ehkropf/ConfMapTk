classdef corner
% CORNER class represents corners for closed curves.

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
  param
  point
  alpha
end

properties(Access=private)
  % Should probably use metadata.
  prop_list = {'param', 'point', 'alpha'}
end

methods
  function C = corner(cinfo)
    if ~nargin
      return
    end
    
    if isa(cinfo, 'corner')
      C = cinfo;
      return
    end
    
    % Allow cell and structure forms for construction.
    if isa(cinfo, 'struct')
      if ~all(isfield(cinfo, C.prop_list))
        error('Corner information was supplied incorrectly.')
      end
      for prop = C.prop_list
        C.(prop) = cinfo.(prop);
      end
    elseif isa(cinfo, 'cell')
      % Assume order of cell entries.
      for k = 1:numel(C.prop_list)
        C.(C.prop_list{k}) = num2cell(cinfo{k});
      end
    else
    end
  end
end

end
