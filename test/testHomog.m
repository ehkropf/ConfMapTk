classdef testHomog < masterTest
% Unit tests for HOMOG class.

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
    function createHomogNumbers(test)
        h = [0; homog(1,0); homog(1i,0); 1i];
        test.verifyEqual(double(h), [0; Inf; Inf; 1i]);
    end
    
    function checkHomogAngle(test)
        h = [0; homog(1,0); homog(1i,0); 1i];
        test.verifyEqual(angle(h), pi/2*[0; 0; 1; 1]);
    end
end

end
