classdef testPolygon < masterTest
% Test class for polygon class

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
    function basicPolygonCheck(test)
        p1 = polygon([0, 1, 1+1i, 1i]);
        % Took out because polygon temporarily changed to match SCT.
        %     p2 = polygon([0, homog(1, 0), homog(1i, 0)]);
        cond = sum(angle(p1)) == 2; % && sum(angle(p2)) == 0;
        test.verifyTrue(cond);
    end
end

end
