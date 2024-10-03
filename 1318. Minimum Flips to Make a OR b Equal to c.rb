
=begin
Given 3 positives numbers a, b and c. Return the minimum flips required in some bits of a and b to make ( a OR b == c ). (bitwise OR operation).
Flip operation consists of change any single bit 1 to 0 or change the bit 0 to 1 in their binary representation.

 

Example 1:



Input: a = 2, b = 6, c = 5
Output: 3
Explanation: After flips a = 1 , b = 4 , c = 5 such that (a OR b == c)
Example 2:

Input: a = 4, b = 2, c = 7
Output: 1
Example 3:

Input: a = 1, b = 2, c = 3
Output: 0
 

Constraints:

1 <= a <= 10^9
1 <= b <= 10^9
1 <= c <= 10^9
Seen this question in a real interview before?
1/5
Yes
No
Accepted
142K
Submissions
199.5K
Acceptance Rate
71.2%
Topics
Companies
Hint 1
Check the bits one by one whether they need to be flipped.
=end
# @param {Integer} a
# @param {Integer} b
# @param {Integer} c
# @return {Integer}
def min_flips(a, b, c)
    flips = 0

    (0..31).each do |i|

        bita = (a >> i) & 1
        bitb = (b >> i) & 1
        bitc = (c >> i) & 1

        if bitc == 0
            flips += 1 if bita == 1
            flips += 1 if bitb == 1
        else
            flips += 1 if bita == 0 && bitb == 0
        end
    end

    flips
end

