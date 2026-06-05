/**
 * @param {number} num1
 * @param {number} num2
 * @return {number}
 */
var totalWaviness = function(num1, num2) {
    function solve(s) {
        const n = s.length;
        const memo = Array.from({ length: n }, () =>
            Array.from({ length: 11 }, () =>
                Array.from({ length: 11 }, () => new Array(2).fill(null))
            )
        );

        function dfs(idx, prev, prev_prev, tight, started) {
            if (idx === n) {
                return [1n, 0n];
            }

            const startedIdx = started ? 1 : 0;
            if (!tight && memo[idx][prev][prev_prev][startedIdx] !== null) {
                return memo[idx][prev][prev_prev][startedIdx];
            }

            const limit = tight ? parseInt(s[idx]) : 9;
            let ways = 0n;
            let waviness = 0n;

            for (let d = 0; d <= limit; d++) {
                const next_tight = tight && (d === limit);
                const next_started = started || (d > 0);
                const next_prev = next_started ? d : 10;
                const next_prev_prev = next_started ? (started ? prev : 10) : 10;

                let added = 0n;
                if (started && prev_prev !== 10) {
                    if ((prev > prev_prev && prev > d) || (prev < prev_prev && prev < d)) {
                        added = 1n;
                    }
                }

                const [sub_ways, sub_wav] = dfs(idx + 1, next_prev, next_prev_prev, next_tight, next_started);
                ways += sub_ways;
                waviness += sub_wav + added * sub_ways;
            }

            if (!tight) {
                memo[idx][prev][prev_prev][startedIdx] = [ways, waviness];
            }

            return [ways, waviness];
        }

        return dfs(0, 10, 10, true, false)[1];
    }

    const s2 = num2.toString();
    const s1 = (BigInt(num1) - 1n).toString();

    const ans = solve(s2) - solve(s1);
    return Number(ans);
};