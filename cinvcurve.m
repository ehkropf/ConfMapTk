classdef cinvcurve < closedcurve
% CINVCURVE class represents the conjugate inverse of a curve.

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
  theCurve
  confCenter = 0
end

methods
  function C = cinvcurve(curve, confCenter)
    if ~nargin
      return
    end
    
    if ~isa(curve, 'closedcurve')
      error('CMT:InvalidArgument', 'Expected a closedcurve object.')
    end
    if nargin > 1
        if numel(confCenter) == 1 && isfinite(confCenter)
            C.confCenter = confCenter;
        else
            error('CMT:InvalidArgument', ...
                'Expected a finite scalar for a conformal center.')
        end
    end
    
    C.theCurve = curve;
  end
  
  function disp(C)
    fprintf('conjugate inverse of curve:\n')
    disp(C.theCurve)
  end
  
  function z = point(C, t)
    z = 1./conj(point(C.theCurve, t) - C.confCenter);
  end
  
  function zt = tangent(C, t)
    zt = -conj(tangent(C.theCurve, t))./...
        conj(point(C.theCurve, t) - C.confCenter).^2;
  end
end

end
