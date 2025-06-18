function r = xorshiftR_plus(seed, n)
    % XorshiftR+ implementation for CMA6134 Assignment
    % Input: 
    %   seed - integer seed (e.g., 42)
    %   n    - number of random values (1-100) to generate
    % Output:
    %   r    - array of random integers 1-100

    % FreeMat workaround: avoid bitwise ops
    state = [mod(seed, 2^32), mod(seed + 123456789, 2^32)];
    r = zeros(1, n);

    for i = 1:n
        % XorshiftR+ core (arithmetic-only for FreeMat)
        x = state(1);
        x = mod(x * 2^26 + x, 2^32);           % x ^ (x << 26)
        x = mod(floor(x/2^17) + x, 2^32);      % x ^ (x >> 17)
        x = mod(x * 2^23 + x, 2^32);           % x ^ (x << 23)

        y = state(2);
        state(1) = mod(y + x, 2^32);           % Update state
        state(2) = mod(x + y * 2^5, 2^32);     % With rotation

        % Scale to 1-100
        r(i) = floor(state(1) / 2^32 * 100) + 1;
    end
end