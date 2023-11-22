% Note:
% if the Markov chain has more than 1 absorbing state the third argument
% must be a vector with the absorbing states
% for example in a chain with 5 states and considering that
% states 4 and 5 are absorbing states:
% state = crawl(H5, 1, [4 5])
%
% Random walk on the Markov chain
% Inputs:
% H - state transition matrix
% first - initial state
% last - terminal or absorving state
%
% Random walk on the Markov chain
% Inputs:
% H - state transition matrix
% first - initial state
% last - terminal or absorving state
function [state] = crawl(H, first, last)
    % the sequence of states will be saved in the vector "state"
    % initially, the vector contains only the initial state:
    state = [first];
    % keep moving from state to state until state "last" is reached:
    while (1)
        state(end+1) = nextState(H, state(end));
        if ismember(state(end), last) % verifies if state(end) is absorbing
            break;
        end
    end
end