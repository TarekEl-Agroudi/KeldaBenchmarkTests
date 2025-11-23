%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% assignAllVariables  Assigns all variables in the caller workspace to the
% base workspace (also known as  assignVariables for the lazyman) 
%
% Syntax
%       assignAllVariables()
%
% Author(s):
%   Vinicius de Oliveira     (vdo)   <vdo@kelda.no>
%
% Revision history:
%   2017/02/09  vdo     Created.
%
%  se also: loadTestVariables()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function assignAllVariables(  )
 list = evalin('caller','who');
            if ~isempty(list)
%                 base_struct = struct();
                for i = 1 : length(list)
                   assignin('base',list{i}, evalin('caller',list{i}));
                end
            end

end

