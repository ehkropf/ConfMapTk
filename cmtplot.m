classdef cmtplot < cmtobject
% CMTPLOT collects common CMT plot tasks.
%
% This is probably more convoluted than it needs to be.

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

properties(Constant)
    % colors
    black = 'k'
    grey = 0.75*[1, 1, 1]
    none = 'none'
end

methods
    function p = cmtplot
        % This is here to allow get/set functionality.

        get(p, plotset);
    end
end

methods(Static)
    function [args, exargs] = closedcurveArgs(varargin)
        opts = get(cmtplot);
        if nargout > 1
            [opts, exargs] = set(opts, varargin{:});
        else
            opts = set(opts, varargin{:});
        end
        args = { ...
            'color', opts.lineColor, ...
            'linewidth', opts.lineWidth ...
        };
        if ~cmtplot.hasNewGraphics
            args(5:6) = {'linesmoothing', opts.lineSmoothing};
        end
    end

    function args = fillargs()
        args = {cmtplot.fillcolor, 'edgecolor', cmtplot.filledgecolor};
    end

    function c = fillcolor()
        c = cmtplot.grey;
    end

    function c = filledgecolor()
        c = cmtplot.none;
    end

    function [args, exargs] = gridArgs(varargin)
        opts = get(cmtplot);
        if nargout < 2
            opts = set(opts, varargin{:});
        else
            [opts, exargs] = set(opts, varargin{:});
        end
        args = {
            'color', opts.gridColor, ...
            'linewidth', opts.lineWidth ...
        };
        if ~cmtplot.hasNewGraphics
            args(5:6) = {'linesmoothing', opts.lineSmoothing};
        end
    end
    
    function tf = hasNewGraphics()
        tf = ~verLessThan('matlab', '8.4');
    end
    
    function tf = isFigHandle(val)
        if exist('isgraphics', 'builtin') == 5
            tf = isgraphics(val, 'figure');
        else
            % Revert to older way.
            if ishghandle(tmp)
            	tf = strcmp(get(tmp, 'type'), 'figure');
            else
                tf = false;
            end
        end
    end
    
    function whitefigure(fig)
        if ~nargin
            fig = gcf;
        end
        set(fig, 'color', 'white');
    end
end
    
end
