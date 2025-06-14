function r = pcg(seed, n)
%   r = pcg(seed, n) returns n integers in [1, 100] using PCG logic
%   dogwater freemat doesnt allow bit-wise operations apparently

    % Constants for pcg (at least on the website)
    multiplier = 6364136223846793005;     %multiplier used for LCG
    increment  = 1442695040888963407;     %selects the way to generate independent random num
    mod64      = 2^64;

    % Initial state
    state = mod(seed, mod64);

    r = zeros(1, n);

    for k = 1:n
        % Update state with the formula from the website
        state = mod(multiplier * state + increment, mod64);

        % xor shifts the bits to the right by 18 and then 27 bits.
        shifted1 = floor(state / 2^18);          % divide the current state with 18 bits to shift it 18 units
        xored    = mod(shifted1 + state, mod64);  % simulate XOR via mod
        xorshifted = floor(xored / 2^27);         %shift it by 27 bits 

        % decide how many bits to rotate, get this by using the upper 5 bits of state
        rot = floor(state / 2^59);    % since state is 64 bit, dividing it with the lower 59 bits should give u the upper 5
        rot = mod(rot, 32);           % make sure that the derived num is within 0-31, since thats the bit length of the final random num 

        % Simulate rotate-right of 32-bit value
        val = mod(floor(xorshifted / 2^rot) + ...
                  mod(xorshifted, 2^rot) * 2^(32 - rot), 2^32);

        % Scale to [1, 100]
        r(k) = floor(mod(val, 100))+1;
    end
end
