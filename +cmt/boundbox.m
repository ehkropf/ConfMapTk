function box = boundbox(points)
% BOUNDBOX calculates the bounding box around points.
%
% box = boundbox(points) calculates a bounding box around a set of points
% in the complex plane, and returns coordinates in AXIS format.
%
% See also axis, plotbox.

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

box([1 3]) = min([real(points(:)) imag(points(:))], [], 1);
box([2 4]) = max([real(points(:)) imag(points(:))], [], 1);

end
