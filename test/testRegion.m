classdef testRegion < masterTest

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

methods(Test)
    function basicRegionCheck(test)
        c0 = circle(0, 1);
        c1 = circle(0.41+0.16i, 0.24);
        c2 = circle(-0.53+0.09i, 0.12);
        c3 = circle(-0.10-0.34i, 0.25);
        
        r = region(c0, {c1, c2, c3});
        
        cond = hasouter(r) & r.numouter == 1 & hasinner(r) & r.numinner == 3;
        test.verifyTrue(cond);
    end
end

end
