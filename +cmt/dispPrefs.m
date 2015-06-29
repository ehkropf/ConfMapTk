function dispPrefs
% Preference dump to console.

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

prefs = getappdata(0, 'cmt_prefs');
if isempty(prefs)
    fprintf('No CMT preferences found.\n')
    return
end

fn = fieldnames(prefs);
for k = 1:numel(fn)
    fprintf(['\n==========================\n' ...
        ' For class %s:\n' ...
        '--------------------------\n'], fn{k})
    disp(prefs.(fn{k}))
end

end
