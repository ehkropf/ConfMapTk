function clearPrefs
% Remove appdata prefs storage.
%
% Needed since "clear classes" complains if any objects are stored
% in appdata.

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

try
    rmappdata(0, 'cmt_prefs')
catch err
    if verLessThan('matlab', '8.4')
        msgid = 'MATLAB:HandleGraphics:Appdata:InvalidNameAppdata';
    else
        msgid = 'MATLAB:HandleGraphics:Appdata:InvalidPropertyName';
    end
    if strcmp(err.identifier, msgid)
        % Nothing there, that's ok.
        return
    else
        rethrow(err)
    end
end

end
