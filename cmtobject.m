classdef cmtobject
% CMTOBJECT provides some base CMT functionality for classes.

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

methods
    function prefs = get(this, property)
        % Retrieve preference values for module (class) stored in app data
        % facility.
        
        prefs = getappdata(0, 'cmt_prefs');
        module = class(this);

        if isempty(prefs) || ~isfield(prefs, module)
            % Set defaults.
            if isa(property, 'optset')
                set(this, property);
                prefs = getappdata(0, 'cmt_prefs');
            else
                error('CMT:NotDefined', ...
                    'No default values given to set for class %s.', ...
                    module)
            end
        end
        
        if isfield(prefs, module)
            prefs = prefs.(module);
        else
            % This shouldn't actually happen.
            error('CMT:NotDefined', ...
                'Unable to retreive app data for class %s.', ...
                module)
        end
        
        if nargin > 1 && ischar(property)
           if isprop(prefs, property)
               prefs = prefs.(property);
           else
               error('CMT:NotDefined', ...
                   'Property %s not defined for class %s%.', ...
                   property, module)
           end
        end
    end
    
    function set(this, varargin)
        % Store preferences for module (class) in app data facility.
        
        prefs = getappdata(0, 'cmt_prefs');        
        module = class(this);
        
        if numel(varargin) == 1
            if isa(varargin{1}, 'optset')
                % Set default.
                prefs.(module) = varargin{1};
                varargin = {};
            else
                error('CMT:InvalidArgument', ...
                    'Expected an optset object.')
            end
        end
                
        prefs.(module) = set(prefs.(module), varargin{:});        
        setappdata(0, 'cmt_prefs', prefs);
    end
end

end
