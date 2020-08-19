function [in, expected, actual] = submit(function_name)
% Perform a test to see if the given function generates the right outputs for
% the given input. Inputs and outputs are predefined in a .mat file that is
% located in the same folder and has the same name (except the extension) as the
% funtion being checked.
%
% NOTE: This function expects a path to a file - relative or absolute.
assert(nargin ~= 0, "Wrong number of input arguments.")
narginchk(1,2);

[fpath, fname, fext] = fileparts(function_name);
assert(isempty(fext) || fext == '.m', 'No extension or .m extension was expected.)')

% Go to the dir where the funciton is
old_dir = pwd(); % remember for later
cd(fpath)

% Files validation

results = glob(sprintf('tests/%s.*.result.mat', fname));

assert(size(results, 1) > 0, sprintf('a matching %s.<N>.result.mat file not found in tests/ subfolder where function is located', fname));

total_result = true;

fprintf('Testing %s\n', fname);

for N=1:size(results,1);
    fprintf('--- Test case %02d ---\n', N);
    results_file = results(N){1};

    % Read the info from result spec
    res = load(results_file);

    % Read function inputs
    inputs = res.inputs;

    % Read expected function outputs
    exp_outputs = res.outputs;

    % Read epsilon
    if isfield(res, 'epsilon')
        epsilon = res.epsilon;
    else
        epsilon = 1e-8;
    endif

    % Generate function outputs for comparison
    num_outputs = numel(exp_outputs);
    candidate_outputs = cell(1, num_outputs);
    [candidate_outputs{:}] = feval(fname, inputs{:});

    assert(num_outputs == numel(candidate_outputs),
      sprintf('Function returned %d outputs, expected %d.', num_outputs, numel(candidate_outputs)))

    correct_num_outputs = 3 == nargout;

    for ii = 1 : num_outputs
      missmatches = abs(candidate_outputs{ii} - exp_outputs{ii}) > epsilon;
      s = sum(missmatches(:));
      if (0 == s)
        fprintf('    Success!\n');
      else
        fprintf('    Outputs mismatch.\n');
        total_result = false;

        if ~correct_num_outputs
            fprintf('         Call the script like this to get the expected and actual outputs:\n');
            fprintf('         [input, expected, actual] = submit(file_name);\n');
        else 
          expected = exp_outputs;
          actual = candidate_outputs;
          in = inputs;
        endif

        return;

     endif
    endfor

    % TODO: do we need this when we have good result?
    if correct_num_outputs
      expected = exp_outputs;
      actual = candidate_outputs;
      in = inputs;
    endif
endfor


if total_result
    fprintf('--- ALL TESTS SUCCESSFUL ---\n');
else
    fprintf('--- SOME TESTS FAILED ---\n');
endif

% Return to original dir
cd(old_dir)

endfunction
