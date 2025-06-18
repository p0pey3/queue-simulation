function r = xorshiftr(seed, n)
    %64-bit but split into two 32-bit
    state = [mod(seed, 2^32), mod(seed + 123456789, 2^32)];
    %so seed fits in 32bits
    r = zeros(1, n);

    for i = 1:n
        x = state(1);
        x = mod(x * 2^26 + x, 2^32);           % x ^ (x << 26)
        x = mod(floor(x/2^17) + x, 2^32);      % x ^ (x >> 17)
        x = mod(x * 2^23 + x, 2^32);           % x ^ (x << 23)

        y = state(2);
        state(1) = mod(y + x, 2^32);           % update state
        state(2) = mod(x + y * 2^5, 2^32);     % with rotation

        %1-100
        r(i) = floor(state(1) / 2^32 * 100) + 1;
    end
end
