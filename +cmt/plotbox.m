function box = plotbox(points, scale)
% PLOTBOX returns padded axis coordinates around points.
%
% box = plotbox(points) calculates a 1-by-4 array to pass to AXIS which
% sets a padded square box around the given points.
%
% box = plotbox(points, scale) allows setting the padding scale, which
% defaults to 1.2 times the largest axis of the bounding box.
%
% See also axis, boundbox.

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

if nargin < 2 || isempty(scale)
    scale = 1.2;
end

box = cmt.boundbox(points);

dbox = scale/2*max(diff(box(1:2)), diff(box(3:4)))*[-1 1];

box(1:2) = mean(box(1:2)) + dbox;
box(3:4) = mean(box(3:4)) + dbox;

end
