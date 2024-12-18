=begin

Given two strings text1 and text2, return the length of their longest common subsequence. If there is no common subsequence, return 0.

A subsequence of a string is a new string generated from the original string with some characters (can be none) deleted without changing the relative order of the remaining characters.

For example, "ace" is a subsequence of "abcde".
A common subsequence of two strings is a subsequence that is common to both strings.

 

Example 1:

Input: text1 = "abcde", text2 = "ace" 
Output: 3  
Explanation: The longest common subsequence is "ace" and its length is 3.
Example 2:

Input: text1 = "abc", text2 = "abc"
Output: 3
Explanation: The longest common subsequence is "abc" and its length is 3.
Example 3:

Input: text1 = "abc", text2 = "def"
Output: 0
Explanation: There is no such common subsequence, so the result is 0.
 

Constraints:

1 <= text1.length, text2.length <= 1000
text1 and text2 consist of only lowercase English characters.


Hint 1
Try dynamic programming. DP[i][j] represents the longest common subsequence of text1[0 ... i] & text2[0 ... j].
Hint 2
DP[i][j] = DP[i - 1][j - 1] + 1 , if text1[i] == text2[j] DP[i][j] = max(DP[i - 1][j], DP[i][j - 1]) , otherwise
=end

# @param {String} text1
# @param {String} text2
# @return {Integer}
def longest_common_subsequence(text1, text2)
    dp = Array.new(text1.length + 1) { Array.new(text2.length + 1, 0) }

    (1..text1.length).each do |i|
        (1..text2.length).each do |j|
            if text1[i-1] == text2[j-1]
                dp[i][j] = dp[i-1][j-1] + 1
            else
                dp[i][j] = [dp[i - 1][j], dp[i][j - 1]].max
            end
        end
    end
    
    dp[text1.length][text2.length]
end
