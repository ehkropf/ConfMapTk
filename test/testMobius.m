classdef testMobius < masterTest
% Test class for mobius.

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
    maps
    data
end

methods(TestMethodSetup)
    function createMaps(test)
        z3 = [1, 1i, -1];
        w3 = [-1, -2i, 0];
        m1 = mobius(z3, w3);
        s3 = [0, 3, 1i];
        m2 = mobius(w3, s3);
        test.maps = struct('m1', m1, 'm2', m2);
        test.data = struct('z3', z3, 'w3', w3, 's3', s3);
    end
end

methods(Test)
    function basicMobiusCheck(test)
        M = mobius([1, 1i, -1], [0, 5, 7i]);
        R = inv(M);
        cond = isequal(size(M.matrix), [2, 2]) ...
            && isequal(size(R.matrix), [2, 2]);
        test.verifyTrue(cond);
    end
  
    function compositionCheck1(test)
        z3 = test.data.z3;
        m1 = test.maps.m1;
        m2 = test.maps.m2;
        m = m2*m1;
        test.verifyLessThan(norm(m2(m1(z3)).' - m(z3).'), 1e-15)
    end
    
    function compositionCheck2(test)
        z3 = test.data.z3;
        m1 = test.maps.m1;
        m2 = test.maps.m2;
        m = conformalmap(m1, m2);
        test.verifyLessThan(norm(m2(m1(z3)).' - m(z3).'), 1e-15)
    end
    
    function plotCheck(test)
        m1 = test.maps.m1;
        m2 = test.maps.m2;
        h = figure;
        plot(m1)
        clf
        plot(m2*m1)
        close(h)
    end
end

end
