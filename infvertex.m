function v = infvertex(zin, zout)
%INFVERTEX Create a representation of a vertex at infinity.
%   INFVERTEX(ZIN,ZOUT) creates an object that represents a vertex at
%   infinity, with an incoming straight side parallel to ZIN and an
%   outgoing straight side parallel to ZOUT.
%
%   For usage examples see POLYGON.
%
%   See also POLYGON/POLYGON, HOMOG.

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

v = homog([zin, zout], 0);
